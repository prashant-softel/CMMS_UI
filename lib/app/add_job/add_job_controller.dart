import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/models/employee_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/tools_model.dart';
import '../../domain/models/work_type_model.dart';
import '../job_list/job_list_presenter.dart';
import '../navigators/app_pages.dart';
import 'add_job_presenter.dart';
import 'views/widgets/job_created_dialog.dart';

class AddJobController extends GetxController {
  ///
  AddJobController(
    this.addJobPresenter,
    this.jobListPresenter,
    this.homePresenter,
  );
  AddJobPresenter addJobPresenter;
  HomePresenter homePresenter;
  JobListPresenter jobListPresenter;

  ///
  RxList<JobModel?>? jobList = <JobModel?>[].obs;
  HtmlEscape htmlEscape = HtmlEscape();
  HomeController homeController = Get.find<HomeController>();
  //
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = true.obs;
  int selectedFacilityId = 0;
  //
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isBlockSelected = true.obs;
  int selectedBlockId = 0;
  //
  Rx<String> selectedEquipment = ''.obs;
  Rx<bool> isEquipmentSelected = true.obs;
  RxList<EquipmentModel?> equipmentList = <EquipmentModel>[].obs;
  //
  Rx<String> selectedWorkType = ''.obs;
  Rx<bool> isWorkTypeSelected = true.obs;
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

  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isJobTitleInvalid = false.obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;
  var breakdownTime;
  var jobDescriptionCtrlr = TextEditingController();
  var jobTitleCtrlr = TextEditingController();
  var breakdownTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<int> jobID = 0.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  // Create a FocusNode instance in your controller
  FocusNode focusNode = FocusNode();

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
        // Future.delayed(Duration(seconds: 1), () async {
        await getBlocksList(facilityId);
        getAssignedToList(facilityId);
        // });
      }
    });

    super.onInit();
    // Request focus on the FocusNode after the widget is built
    WidgetsBinding.instance
        .addPostFrameCallback((_) => focusNode.requestFocus());
  }

  @override
  void onClose() {
    // Dispose of the FocusNode when the controller is getting deleted
    focusNode.dispose();
    super.onClose();
  }

  Future<void> getFacilityList() async {
    facilityList.value = <FacilityModel>[];
    blockList.value = <BlockModel>[];
    final _facilityList = await jobListPresenter.getFacilityList();
    selectedFacilityId = Get.arguments;
    if (_facilityList != null) {
      facilityList.value = _facilityList;

      int facilityIndex =
          facilityList.indexWhere((x) => x?.id == selectedFacilityId);
      if (facilityIndex > -1) {
        selectedFacility.value = facilityList[facilityIndex]?.name ?? '';
        getBlocksList(selectedFacilityId);
      }
    }
  }

  Future<void> getBlocksList(int _facilityId) async {
    blockList.value = <BlockModel>[];
    selectedBlock.value = '';
    final _blockList =
        await addJobPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      update(["blockList"]);
    }
  }

  Future<void> getAssignedToList(_facilityId) async {
    final _assignedToList =
        await addJobPresenter.getAssignedToList(facilityId: _facilityId);

    if (_assignedToList != null) {
      for (var _assignedTo in _assignedToList) {
        assignedToList.add(_assignedTo);
      }
      update(["assignedToList"]);
    }
  }

  Future<void> getToolsRequiredToWorkTypeList(workTypeIds) async {
    final list = await addJobPresenter.getToolsRequiredToWorkTypeList(
      isLoading: false,
      workTypeIds: workTypeIds,
    );
    toolsRequiredToWorkTypeList?.value = list ?? <ToolsModel>[];
    update(['toolsRequiredToWorkTypeList']);
  }

  Future<void> getInventoryCategoryList(String? facilityId) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await addJobPresenter.getInventoryCategoryList(
      isLoading: false,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  Future<void> getInventoryList({
    required int? facilityId,
    required int blockId,
    receivedCategoryIds,
  }) async {
    workAreaList.value = <InventoryModel>[];
    if (receivedCategoryIds == null || receivedCategoryIds.isEmpty) {
      receivedCategoryIds = selectedEquipmentCategoryIdList;
    }
    String lststrCategoryIds = receivedCategoryIds.join(', ').toString();
    final _workAreaList = await homePresenter.getInventoryList(
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: lststrCategoryIds,
      isLoading: false,
    );
    workAreaList.value = _workAreaList;

    update(["workAreaList"]);
  }

  Future<void> getWorkTypeList({
    List<int>? receivedCategoryIds,
  }) async {
    workTypeList.value = <WorkTypeModel>[];
    String lststrCategoryIds = receivedCategoryIds?.join(', ').toString() ?? '';
    final _workTypeList = await addJobPresenter.getWorkTypeList(
      categoryIds: lststrCategoryIds,
      isLoading: false,
    );
    workTypeList.value = _workTypeList ?? <WorkTypeModel>[];
  }

  void checkForm() {
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

  void saveJob() async {
    try {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      //
      int _permitId = selectedPermitId;
      String _title = htmlEscape.convert(jobTitleCtrlr.text.trim());
      String _description = htmlEscape.convert(jobDescriptionCtrlr.text.trim());
      String _breakdownTime = formatDate(breakdownTimeCtrlr.text.trim());
      selectedAssetsIdList.clear();

      for (var _selectedWorkArea in selectedWorkAreaList) {
        selectedAssetsIdList.add(_selectedWorkArea?.id ?? 0);
      }

      AddJobModel addJobModel = AddJobModel(
        id: 0,
        facilityId: facilityId,
        blockId: selectedBlockId,
        permitId: _permitId,
        assignedId: selectedAssignedToId,
        title: _title,
        description: _description,
        breakdownTime: _breakdownTime,
        assetsIds: selectedAssetsIdList,
        workTypeIds: selectedWorkAreaIdList,
      );

      Map<String, dynamic>? responseMapJobCreated =
          await addJobPresenter.saveJob(
        job: addJobModel,
        isLoading: false,
      );
      if (responseMapJobCreated != null) {
        var _jobId = 0;
        var _message = '';
        if (responseMapJobCreated["id"] != null &&
            responseMapJobCreated["id"].isNotEmpty) {
          _jobId = responseMapJobCreated["id"][0];
        }
        if (responseMapJobCreated["message"] != null) {
          _message = responseMapJobCreated["message"];
        }
        showAlertDialog(jobId: _jobId, message: _message);
      }
    } catch (e) {
      Utility.showDialog(e.toString());
    }
  }

  String formatDate(String dateString) {
    var inputFormat = DateFormat("dd-MM-yyyy HH:mm");
    var inputDate = inputFormat.parse(dateString);
    var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  ///Value changed in any of the dropdowns - single select
  void onDropdownValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
          if (selectedFacilityId != 0) {
            isFacilitySelected.value = true;
          }
          selectedFacility.value = value;
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
      case RxList<EquipmentModel>:
        {
          int equipmentIndex =
              equipmentList.indexWhere((x) => x?.name == value);
          int selectedEquipmentId = equipmentList[equipmentIndex]?.id ?? 0;
          print(selectedEquipmentId);
        }
        break;
      case RxList<InventoryModel>:
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex = selectedEquipmentCategoryList
                .indexWhere((x) => x?.name == equipCat);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
          }
        }
        break;

      case RxList<EmployeeModel>:
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId != 0) {
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

  /// Equipment categories selected - multi select
  void equipmentCategoriesSelected(_selectedEquipmentCategories) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategory in _selectedEquipmentCategories) {
      selectedEquipmentCategoryIdList.add(_selectedCategory.id);
    }

    getInventoryList(
      facilityId: facilityId,
      blockId: selectedBlockId,
      receivedCategoryIds: selectedEquipmentCategoryIdList,
    );
    getWorkTypeList(receivedCategoryIds: selectedEquipmentCategoryIdList);
  }

  /// Work-areas / Equipments selected - multi select
  void workAreasSelected(_selectedWorkAreaList) {
    selectedWorkAreaList.value = _selectedWorkAreaList.cast<InventoryModel>();
  }

  /// Work-types selected - multi select
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
    await Get.dialog<void>(JobCreatedDialog(jobId: jobId, message: message));
  }

  ///
  goToAddJobScreen() {
    Get.offAndToNamed(Routes.addJob);
  }

  goToJobDetailsScreen(int _jobId) {
    Get.offAndToNamed(Routes.jobDetails, arguments: {"jobId": _jobId});
  }

  goToJobListScreen() {
    Get.offAllNamed(Routes.jobList);
  }

  ///
}
