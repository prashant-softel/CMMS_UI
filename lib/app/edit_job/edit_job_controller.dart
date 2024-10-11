import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
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
  RxList<ToolsModel>? toolsRequiredList = <ToolsModel>[].obs;

  //
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedFacilityName = ''.obs;
  Rx<bool> isFacilitySelected = true.obs;
  int selectedFacilityId = 0;
  int workTypeIds = 0;

  //
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isBlockSelected = true.obs;
  int selectedBlockId = 0;
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();

  FocusNode jobNameFocus = FocusNode();
  ScrollController jobNameScroll = ScrollController();
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
  RxList<EquipmentModel?> equipmentList = <EquipmentModel>[].obs;

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
  RxList<ToolsModel?> toolsRequiredToWorkTypeList = <ToolsModel>[].obs;
  RxList<ToolsModel?> selectedtoolsRequiredToWorkTypeList = <ToolsModel>[].obs;
  RxList<int?> selectedtoolsRequiredToWorkTypeIdList = <int>[].obs;

  RxList<WorkTypeModel?>? workTypeListObj = <WorkTypeModel>[].obs;
  List<int> selectedwrktype = [];

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
  Rx<int> typeEdit = 0.obs;
  Rx<bool> isBreakdownInvalid = false.obs;
  var isInventoryCategoryListLoaded = false.obs;
  HtmlEscape htmlEscape = HtmlEscape();

  StreamSubscription<int>? facilityIdStreamSubscription;
  String lststrWorkTypeIds = "";

  ///
  @override
  void onInit() async {
    try {
      await setJobId();
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        selectedFacilityId = event;

        await getBlocksList(selectedFacilityId);
        // await getInventoryCategoryList();

        if (blockList != null) {
          await getJobDetails(jobID.value, selectedFacilityId);
        }

        // Future.delayed(Duration(seconds: 1), () {
        await getAssignedToList();
        //  });
      });
    } catch (e) {
      print({"editjoberror", e});
    }
    super.onInit();
  }

  ///
  Future<void> setJobId() async {
    try {
      final _jobId = await editJobPresenter.getValue();
      final _typeEdit = await editJobPresenter.getTypeValue();

      // If jobId is unavailable, take it from the arguments received
      if (_jobId == null || _jobId == '' || _jobId == "null") {
        var data = Get.arguments;
        jobID.value = data["jobId"];
        typeEdit.value = data['typeEdit'];
        editJobPresenter.saveValue(jobId: jobID.value.toString());
        editJobPresenter.saveTypeValue(typeEdit: typeEdit.value.toString());
      } else {
        jobID.value = int.tryParse(_jobId) ?? 0;
        typeEdit.value = int.tryParse(_typeEdit ?? "") ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'jobId');
    }
  }

  Future<void> getInventoryList({
    required int? facilityId,
    required int blockId,
    receivedCategoryIds,
  }) async {
    workAreaList.value = <InventoryModel>[];
    isInventoryCategoryListLoaded.value = false;

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
    isInventoryCategoryListLoaded.value = true;

    workAreaList.value = _workAreaList;

    update(["workAreaList"]);
  }

  Future<void> getWorkTypeList({
    List<int>? receivedCategoryIds,
  }) async {
    toolsRequiredToWorkTypeList.value = <ToolsModel>[];
    workTypeList.value = <WorkTypeModel>[];

    isInventoryCategoryListLoaded.value = false;

    String lststrCategoryIds = receivedCategoryIds?.join(', ').toString() ?? '';
    final _workTypeList = await editJobPresenter.getWorkTypeList(
      categoryIds: lststrCategoryIds,
      isLoading: false,
    );
    isInventoryCategoryListLoaded.value = true;

    workTypeList.value = _workTypeList ?? <WorkTypeModel>[];
  }

  Future<void> getJobDetails(int _jobId, int facilityId) async {
    jobDetailsList?.value = <JobDetailsModel>[];
    final _jobDetailsList = await jobDetailsPresenter.getJobDetails(
        jobId: _jobId, facilityId: facilityId);

    // After fetching job details
    if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
      jobDetailsModel.value = _jobDetailsList[0];
      update(["jobDetailsModel"]);

      // Set Job Title, Description, and Breakdown Time
      jobTitleCtrlr.text = jobDetailsModel.value?.jobTitle ?? '';
      jobDescriptionCtrlr.text = jobDetailsModel.value?.jobDescription ?? '';
      // breakdownTimeCtrlr.text =
      //     formatDateTimeForUI(jobDetailsModel.value?.breakdownTime);
      breakdownTimeCtrlr.text = jobDetailsModel.value?.breakdownTime ?? '';

      // Set Block
      selectedBlock.value = jobDetailsModel.value?.blockName ?? "";
      selectedBlockId = jobDetailsModel.value?.blockId ?? 0;
      selectedAssignedToId = jobDetailsModel.value?.assignedId ?? 0;

      if (selectedBlockId != 0) {
        getInventoryCategoryList(blockId: selectedBlockId);

        // Set Equipment Categories
        List<int> selectedCategoryIds = [];
        // jobDetailsModel.value?.equipmentCatList?.forEach((category) {
        //   selectedCategoryIds.add(category.id);
        // });
        selectedCategoryIds = jobDetailsModel.value?.equipmentCatList
                ?.map((element) => element.id)
                .toList() ??
            [];
        // print({"selectedCategoryIds", selectedCategoryIds[0]});
        equipmentCategoriesSelected(selectedCategoryIds);
      }
      List<int?> selectedworkAreaIds = jobDetailsModel.value?.workingAreaList
              ?.map((element) => element.id)
              .toList() ??
          [];
      print({"selectedworkAreaIds", selectedworkAreaIds[0]});

      workAreasSelected(selectedworkAreaIds);
      List<int?> selectedworkAreaTypeIds = jobDetailsModel.value?.workTypeList
              ?.map((element) => element.id)
              .toList() ??
          [];
      // print({"selectedworkAreaTypeIds", selectedworkAreaTypeIds[0]});

      workTypesSelected(selectedworkAreaTypeIds);
      // // Tools Required
      List<int?> toolReqIds = jobDetailsModel.value?.toolsRequiredList
              ?.map((element) => element.id)
              .toList() ??
          [];
      toolsRequiredSelected(toolReqIds);
    }
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
    final _assignedToList = await editJobPresenter.getAssignedToEmployee(
      facilityId: selectedFacilityId,
      featureId: UserAccessConstants.kJobFeatureId,
      isattendanceneeded: 0,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
      selectedAssignedTo.value =
          getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
    }
  }

  // Future<void> getToolsRequiredToWorkTypeList(workTypeIds) async {
  //   try {
  //     toolsRequiredToWorkTypeList?.clear();
  //     selectedtoolsRequiredToWorkTypeList.clear();
  //     selectedtoolsRequiredToWorkTypeIdList.clear();
  //     final list = await editJobPresenter.getToolsRequiredToWorkTypeList(
  //       isLoading: true,
  //       workTypeIds: workTypeIds,
  //     );
  //     print('paifcghb:${list}');

  //     toolsRequiredToWorkTypeList?.value = list ?? <ToolsModel>[];
  //     if (jobDetailsModel.value?.toolsRequiredList != null) {
  //       for (var toolType in jobDetailsModel.value?.toolsRequiredList ?? []) {
  //         ToolsModel linkedToolName = ToolsModel(
  //           id: toolType.toolId,
  //           linkedToolName: toolType.toolName,
  //         );
  //         selectedtoolsRequiredToWorkTypeList.add(linkedToolName);
  //         selectedtoolsRequiredToWorkTypeIdList.add(linkedToolName.id ?? 0);
  //       }
  //     }

  //     update(['toolsRequiredToWorkTypeList']);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  // Future<void> getToolsRequiredToWorkTypeList(workTypeIds) async {
  //   try {
  //     toolsRequiredToWorkTypeList?.clear();
  //     selectedtoolsRequiredToWorkTypeList.clear();
  //     selectedtoolsRequiredToWorkTypeIdList.clear();

  //     // Fetch the list of tools from the API
  //     final toolsList = await editJobPresenter.getToolsRequiredToWorkTypeList(
  //       isLoading: true,
  //       workTypeIds: workTypeIds,
  //     );

  //     // Create a set to store unique tools
  //     final uniqueTools = <ToolsModel>{};

  //     // Add tools from the API response to the set
  //     for (var tool in toolsList ?? []) {
  //       uniqueTools.add(tool);
  //     }

  //     // Add tools from jobDetailsModel (if available) to the set
  //     for (var toolType in jobDetailsModel.value?.toolsRequiredList ?? []) {
  //       uniqueTools.add(ToolsModel(
  //         id: toolType.toolId,
  //         linkedToolName: toolType.toolName,
  //       ));
  //     }

  //     // Update the list with unique tools
  //     toolsRequiredToWorkTypeList?.value = uniqueTools.toList();

  //     // Update the UI
  //     update(['toolsRequiredToWorkTypeList']);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  Future<void> getInventoryCategoryList({int? blockId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];

    isInventoryCategoryListLoaded.value = false;

    try {
      final _equipmentCategoryList = await editJobPresenter
          .getInventoryCategoryList(isLoading: true, blockId: blockId);

      if (_equipmentCategoryList != null) {
        for (var equimentCategory in _equipmentCategoryList) {
          equipmentCategoryList.add(equimentCategory);
        }
      }

      isInventoryCategoryListLoaded.value = true;
    } catch (e) {
      print('Error fetching inventory category list: $e');
      isInventoryCategoryListLoaded.value = true;
    }
  }
  // Future<void> getInventoryCategoryList() async {
  //   equipmentCategoryList.value = <InventoryCategoryModel>[];
  //   selectedEquipmentCategoryList.value = <InventoryCategoryModel>[];

  //   //
  //   final _equipmentCategoryList =
  //       await editJobPresenter.getInventoryCategoryList(
  //     isLoading: true,
  //   );
  //   if (_equipmentCategoryList != null) {
  //     for (var equimentCategory in _equipmentCategoryList) {
  //       equipmentCategoryList.add(equimentCategory);
  //     }

  //     // if (jobDetailsModel.value?.equipmentCatList != null)
  //     //   for (var equipCat in jobDetailsModel.value?.equipmentCatList ?? []) {
  //     //     InventoryCategoryModel equipmentCategory = InventoryCategoryModel(
  //     //       id: equipCat.equipmentCatId,
  //     //       name: equipCat.equipmentCatName,
  //     //     );
  //     //     selectedEquipmentCategoryList.add(equipmentCategory);
  //     //     selectedEquipmentCategoryIdList.add(equipmentCategory.id);

  //     //     update();
  //     //   }
  //   }
  // }

  // // Future<void> getInventoryList({
  //   int? facilityId,
  //   int? blockId,
  // }) async {
  //   selectedWorkAreaIdList.clear();
  //   categoryIds = selectedEquipmentCategoryIdList;
  //   String lststrCategoryIds = categoryIds.join(', ').toString();
  //   final _workAreaList = await homePresenter.getInventoryList(
  //     facilityId: facilityId,
  //     blockId: blockId,
  //     categoryIds: lststrCategoryIds,
  //     isLoading: true,
  //   );
  //   if (_workAreaList.isNotEmpty) {
  //     workAreaList.value = _workAreaList;
  //     if (jobDetailsModel.value?.workingAreaList != null)
  //       for (var _workArea in jobDetailsModel.value?.workingAreaList ?? []) {
  //         int _selectedWorkAreaId = _workArea.workingAreaId ?? 0;
  //         if (_selectedWorkAreaId > 0) {
  //           selectedWorkAreaIdList.add(_selectedWorkAreaId);
  //         }
  //         update();
  //       }
  //   }
  // }
  // Future<void> getInventoryList({
  //   int? facilityId,
  //   int? blockId,
  // }) async {
  //   selectedWorkAreaIdList.clear();
  //   categoryIds = selectedEquipmentCategoryIdList;
  //   String lststrCategoryIds = categoryIds.join(', ').toString();
  //   workAreaList.value = await homePresenter.getInventoryList(
  //     facilityId: facilityId,
  //     blockId: blockId,
  //     categoryIds: lststrCategoryIds,
  //     isLoading: true,
  //   );
  //   // if (_workAreaList.isNotEmpty) {
  //   //   // workAreaList.value = _workAreaList;
  //   //   if (jobDetailsModel.value?.workingAreaList != null)
  //   //     for (var _workArea in jobDetailsModel.value?.workingAreaList ?? []) {
  //   //       int _selectedWorkAreaId = _workArea. ?? 0;
  //   //       if (_selectedWorkAreaId > 0 &&
  //   //           !selectedWorkAreaIdList.contains(_selectedWorkAreaId)) {
  //   //         selectedWorkAreaIdList.add(_workArea);
  //   //         selectedWorkTypeList.add(_workArea); //}
  //   //         update();
  //   //       }
  //   //     }
  //   // }
  //   if (jobDetailsModel.value?.workingAreaList != null)
  //     for (var _workArea in jobDetailsModel.value?.workingAreaList ?? []) {
  //       WorkTypeModel equipmentCategory = WorkTypeModel(
  //         id: _workArea.asset_id,
  //         name: _workArea.name,
  //       );
  //       selectedWorkAreaIdList.add(equipmentCategory.id);
  //       selectedWorkTypeList.add(equipmentCategory);
  //       update();
  //     }
  // }

  // Future<void> getWorkTypeList({
  //   List<int>? categoryIds,
  // }) async {
  //   try {
  //     workTypeList.clear();
  //     selectedWorkTypeList.clear();
  //     selectedWorkTypeIdList.clear();

  //     ///
  //     categoryIds = selectedEquipmentCategoryIdList;
  //     String lststrCategoryIds = categoryIds.join(', ').toString();
  //     final _workTypeList = await editJobPresenter.getWorkTypeList(
  //       categoryIds: lststrCategoryIds,
  //       isLoading: true,
  //     );
  //     //bind worktype list
  //     if (_workTypeList != null) {
  //       workTypeList.value = _workTypeList ?? <WorkTypeModel>[];
  //     }
  //     // pre-fill worktype values
  //     if (jobDetailsModel.value?.workTypeList != null)
  //       for (var _workType in jobDetailsModel.value?.workTypeList ?? []) {
  //         WorkTypeModel workType = WorkTypeModel(
  //           id: _workType.workTypeId,
  //           name: _workType.workTypeName,
  //         );
  //         selectedWorkTypeList.add(workType);
  //         selectedWorkTypeIdList.add(workType.id ?? 0);
  //       }
  //     update();
  //   } //
  //   catch (e) {
  //     print(e);
  //   }
  // }

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

  Future<void> getToolsRequiredToWorkTypeList(workTypeIds) async {
    isInventoryCategoryListLoaded.value = false;
    final list = await editJobPresenter.getToolsRequiredToWorkTypeList(
      isLoading: false,
      workTypeIds: workTypeIds,
    );
    toolsRequiredToWorkTypeList.value = list ?? <ToolsModel>[];
    isInventoryCategoryListLoaded.value = true;

    // str = toolsRequiredToWorkTypeList.join(" , ");
    // print({"str", str});
    update(['toolsRequiredToWorkTypeList']);
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

  Future<void> assignReAssignJob() async {
    try {
      Map<String, dynamic>? responseMapJobUpdated =
          await editJobPresenter.assignReAssignJob(
        jobId: jobID.value,
        assignedToId: selectedAssignedToId,
        isLoading: true,
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
      Utility.showDialog(e.toString(), ' assignReAssignJob');
    }
  }

  void updateJob({List<dynamic>? fileIds}) async {
    try {
      // checkForm();
      // if (isFormInvalid.value) {
      //   return;
      // }
      //
      // if (selectedAssignedToId <= 0) {
      //   selectedAssignedToId = getAssignedToId(selectedAssignedTo.value) ?? 0;
      // }
      int _permitId = selectedPermitId;
      String _title = htmlEscape.convert(jobTitleCtrlr.text.trim());
      String _description = htmlEscape.convert(jobDescriptionCtrlr.text.trim());

      String _breakdownTime = breakdownTimeCtrlr.text.trim();

      print("selected  Fault : $selectedwrktype");
      AddJobModel addJobModel = AddJobModel(
        id: jobID.value,
        facilityId: selectedFacilityId,
        // blockId: selectedBlockIdList,
        blockId: selectedBlockId,
        permitId: _permitId,
        assignedId: selectedAssignedToId,
        title: _title,
        description: _description,
        breakdownTime: _breakdownTime,
        assetsIds: selectedWorkAreaIdList,
        workTypeIds: selectedWorkTypeIdList,
        uploadfile_ids: fileIds,
      );

      Map<String, dynamic>? responseMapJobUpdated =
          await editJobPresenter.updateJob(
        job: addJobModel,
        isLoading: true,
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
      Utility.showDialog(e.toString(), ' updateJob');
    }
  }

  bool openbreaketimeDatePicker = false;

  ///Value changed in any of the dropdowns - single select
  void onDropdownValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      // case const (RxList<FacilityModel>):
      //   {
      //     if (value != "Please Select") {
      //       int facilityIndex =
      //           facilityList.indexWhere((x) => x?.name == value);
      //       selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
      //       if (selectedFacilityId != 0) {
      //         isFacilitySelected.value = true;
      //       }
      //       selectedFacility.value = value;
      //       getBlocksList(selectedFacilityId);
      //     } else {
      //       selectedFacilityId = 0;
      //     }
      //   }
      //   break;

      case const (RxList<BlockModel>):
        {
          if (value != "Please Select") {
            equipmentCategoryList.value = <InventoryCategoryModel>[];

            workAreaList.value = <InventoryModel>[];
            workTypeList.value = <WorkTypeModel>[];
            toolsRequiredToWorkTypeList.value = <ToolsModel>[];
            selectedWorkTypeIdList.value = <int>[];
            selectedWorkAreaIdList.value = <int>[];
            selectedtoolsRequiredToWorkTypeIdList.value = <int>[];
            selectedEquipmentCategoryIdList.value = <int>[];

            int blockIndex = blockList.indexWhere((x) => x?.name == value);
            selectedBlockId = blockList[blockIndex]?.id ?? 0;
            if (selectedBlockId > 0) {
              isBlockSelected.value = true;
            }
            selectedBlock.value = value;
            print('SelectedBlock:$selectedBlock');
            // selectedEquipmentCategory.value ='';
            // selectedToolRequiredToWorkType.value ='';
            // selectedWorkAreaList.value = [];
            // selectedAssignedTo.value ='';
            // selectedWorkTypeList.value = [];
            getInventoryCategoryList(blockId: selectedBlockId);
            // getWorkTypeList();
            // getInventoryList(facilityId: facilityId, blockId: selectedBlockId);
          } else {
            selectedBlockId = 0;
          }

          // getToolsRequiredToWorkTypeList();
        }
        break;
      case const (RxList<EquipmentModel>):
        {
          if (value != "Please Select") {
            int equipmentIndex =
                equipmentList.indexWhere((x) => x?.name == value);
            int selectedEquipmentId = equipmentList[equipmentIndex]?.id ?? 0;
            print(selectedEquipmentId);
          } else {
            // selectedEquipmentId=0;
          }
        }
        break;
      case const (RxList<InventoryModel>):
        {
          if (value != "Please Select") {
            for (var workAreaName in selectedWorkAreaNameList) {
              int workAreaIndex =
                  workAreaList.indexWhere((x) => x?.name == workAreaName);
              selectedWorkAreaIdList.add(workAreaIndex);
            }
          } else {}
        }
        break;
      case const (RxList<InventoryCategoryModel>):
        {
          if (value != "Please Select") {
            for (var equipCat in selectedEquipmentCategoryList) {
              int equipCatIndex = selectedEquipmentCategoryList
                  .indexWhere((x) => x?.name == equipCat);
              selectedEquipmentCategoryIdList.add(equipCatIndex);
            }
            // getWorkTypeList(
            //     receivedCategoryIds: selectedEquipmentCategoryIdList);
            // getInventoryList(facilityId: facilityId, blockId: selectedBlockId);
          } else {}
        }
        break;

      case const (RxList<EmployeeModel>):
        {
          if (value != "Please Select") {
            int assignedToIndex =
                assignedToList.indexWhere((x) => x?.name == value);
            selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
            if (selectedAssignedToId != 0) {
              isAssignedToSelected.value = true;
            }
            selectedAssignedTo.value = value;
          } else {
            selectedAssignedToId = 0;
          }
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
    workAreaList.value = <InventoryModel>[];
    workTypeList.value = <WorkTypeModel>[];
    toolsRequiredToWorkTypeList.value = <ToolsModel>[];

    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
    if (selectedEquipmentCategoryIdList != null && blockId != null) {
      selectedWorkTypeIdList.value = <int>[];
      selectedWorkAreaIdList.value = <int>[];
      selectedtoolsRequiredToWorkTypeIdList.value = <int>[];

      getInventoryList(
        facilityId: selectedFacilityId,
        blockId: selectedBlockId,
        receivedCategoryIds: selectedEquipmentCategoryIdList,
      );
      getWorkTypeList(receivedCategoryIds: selectedEquipmentCategoryIdList);
    }
  }

  void toolsRequiredSelected(_selectedToolsRequired) {
    selectedtoolsRequiredToWorkTypeIdList.value = <int>[];
    for (var _selectedCategory in _selectedToolsRequired) {
      selectedtoolsRequiredToWorkTypeIdList.add(_selectedCategory);
    }
    // getToolsRequiredToWorkTypeList(selectedEquipmentCategoryIdList);
  }

  /// Work-areas / Equipments selected - multi select
  // void workAreasSelected(_selectedWorkAreaList) {
  //   selectedWorkAreaList.value = _selectedWorkAreaList.cast<InventoryModel>();
  // }
  void workAreasSelected(_selectedWorkAreaList) {
    selectedWorkAreaIdList.value = <int>[];
    // workAreaList.value = <InventoryModel>[];

    for (var _selectedWorkAreaId in _selectedWorkAreaList) {
      selectedWorkAreaIdList.add(_selectedWorkAreaId);
    }
  }

  /// Work-types selected - multi select
  void workTypesSelected(_selectedWorkTypesList) {
    // selectedWorkTypeList.value = _selectedWorkTypesList.cast<WorkTypeModel>();
    selectedWorkTypeIdList.value = <int>[];
    for (var _selectedWorkType in _selectedWorkTypesList) {
      selectedWorkTypeIdList.add(_selectedWorkType);
    }
    print({"selectedWorkTypeIdList", selectedWorkTypeIdList});
    // var worktypeid = selectedWorkTypeIdList.join(', ').toString();
    var worktypeid =
        selectedWorkTypeIdList.map((id) => id.toString()).join(',');
    getToolsRequiredToWorkTypeList(worktypeid);
  }

  ///Block

  /// Show alert dialog
  static void showAlertDialog({
    int? jobId,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
      JobUpdatedDialog(jobId: jobId, message: message),
      // barrierDismissible: false
    );
  }

  ///
  goToAddJobScreen() {
    final _flutterSecureStorage = const FlutterSecureStorage();
    _flutterSecureStorage.delete(key: "jobId");
    Get.offAndToNamed(Routes.addJob);
  }

  goToJobDetailsScreen(int _jobId) {
    Get.back();
    Get.offAllNamed('${Routes.jobDetails}/$_jobId');
  }

  goToJobListScreen() {
    final _flutterSecureStorage = const FlutterSecureStorage();
    _flutterSecureStorage.delete(key: "jobId");
    Get.offAllNamed(Routes.jobList);
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? dateTime = selectedBreakdownTime.value;

    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now(),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    DateTime dateTime = selectedBreakdownTime.value;

    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

  Future pickDateTime(BuildContext context) async {
    var dateTime = selectedBreakdownTime.value;
    final date = await pickDate(context);
    if (date == null) {
      return;
    }

    final time = await pickTime(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    selectedBreakdownTime.value = dateTime;
    isBreakdownInvalid.value = false;
    breakdownTimeCtrlr
      ..text = DateFormat("dd-MM-yyyy HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: breakdownTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  ///
}
