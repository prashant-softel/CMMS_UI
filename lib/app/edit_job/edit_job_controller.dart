import 'dart:async';

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
import '../widgets/job_saved_dialog.dart';
import 'edit_job_presenter.dart';

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

  StreamSubscription<int>? facilityIdStreamSubscription;

  ///
  @override
  void onInit() async {
    try {
      final _flutterSecureStorage = const FlutterSecureStorage();
      // Read jobId
      String? _jobId = await _flutterSecureStorage.read(key: "jobId");
      if (_jobId == null || _jobId == '' || _jobId == "null") {
        jobID.value = Get.arguments["jobId"];
        await _flutterSecureStorage.write(
          key: "jobId",
          value: jobID.value == null ? '' : jobID.value.toString(),
        );
      } else {
        jobID.value = int.tryParse(_jobId) ?? 0;
      }
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
          formatDateTime(jobDetailsModel.value?.breakdownTime);
    }

    associatedPermitList?.value =
        jobDetailsModel.value?.associatedPermitList ?? <AssociatedPermit>[];
  }

  String formatDateTime(timestamp) {
    // Format the DateTime object without milliseconds
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
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
    final _assignedToList = await editJobPresenter.getAssignedToList(
      facilityId: selectedFacilityId,
    );

    if (_assignedToList != null) {
      for (var block in _assignedToList) {
        assignedToList.add(block);
      }
      selectedAssignedTo.value = jobDetailsModel.value?.assignedName ?? '';
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
    categoryIds = selectedEquipmentCategoryIdList;
    String lststrCategoryIds = categoryIds.join(', ').toString();
    final _workAreaList = await homePresenter.getInventoryList(
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: lststrCategoryIds,
      isLoading: true,
    );
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

  Future<void> getWorkTypeList({
    List<int>? categoryIds,
  }) async {
    //String lststrCategoryIds = categoryIds?.join(', ').toString() ?? '';
    categoryIds = selectedEquipmentCategoryIdList;
    String lststrCategoryIds = categoryIds.join(', ').toString();
    final _workTypeList = await editJobPresenter.getWorkTypeList(
      categoryIds: lststrCategoryIds,
      isLoading: true,
    );
    workTypeList.value = _workTypeList ?? <WorkTypeModel>[];
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
    if (selectedWorkAreaList.length < 1) {
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

  String getFormattedBreakdownTime() {
    var _breakdownTime = breakdownTimeCtrlr.text;
    // Parse the timestamp string into a DateTime object
    DateTime parsedDateTime = DateTime.parse(_breakdownTime);
    // Format the DateTime object with the desired format
    DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    String formattedDateTime = formatter.format(parsedDateTime.toUtc());
    return formattedDateTime;
  }

  int? getAssignedToId(String selectedValue) {
    final item =
        assignedToList.firstWhere((item) => item?.name == selectedValue);
    final _assignedToId = item?.id ?? 0;
    return _assignedToId;
  }

  void updateJob() async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      //
      if (selectedAssignedToId <= 0) {
        getAssignedToId(selectedAssignedTo.value);
      }
      int _permitId = selectedPermitId;
      String _title = jobTitleCtrlr.text.trim();
      String _description = jobDescriptionCtrlr.text.trim();
      String _breakdownTime = getFormattedBreakdownTime();
      List<AssetsId> assetIds = <AssetsId>[];

      for (var _selectedWorkArea in selectedWorkAreaList) {
        var json = '{"asset_id": ${_selectedWorkArea?.id},'
            '"category_ids": ${_selectedWorkArea?.categoryId}}';

        AssetsId _assetId = addAssetsIdFromJson(json);
        assetIds.add(_assetId);
      }

      AddJobModel addJobModel = AddJobModel(
        facilityId: selectedFacilityId,
        blockId: selectedBlockId,
        permitId: _permitId,
        assignedId: selectedAssignedToId,
        title: _title,
        description: _description,
        status: 2,
        createdBy: 2,
        breakdownTime: _breakdownTime,
        assetsIds: assetIds,
        workTypeIds: selectedWorkAreaIdList,
      );
      // var jobJsonString = addJobModelToJson(addJobModel);

      Map<String, dynamic>? responseMapJobCreated =
          await editJobPresenter.updateJob(
        job: addJobModel,
        isLoading: false,
      );
      var _jobId = responseMapJobCreated["id"][0];
      // intJobId.value = _jobId; // intJobId is used in the UI (popup)
      showAlertDialog(jobId: _jobId);
    }
  }

  void onValueChanged(list, value) {
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

      case RxList<InventoryModel>:
        {
          selectedWorkAreaIdList.value = <int>[];
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            int _selectedworkAreaId = workAreaList[workAreaIndex]?.id ?? 0;
            selectedWorkAreaIdList.add(_selectedworkAreaId);
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          selectedEquipmentCategoryIdList.value = <int>[];
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex = selectedEquipmentCategoryList
                .indexWhere((x) => x?.name == equipCat);
            int _selectedEquipmentCategoryId =
                equipmentCategoryList[equipCatIndex]?.id ?? 0;
            selectedEquipmentCategoryIdList.add(_selectedEquipmentCategoryId);
          }
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
    selectedWorkAreaList.value = <InventoryModel>[];
    for (var selectedWorkAreaId in _selectedWorkAreaIdsList) {
      int workAreaIndex =
          workAreaList.indexWhere((x) => x?.id == selectedWorkAreaId);
      var workArea = workAreaList[workAreaIndex];
      selectedWorkAreaList.add(workArea);
    }
  }

  void workTypesSelected(_selectedWorkTypesList) {
    selectedWorkTypeList.value = _selectedWorkTypesList.cast<WorkTypeModel>();
    selectedWorkTypeIdList.value = <int>[];
    for (var _selectedWorkType in _selectedWorkTypesList) {
      selectedWorkTypeIdList.add(_selectedWorkType.id);
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
    await Get.dialog<void>(JobSavedDialog());
  }

  ///
}
