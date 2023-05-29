import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/models/employee_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/tools_model.dart';
import '../../domain/models/work_type_model.dart';
import '../job_details/job_details_presenter.dart';
import '../job_list/job_list_presenter.dart';
import '../navigators/app_pages.dart';
import 'edit_job_presenter.dart';
import 'views/widgets/job_updated_dialog.dart';

class EditJobController extends GetxController {
  ///
  EditJobController(
    this.editJobPresenter,
    this.homePresenter,
    this.jobListPresenter,
    this.jobDetailsPresenter,
  );
  EditJobPresenter editJobPresenter;
  HomePresenter homePresenter;
  JobListPresenter jobListPresenter;
  JobDetailsPresenter jobDetailsPresenter;
  HomeController homeController = Get.find<HomeController>();

  ///
  RxList<JobModel?>? jobList = <JobModel?>[].obs;
  RxList<JobDetailsModel?>? jobDetailsList = <JobDetailsModel?>[].obs;
  RxList<AssociatedPermit>? associatedPermitList = <AssociatedPermit>[].obs;

  //
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedFacilityName = ''.obs;
  Rx<bool> isFacilitySelected = true.obs;
  int selectedFacilityId = 0;

  //
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isBlockSelected = true.obs;
  int selectedBlockId = 0;

  //
  Rx<String> selectedWorkTypeCategory = ''.obs;
  Rx<bool> isWorkTypeSelected = true.obs;
  Rx<bool> isWorkTypeCategorySelected = false.obs;
  RxList<WorkTypeModel?> selectedWorkTypeList = <WorkTypeModel>[].obs;
  RxList<WorkTypeModel?> workTypeList = <WorkTypeModel>[].obs;
  RxList<int> selectedWorkTypeIdList = <int>[].obs;

  //
  Rx<String> selectedWorkArea = ''.obs;
  Rx<bool> isWorkAreaSelected = true.obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<InventoryModel?> selectedWorkAreaList = <InventoryModel>[].obs;
  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;
  List<int> selectedAssetsIdList = [];

  //
  Rx<String> selectedEquipmentCategory = ''.obs;
  Rx<bool> isEquipmentCategorySelected = true.obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  //
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;

  //
  Rx<String> selectedToolRequiredToWorkType = ''.obs;
  Rx<bool> isToolRequiredToWorkTypeSelected = false.obs;
  RxList<ToolsModel?>? toolsRequiredToWorkTypeList = <ToolsModel>[].obs;
  RxList<String?> selectedtoolsRequiredToWorkTypeList = <String>[].obs;
  RxList<int?> selectedtoolsRequiredToWorkTypeIdList = <int>[].obs;

  ///
  int selectedPermitId = 0;
  int facilityId = 0;
  int blockId = 72;
  List<int> categoryIds = <int>[];
  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isJobTitleInvalid = false.obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;
  var breakdownTime;
  var jobDescriptionCtrlr = TextEditingController();
  var jobTitleCtrlr = TextEditingController();
  var breakdownTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  Rx<int> jobID = 0.obs;
  HtmlEscape htmlEscape = HtmlEscape();

  StreamSubscription<int>? facilityIdStreamSubscription;

  ///
  @override
  void onInit() async {
    try {
      await setJobId();
      //
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        selectedFacilityId = event;
        if (selectedFacilityId > 0) {
          isFacilitySelected.value = true;
        }
        await getJobDetails(jobID.value);
        await getFacilityList();
        await getBlocksList(selectedFacilityId);
        await getInventoryCategoryList(selectedFacilityId.toString());
        await getInventoryList(
          facilityId: selectedFacilityId,
          blockId: selectedBlockId,
        );
        await getWorkTypeList();
        await getAssignedToList();
      });
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  ///
  Future<void> setJobId() async {
    final _flutterSecureStorage = const FlutterSecureStorage();
    String? _jobId = '';
    // Read jobId from storage
    _jobId = await _flutterSecureStorage.read(key: "jobId");

    // If jobId is unavailable, take it from the arguments received
    if (_jobId == null || _jobId == '' || _jobId == "null") {
      var data = Get.arguments;
      jobID.value = data["jobId"];
      // Update jobId in storage with the new value
      await _flutterSecureStorage.write(
        key: "jobId",
        value: jobID.value == null ? '' : jobID.value.toString(),
      );
    } else {
      jobID.value = int.tryParse(_jobId) ?? 0;
    }
    await _flutterSecureStorage.delete(key: "jobId");
  }

  Future<void> getJobDetails(int _jobId) async {
    jobDetailsList?.value = <JobDetailsModel>[];
    final _jobDetailsList =
        await jobDetailsPresenter.getJobDetails(jobId: _jobId);

    if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
      jobDetailsModel.value = _jobDetailsList[0];
      update(["jobDetailsModel"]);
      // Fill Job Title and Job Description and Breakdown Time
      jobTitleCtrlr.text = jobDetailsModel.value?.jobTitle ?? '';
      jobDescriptionCtrlr.text = jobDetailsModel.value?.jobDescription ?? '';
      breakdownTimeCtrlr.text =
          formatDateTimeForUI(jobDetailsModel.value?.breakdownTime);
      // jobDetailsModel.value.workType
    }

    associatedPermitList?.value =
        jobDetailsModel.value?.associatedPermitList ?? <AssociatedPermit>[];
  }

  String formatDateTimeForUI(timestamp) {
    // Format the DateTime object without milliseconds
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    String formattedDateTime = formatter.format(timestamp);
    return formattedDateTime;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await jobListPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacilityName.value = jobDetailsModel.value?.facilityName ?? '';
      selectedFacilityId = jobDetailsModel.value?.facilityId ?? 0;
    }
  }

  Future<void> getBlocksList(int _facilityId) async {
    final _blockList =
        await editJobPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      selectedBlock.value = jobDetailsModel.value?.blockName ?? '';
      selectedBlockId = jobDetailsModel.value?.blockId ?? 0;
    }
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList = await editJobPresenter.getAssignedToList(
      facilityId: selectedFacilityId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
      selectedAssignedTo.value =
          getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
    }
  }

  Future<void> getToolsRequiredToWorkTypeList(workTypeIds) async {
    final list = await editJobPresenter.getToolsRequiredToWorkTypeList(
      isLoading: true,
      workTypeIds: workTypeIds,
    );
    toolsRequiredToWorkTypeList?.value = list ?? <ToolsModel>[];
    update(['toolsRequiredToWorkTypeList']);
  }

  Future<void> getInventoryCategoryList(String? facilityId) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    selectedEquipmentCategoryList.value = <InventoryCategoryModel>[];

    //
    final _equipmentCategoryList =
        await editJobPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }

      if (jobDetailsModel.value?.equipmentCatList != null)
        for (var equipCat in jobDetailsModel.value?.equipmentCatList ?? []) {
          InventoryCategoryModel equipmentCategory = InventoryCategoryModel(
            id: equipCat.equipmentCatId,
            name: equipCat.equipmentCatName,
          );
          selectedEquipmentCategoryList.add(equipmentCategory);
          selectedEquipmentCategoryIdList.add(equipmentCategory.id);
          update();
        }
    }
  }

  Future<void> getInventoryList({
    int? facilityId,
    int? blockId,
  }) async {
    selectedWorkAreaIdList.clear();
    categoryIds = selectedEquipmentCategoryIdList;
    String lststrCategoryIds = categoryIds.join(', ').toString();
    final _workAreaList = await homePresenter.getInventoryList(
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: lststrCategoryIds,
      isLoading: true,
    );
    if (_workAreaList.isNotEmpty) {
      workAreaList.value = _workAreaList;
      if (jobDetailsModel.value?.workingAreaList != null)
        for (var _workArea in jobDetailsModel.value?.workingAreaList ?? []) {
          int _selectedWorkAreaId = _workArea.workingAreaId ?? 0;
          if (_selectedWorkAreaId > 0) {
            selectedWorkAreaIdList.add(_selectedWorkAreaId);
          }
          update();
        }
    }
  }

  Future<void> getWorkTypeList({
    List<int>? categoryIds,
  }) async {
    try {
      workTypeList.clear();
      selectedWorkTypeList.clear();
      selectedWorkTypeIdList.clear();

      ///
      categoryIds = selectedEquipmentCategoryIdList;
      String lststrCategoryIds = categoryIds.join(', ').toString();
      final _workTypeList = await editJobPresenter.getWorkTypeList(
        categoryIds: lststrCategoryIds,
        isLoading: true,
      );
      //bind worktype list
      if (_workTypeList != null) {
        workTypeList.value = _workTypeList ?? <WorkTypeModel>[];
      }
      // pre-fill worktype values
      if (jobDetailsModel.value?.workTypeList != null)
        for (var _workType in jobDetailsModel.value?.workTypeList ?? []) {
          WorkTypeModel workType = WorkTypeModel(
            id: _workType.workTypeId,
            workType: _workType.workTypeName,
          );
          selectedWorkTypeList.add(workType);
          selectedWorkTypeIdList.add(workType.id ?? 0);
        }
      update();
    } //
    catch (e) {
      print(e);
    }
  }

  void checkForm() {
    if (selectedAssignedTo.value == '') {
      isAssignedToSelected.value = false;
    }
    if (selectedBlock.value == '') {
      isBlockSelected.value = false;
    }
    if (selectedWorkTypeIdList.length < 1) {
      isWorkTypeSelected.value = false;
    }
    if (selectedEquipmentCategoryIdList.length < 1) {
      isEquipmentCategorySelected.value = false;
    }
    if (selectedWorkAreaIdList.length < 1) {
      isWorkAreaSelected.value = false;
    }

    if (jobTitleCtrlr.text.trim().length < 3) {
      isJobTitleInvalid.value = true;
    }
    if (jobDescriptionCtrlr.text.trim().length < 3) {
      isJobDescriptionInvalid.value = true;
    }
    if (isFacilitySelected.value == false ||
        isBlockSelected.value == false ||
        isJobTitleInvalid.value == true ||
        isJobDescriptionInvalid == true ||
        isEquipmentCategorySelected.value == false ||
        isWorkAreaSelected.value == false ||
        isWorkTypeSelected.value == false) //
    {
      isFormInvalid.value = true;
    } //
    else {
      isFormInvalid.value = false;
    }
  }

  String convertDateTimeToAPIFormat() {
    var _breakdownTime = breakdownTimeCtrlr.text;
    // Parse the timestamp string into a DateTime object
    DateTime parsedDateTime = DateTime.parse(_breakdownTime);
    // Format the DateTime object with the desired format
    DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    String formattedDateTime = formatter.format(parsedDateTime.toUtc());
    return formattedDateTime;
  }

  String? getAssignedToName(int _selectedAssignedToId) {
    final item =
        assignedToList.firstWhere((item) => item?.id == _selectedAssignedToId);
    final _selectedAssignedToName = item?.name ?? '';
    return _selectedAssignedToName;
  }

  int? getAssignedToId(String _selectedAssignedToName) {
    final item = assignedToList
        .firstWhere((item) => item?.name == _selectedAssignedToName);
    final _selectedAssignedToId = item?.id ?? 0;
    return _selectedAssignedToId;
  }

  void assignReAssignJob() async {
    try {
      Map<String, dynamic>? responseMapJobUpdated =
          await editJobPresenter.assignReAssignJob(
        jobId: jobID.value,
        assignedToId: selectedAssignedToId,
        isLoading: false,
      );
      if (responseMapJobUpdated != null && responseMapJobUpdated.length > 0) {
        var _jobId = 0;
        var _message = '';
        if (responseMapJobUpdated["id"] != null &&
            responseMapJobUpdated["id"].isNotEmpty) {
          _jobId = responseMapJobUpdated["id"][0];
        }
        if (responseMapJobUpdated["message"] != null) {
          _message = responseMapJobUpdated["message"];
        }
        showAlertDialog(jobId: _jobId, message: _message);
      }
    } //
    catch (e) {
      Utility.showDialog(e.toString() + ' assignReAssignJob');
    }
  }

  void updateJob() async {
    try {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      //
      if (selectedAssignedToId <= 0) {
        selectedAssignedToId = getAssignedToId(selectedAssignedTo.value) ?? 0;
      }
      int _permitId = selectedPermitId;
      String _title = htmlEscape.convert(jobTitleCtrlr.text.trim());
      String _description = htmlEscape.convert(jobDescriptionCtrlr.text.trim());
      String _breakdownTime = convertDateTimeToAPIFormat();
      selectedAssetsIdList.clear();

      for (var _selectedWorkArea in selectedWorkAreaList) {
        selectedAssetsIdList.add(_selectedWorkArea?.id ?? 0);
      }

      AddJobModel addJobModel = AddJobModel(
        id: jobID.value,
        facilityId: selectedFacilityId,
        blockId: selectedBlockId,
        permitId: _permitId,
        assignedId: selectedAssignedToId,
        title: _title,
        description: _description,
        breakdownTime: _breakdownTime,
        assetsIds: selectedAssetsIdList,
        workTypeIds: selectedWorkAreaIdList,
      );

      Map<String, dynamic>? responseMapJobUpdated =
          await editJobPresenter.updateJob(
        job: addJobModel,
        isLoading: false,
      );
      if (responseMapJobUpdated != null) {
        var _jobId = 0;
        var _message = '';
        if (responseMapJobUpdated["id"] != null &&
            responseMapJobUpdated["id"].isNotEmpty) {
          _jobId = responseMapJobUpdated["id"][0];
        }
        if (responseMapJobUpdated["message"] != null) {
          _message = responseMapJobUpdated["message"];
        }
        showAlertDialog(jobId: _jobId, message: _message);
      }
    } //
    catch (e) {
      Utility.showDialog(e.toString() + ' updateJob');
    }
  }

  void onDropdownValueChanged(list, value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
          if (selectedFacilityId > 0) {
            isFacilitySelected.value = true;
          }
          selectedFacilityName.value = value;
          getBlocksList(selectedFacilityId);
        }
        break;

      case RxList<BlockModel>:
        {
          int blockIndex = blockList.indexWhere((x) => x?.name == value);
          selectedBlockId = blockList[blockIndex]?.id ?? 0;
          if (selectedBlockId > 0) {
            isBlockSelected.value = true;
          }
          selectedBlock.value = value;
          getInventoryCategoryList(selectedBlockId.toString());
        }
        break;

      case RxList<EmployeeModel>:
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId > 0) {
            isAssignedToSelected.value = true;
          }
          selectedAssignedTo.value = value;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
    getInventoryList(facilityId: facilityId, blockId: selectedBlockId);
    getWorkTypeList(categoryIds: selectedEquipmentCategoryIdList);
  }

  void workAreasSelected(_selectedWorkAreaIdsList) {
    selectedWorkAreaList.clear();
    for (var selectedWorkAreaId in _selectedWorkAreaIdsList) {
      int workAreaIndex =
          workAreaList.indexWhere((x) => x?.id == selectedWorkAreaId);
      var workArea = workAreaList[workAreaIndex];
      selectedWorkAreaList.add(workArea);
    }
  }

  void workTypesSelected(_selectedWorkTypeIdList) {
    selectedWorkTypeList.clear();
    selectedWorkTypeIdList.clear();

    for (var _selectedWorkTypeId in _selectedWorkTypeIdList) {
      int workTypeIndex =
          workTypeList.indexWhere((x) => x?.id == _selectedWorkTypeId);
      var workType = workTypeList[workTypeIndex];
      selectedWorkTypeList.add(workType);
      selectedWorkTypeIdList.add(_selectedWorkTypeId);
    }

    String lststrWorkTypeIds = selectedWorkTypeIdList.join(', ').toString();
    getToolsRequiredToWorkTypeList(lststrWorkTypeIds);
  }

  /// Show alert dialog
  static void showAlertDialog({
    int? jobId,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(JobUpdatedDialog(jobId: jobId, message: message));
  }

  ///
  goToAddJobScreen() {
    Get.offAndToNamed(Routes.addJob);
  }

  goToJobDetailsScreen(int _jobId) {
    Get.back();
    Get.toNamed(Routes.jobDetails, arguments: {"jobId": _jobId});
  }

  goToJobListScreen() {
    Get.offAllNamed(Routes.jobList);
  }

  ///
}
