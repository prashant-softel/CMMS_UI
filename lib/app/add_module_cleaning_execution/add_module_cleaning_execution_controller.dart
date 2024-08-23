import 'dart:async';
import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/save_file_web.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/close_permit_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/end_mc_execution_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/get_mc_task_equipment_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/update_mc_execution_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../domain/models/facility_model.dart';

class AddModuleCleaningExecutionController extends GetxController {
  AddModuleCleaningExecutionController(
      this.addModuleCleaningExecutionPresenter);
  AddModuleCleaningExecutionPresenter addModuleCleaningExecutionPresenter;

  final HomeController homeController = Get.find();

  Rx<String> selectedFacility = ''.obs;
  List<int> checkboxIds = [];

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  List<Escalation> days = [];
  Map<String, Schedules> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};
  RxList<Schedules?>? schedules = <Schedules?>[].obs;
  Map<String, String> check = <String, String>{};
  int count = 0;

  int? scheduledId = 0;
  Rx<bool> allScheduleTrue = false.obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;
  // void addRowItem() {
  //   rowItem.value.add([
  //     {"key": "Schedule Id", "value": ''},
  //     {"key": "Days", "value": ''},
  //     {"key": "Scheduled Module", "value": ''},
  //     {"key": "Cleaned", "value": ''},
  //     {"key": "Abandoned", "value": ''},
  //     {"key": "Pending", "value": ''},
  //     {"key": "Type", "value": ''},
  //     {"key": "Water Used", "value": ''},
  //     {"key": "Remark", "value": ''},
  //     {"key": "Status", "value": ''},
  //     {'key': "Actions", "value": ''},
  //   ]);
  // }

  RxList<ModuleListModel?> moduleList = <ModuleListModel>[].obs;
  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  int? selectedModuleListId = 0;
  int type = 1;
  var schedule;
  TextEditingController commentCtrlr = TextEditingController();
  Rx<bool> isFormInvalid = false.obs;

  ///Permit Type
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;

  ///Mc Execution details
  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;
  RxList<EndMCExecutionDetailsModel?>? mcExecutionDetailsList =
      <EndMCExecutionDetailsModel?>[].obs;

  TextEditingController scheduleExecutionTextFieldCtrlr =
      TextEditingController();
  TextEditingController remarkScheduleExecutionTextFieldCtrlr =
      TextEditingController();

  ///Equipment
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  var equipments = <Equipments>[].obs;
  RxList<InventoryCategoryModel?> filteredequipmentsList =
      <InventoryCategoryModel>[].obs;
  Rx<int> permitIdclose = 0.obs;
  var descriptionOfWorkDoneCtrlr = TextEditingController();

  ///Date Time
  var startedAtDateTimeCtrlrWeb = TextEditingController();
  var plannedAtDateTimeCtrlrWeb = TextEditingController();

  var remarkCtrlrWeb = TextEditingController();
  var waterUsedCtrlrWeb = TextEditingController();

  ///Checkbox
  var isChecked = false.obs; // This makes `isChecked` observable
  void toggleCheckbox() => isChecked.value = !isChecked.value;

  // RxList<bool> isCheckedList = <bool>[].obs;
  // void toggleCheckbox(int index) {
  //   isCheckedList[index] = !isCheckedList[index];
  // }

  ///
  TextEditingController remarkTextFieldCtrlr = TextEditingController();

  ///Schedule List
  RxList<Schedules?>? listSchedules = <Schedules?>[].obs;
  TextEditingController commentTextFieldCtrlr = TextEditingController();

  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;
  RxList<GetMCTaskEquipmentList?> equipmenTasktList =
      <GetMCTaskEquipmentList?>[].obs;
  GetMCTaskEquipmentList? equipment;
  // SMBS? smb;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  int taskId = 0;

  List<int?> scheduleId = [];

  ///

  Map<String, dynamic> data = {};
  // dynamic planId = [];
  Rx<int> mcid = 0.obs;
  Rx<int> planId = 0.obs;
  @override
  void onInit() async {
    //  isCheckedList.assignAll(List.generate(equipmentList.length, (index) => false));

    await setMcId();

    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () async {
        await getFacilityList();
        await getInventoryCategoryList();
        if (mcid > 0) {
          //   Future.delayed(Duration(seconds: 1), () {
          await getMCExecutionDetail(
              executionId: mcid.value, facilityId: facilityId);
          await getMCTaskEquipmentList(mcid.value, true);
          //  });
        }
        await getAssignedToList();
      });
    });

    // Future.delayed(Duration(seconds: 1), () {
    //   getTypePermitList();
    // });

    super.onInit();
  }

  createNewPermit({int? scheduleID}) {
    clearJobDetailStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearpmTaskValue();
    clearPermitStoreData();
    clearmcDetailsStoreData();

    Get.toNamed(Routes.createPermit, arguments: {
      "jobModel": jobDetailsModel.value,
      "permitId": 0,
      "isChecked": false,
      "type": 4,
      "isFromJobDetails": true,
      "pmTaskModel": pmtaskViewModel.value,
      "mcModel": mcExecutionDetailsModel.value,
      "scheduleID": scheduleID
    });
  }

  Future<void> setMcId() async {
    try {
      final _mcid = await addModuleCleaningExecutionPresenter.getValueMcId();
      final _planId =
          await addModuleCleaningExecutionPresenter.getValuePlanId();

      if (_mcid == null || _mcid == '' || _mcid == "null") {
        data = Get.arguments;

        mcid.value = data['mcid'];

        planId.value = data['planId'];

        addModuleCleaningExecutionPresenter.saveValueMcId(
            mcid: mcid.value.toString());
        addModuleCleaningExecutionPresenter.saveValuePlanId(
            planId: planId.value.toString());
      } else {
        mcid.value = int.tryParse(_mcid) ?? 0;
        planId.value = int.tryParse(_planId.toString()) ?? 0;
      }
    } catch (e) {
      // Utility.showDialog(e.toString(), 'mcid');
    }
  }

  void clearPermitStoreData() {
    addModuleCleaningExecutionPresenter.clearPermitStoreData();
  }

  void clearmcDetailsStoreData() {
    addModuleCleaningExecutionPresenter.clearmcDetailsStoreData();
  }

  void clearJobDetailStoreData() {
    addModuleCleaningExecutionPresenter.clearJobDetailStoreData();
  }

  void clearTypeStoreData() {
    addModuleCleaningExecutionPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    addModuleCleaningExecutionPresenter.clearisCheckedValue();
  }

  void clearpmTaskValue() {
    addModuleCleaningExecutionPresenter.clearpmTaskValue();
  }

  Future<void> getFacilityList() async {
    final _facilityList =
        await addModuleCleaningExecutionPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> viewNewPermitList({
    int? permitId,
    int? jobId,
  }) async {
    Get.toNamed(Routes.viewPermitScreen,
        arguments: {"permitId": permitId, "jobId": jobId, "type": 4});
    print({"Permit", permitId, jobId});
  }

  Future<void> getMCTaskEquipmentList(int taskId, bool isLoading) async {
    equipmenTasktList.value = <GetMCTaskEquipmentList>[];

    final list =
        await addModuleCleaningExecutionPresenter.getMCTaskEquipmentList(
            isLoading: isLoading, taskId: taskId, facilityId: facilityId);
    // print('incidentReportFacilityId$facilityId');
    // print('Incident Report List:$list');
    // for (var equipment_list in list) {
    //   equipmenTasktList.add(equipment_list);
    // }

    equipmenTasktList.value = list;
    check.clear();

    for (var equipment in equipmenTasktList) {
      for (var smb in equipment?.smbs ?? []) {
        if (smb.isAbandonSmbCheck) {
          check["${smb.smbName}"] = "abandon";
          count++;
        } else if (smb.isCleanedSmbCheck) {
          check["${smb.smbName}"] = "cleaned";
          count++;
        } else {
          print("${smb.smbName} execution remaining");
        }
      }
      if (count == 0) {
        check["${equipment?.invName}"] = "remaining";
      }
      count = 0;
    }
    print("${check}");
    update(['equipment_list']);
  }

  void abandonScheduleExecutionButton({int? id}) async {
    {
      String _comment = scheduleExecutionTextFieldCtrlr.text.trim();

      CommentModel commentAbandonScheduleModel =
          CommentModel(id: id, comment: _comment);

      var abandoneScheduleJsonString = commentAbandonScheduleModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response = await addModuleCleaningExecutionPresenter
          .abandonScheduleExecutionButton(
              abandoneScheduleJsonString: abandoneScheduleJsonString,
              isLoading: true,
              facility_id: facilityId);
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList =
        await addModuleCleaningExecutionPresenter.getAssignedToList(
      facilityId: facilityId,
      featureId: UserAccessConstants.kModuleCleaningplanFeatureId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
      // selectedAssignedTo.value =
      //     getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
    }
  }

  ///Update MC Schedule Execution
  void updateMCScheduleExecution(
      {int? scheduleId,
      int? cleaningDay,
      int? waterUsed,
      String? remark}) async {
    {
      rowItem.value.forEach((element) {
        // items.add(item);
      });
      print('data${rowItem.value}');

      // List<int> data = [];

      // equipmentList.value.forEach((element) {
      //   if (element!.isChecked!) {
      //     data.add(element.invId!);
      //   }
      // });
      List<int> cleanedEquipmentIds = [];
      List<int> abandonedEquipmentIds = [];
      equipmenTasktList.forEach((e) {
        e?.smbs.forEach((element) {
          if (element.isAbandonSmbCheck! && element.isPending != 0) {
            abandonedEquipmentIds.add(element.smbId ?? 0);
          }
          if (element.isCleanedSmbCheck! && element.isPending != 0) {
            cleanedEquipmentIds.add(element.smbId!);
          }
        });
      });
      print('cleaned:$cleanedEquipmentIds');

      UpdateMcScheduleExecutionModel updateMCScheduleExecutionModel =
          UpdateMcScheduleExecutionModel(
        executionId: mcid.value,
        scheduleId: scheduleId,
        cleaningDay: cleaningDay,
        // waterUsed: int.tryParse('${rowItem.value[0][7]["value"]}'),
        waterUsed: waterUsed == null ? 0 : waterUsed,
        remark: remark == null ? "" : remark,
        // remark: rowItem.value[0][8]["value"],
        cleanedEquipmentIds: cleanedEquipmentIds,
        abandonedEquipmentIds: abandonedEquipmentIds,
      );

      var updateMCScheduleExecutionJsonString =
          updateMCScheduleExecutionModel.toJson();
      Map<String, dynamic>? responseUpdateMCExecution =
          await addModuleCleaningExecutionPresenter.updateMCScheduleExecution(
              updateMCScheduleExecutionJsonString:
                  updateMCScheduleExecutionJsonString,
              isLoading: true,
              facility_id: facilityId);

      if (responseUpdateMCExecution == null) {
        // showAlertDialog();
      }
      print(
          'Update MC Schedule Execution data: $updateMCScheduleExecutionJsonString');
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList = await addModuleCleaningExecutionPresenter
        .getTypePermitList(facility_id: facilityId);

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
    }
  }

  void abandonAllExecutionButton({int? id}) async {
    {
      if (commentTextFieldCtrlr.text == '') {
        // isFormInvalid.value == true;
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = commentTextFieldCtrlr.text.trim();

      CommentModel commentAbandonModel =
          CommentModel(id: id, comment: _comment);

      var abandoneJsonString = commentAbandonModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response =
          await addModuleCleaningExecutionPresenter.abandonAllExecutionButton(
              abandoneJsonString: abandoneJsonString,
              isLoading: true,
              facility_id: facilityId);
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await addModuleCleaningExecutionPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  //  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
  //   selectedEquipmentCategoryIdList.value = <int>[];
  //   for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
  //     selectedEquipmentCategoryIdList.add(_selectedCategoryId);
  //   }
  // }

  void equipmentCategoriesSelected(_selectedEquipmentNameIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    filteredequipmentsList.value = <InventoryCategoryModel>[];
    for (var _selectedNameId in _selectedEquipmentNameIds) {
      selectedEquipmentCategoryIdList.add(_selectedNameId);
      InventoryCategoryModel? e = equipmentCategoryList.firstWhere((element) {
        return element?.id == _selectedNameId;
      });
      filteredequipmentsList.add(e);
    }
    print({
      "selectedEquipmentsIdList le":
          selectedEquipmentCategoryIdList.value.length,
      "filteredEquipmentsList": filteredequipmentsList.value.length
    });
  }

  Future<void> startMCExecutionButton() async {
    final _startMCExecutionBtn =
        await addModuleCleaningExecutionPresenter.startMCExecutionButton(
            executionId: mcid.value, facility_id: facilityId);

    // print('Plan Data:${data['planId']}');
  }

  Future<void> endMcExecutionButton() async {
    final _endMCExecutionBtn = await addModuleCleaningExecutionPresenter
        .endMcExecutionButton(executionId: mcid.value, facility_id: facilityId);

    // print('Plan Data:${data['planId']}');
  }

  Future<void> startMCExecutionScheduleButton(
      {int? scheduleID, int? facility_id}) async {
    final _startMCScheduleExecutionBtn =
        await addModuleCleaningExecutionPresenter
            .startMCExecutionScheduleButton(
                scheduleId: scheduleID, facility_id: facility_id);

    // print('Plan Data:${data['planId']}');
  }

  Future<void> endMCScheduleExecutionButton(
      {int? scheduleID, int? ptw_id}) async {
    var _comment = descriptionOfWorkDoneCtrlr.text.trim();
    ClosePermitModel ptwClose = ClosePermitModel(
        id: ptw_id, comment: _comment, conditionIds: [1, 2, 3, 4], fileIds: []);
    var closePtwJsonString = ptwClose.toJson();

    final _endMCScheduleExecutionBtn =
        await addModuleCleaningExecutionPresenter.endMCScheduleExecutionButton(
            scheduleId: scheduleID,
            closePtwJsonString: closePtwJsonString,
            isLoading: true,
            facility_id: facilityId);
  }

  void endMCExecutionButton({int? id}) async {
    {
      String _remark = remarkTextFieldCtrlr.text.trim();

      late List<Equipments> equipments_list = [];

      filteredequipmentsList.forEach((e) {
        equipments_list.add(Equipments(id: e?.id));
      });

      EndMCExecutionModel endMCModel = EndMCExecutionModel(
          scheduleId: data['planId'],
          // scheduleId: scheduleId.first,
          executionId: mcid.value,
          cleaningDay: data['cleaningDays'],
          waterUsed: data['waterUsed'],
          remark: _remark,
          equipments: equipments_list
          // [

          //  Equipments(id: 10),
          //  Equipments(id: 9)
          //  ]
          );

      var endJsonString = endMCModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response =
          await addModuleCleaningExecutionPresenter.endMCExecutionButton(
              endJsonString: endJsonString,
              isLoading: true,
              facility_id: facilityId);
      print('EndJsonData:$endJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> getMCExecutionDetail(
      {required int executionId, required int facilityId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    mcExecutionDetailsList?.value = <EndMCExecutionDetailsModel>[];

    final _mcExecutionDetails = await addModuleCleaningExecutionPresenter
        .getMCExecutionDetail(executionId: executionId, facilityId: facilityId);
    print('MC Execution Detail:$_mcExecutionDetails');

    if (_mcExecutionDetails != null) {
      mcExecutionDetailsModel.value = _mcExecutionDetails;
      plannedAtDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${mcExecutionDetailsModel.value?.plannedAt}'))}';
      startedAtDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${mcExecutionDetailsModel.value?.startedAt}'))}';
      final sortedSchedules = mcExecutionDetailsModel.value?.schedules ?? [];
      sortedSchedules
          .sort((a, b) => a.cleaningDay!.compareTo(b.cleaningDay ?? 0));

      listSchedules?.value = sortedSchedules;

      //  listSchedules?.value = mcExecutionDetailsModel.value?.schedules ?? [];
      scheduleId =
          listSchedules!.map((element) => element?.scheduleId).toList();
      print('ScheduleId: ${scheduleId}');

      rowItem.value = [];
      schedules?.value = _mcExecutionDetails.schedules;
      bool allStatus383 =
          schedules!.every((schedule) => schedule?.status == 383);

      allScheduleTrue.value = allStatus383;

      _mcExecutionDetails.schedules.forEach((element) {
        rowItem.value.add([
          {"key": "Schedule Id", "value": '${element.scheduleId}'},
          {"key": "Days", "value": '${element.cleaningDay}'},
          {"key": "Scheduled Module", "value": '${element.scheduled}'},
          {"key": "Cleaned", "value": '${element.cleaned}'},
          {"key": "Abandoned", "value": '${element.abandoned}'},
          {"key": "Pending", "value": '${element.pending}'},
          {"key": "Type", "value": '${element.cleaningTypeName}'},
          {"key": "Water Used", "value": '${element.waterUsed}'},
          {"key": "Remark", "value": '${element.remark_of_schedule}'},
          {"key": "Permit Code", "value": '${element.permit_code}'},
          {
            "key": "Permit Status",
            "value": '${element.status_short_ptw}' //ptw${element.ptw_status}'
          },
          {
            "key": "Status",
            "value": '${element.status_short}' //st${element.status}'
          },
          {'key': "Actions", "value": ''},
        ]);
      });
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<FacilityModel>):
        {
          if (value != "Please Select") {
            int facilityIndex =
                facilityList.indexWhere((x) => x?.name == value);

            _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          } else {
            facilityId = 0;
          }
        }
        break;
      case const (RxList<EmployeeModel>):
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
      case const (RxList<ModuleListModel>):
        {
          if (value != "Please Select") {
            int moduleListIndex =
                moduleList.indexWhere((x) => x?.name == value);
            selectedModuleListId = moduleList[moduleListIndex]?.id ?? 0;
            print('Module List Id: $selectedModuleListId');
          } else {
            selectedModuleListId = 0;
          }
        }
        break;

      default:
        {}
        break;
    }
  }

  Future<void> editIncidentReport({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }

  approveShecduleExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response =
          await addModuleCleaningExecutionPresenter.approveShecduleExecution(
              approvetoJsonString: approvetoJsonString,
              isLoading: true,
              facility_id: facilityId);
      if (response == true) {
        Get.offAllNamed(Routes.moduleCleaningListExecution);
      }
    }
  }

  rejectShecduleExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response =
          await addModuleCleaningExecutionPresenter.rejectShecduleExecution(
              rejecttoJsonString: rejecttoJsonString,
              isLoading: true,
              facility_id: facilityId);
      if (response == true) {
        Get.offAllNamed(Routes.moduleCleaningListExecution);
      }
    }
  }

  endApproveExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response =
          await addModuleCleaningExecutionPresenter.endApproveExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.moduleCleaningListExecution);
      }
    }
  }

  endRejectExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response =
          await addModuleCleaningExecutionPresenter.endRejectExecution(
              rejecttoJsonString: rejecttoJsonString,
              isLoading: true,
              facility_id: facilityId);
      if (response == true) {
        Get.offAllNamed(Routes.moduleCleaningListExecution);
      }
    }
  }

  abandonedApproveExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response =
          await addModuleCleaningExecutionPresenter.abandonedApproveExecution(
              approvetoJsonString: approvetoJsonString,
              isLoading: true,
              facility_id: facilityId);
      if (response == true) {
        Get.offAllNamed(Routes.moduleCleaningListExecution);
      }
    }
  }

  abandoneRejectExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response =
          await addModuleCleaningExecutionPresenter.abandoneRejectExecution(
              rejecttoJsonString: rejecttoJsonString,
              isLoading: true,
              facility_id: facilityId);
      if (response == true) {
        Get.offAllNamed(Routes.moduleCleaningListExecution);
      }
    }
  }

  assignToMC({required int id}) async {
    {
      final response = await addModuleCleaningExecutionPresenter.assignToMC(
          assignId: selectedAssignedToId,
          taskId: id,
          isLoading: true,
          facility_id: facilityId);
    }
  }

  Future<void> generateInvoice() async {
    final PdfDocument document = PdfDocument();

    final PdfPage page = document.pages.add();

    final Size pageSize = page.getClientSize();

    var url = "assets/assets/files/logo.png";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;

    PdfBitmap image = PdfBitmap(data);

    final PdfLayoutResult result = drawHeader(page, pageSize, document, image);

    final List<int> bytes = await document.save();

    document.dispose();

    await saveAndLaunchFile(bytes, 'MC Task View Report');
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    final PdfPen borderPen = PdfPen(PdfColor(142, 180, 219), width: 1.0);
    final PdfBrush backgroundBrush = PdfSolidBrush(PdfColor(217, 226, 243));
    final PdfFont headerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);

    // Draw images
    page.graphics.drawImage(image, Rect.fromLTWH(15, 10, 100, 80));

    // Site name section
    double currentY = 100;
    double sectionHeight = 20;

    page.graphics.drawRectangle(
        pen: borderPen,
        bounds:
            Rect.fromLTWH(25, currentY, pageSize.width - 50, sectionHeight));
    page.graphics.drawString('Site name', headerFont,
        bounds: Rect.fromLTWH(30, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Module Cleaning Information
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds:
            Rect.fromLTWH(25, currentY, pageSize.width - 50, sectionHeight));
    page.graphics.drawString('Module Cleaning information', headerFont,
        bounds: Rect.fromLTWH(30, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw Left Side PM Information Details
    double labelWidth = 150;
    double valueWidth = 80;
    double labelX = 30;
    double valueX = labelX + labelWidth + 5;

    List<String> pmInfoLabelsLeft = [
      'Job ID',
      'Permit ID',
      'Target (No.of Modules)',
      'Actual (No.of Modules)',
      'Deviation',
      'No. of manpower',
      'Performed by',
      'Cleaning type'
    ];
    List<String> pmInfoValuesLeft = [
      'Job ID${mcExecutionDetailsModel.value?.id}',
      'Permit ID${mcExecutionDetailsModel.value?.permit_id}',
      'Target (No.of Modules)${mcExecutionDetailsModel.value?.noOfDays}',
      'Actual (No.of Modules)${mcExecutionDetailsModel.value?.noOfDays}',
      'Deviation${mcExecutionDetailsModel.value?.noOfDays}',
      'No. of manpower${mcExecutionDetailsModel.value?.noOfDays}',
      'Performed by${mcExecutionDetailsModel.value?.plannedBy}',
      'Cleaning type${mcExecutionDetailsModel.value?.noOfDays}',
    ];
    double rowHeight = 15;

    for (int i = 0; i < pmInfoLabelsLeft.length; i++) {
      page.graphics.drawString(pmInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(pmInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw Right Side PM Information Details
    currentY -= pmInfoLabelsLeft.length *
        rowHeight; // Reset currentY for right side alignment
    double labelXRight = pageSize.width / 2 + 10;
    double valueXRight = labelXRight + labelWidth + 5;
    double rightRowSpacing = 10; // Less space between rows on the right side

    List<String> pmInfoLabelsRight = [
      'Cleaning cycle no',
      'Date',
      'Cleaning start time',
      'Cleaning end time',
      'Rain status',
      'Water used',
      'Approved by',
    ];
    List<String> pmInfoValuesRight = [
      'Cleaning cycle no',
      'Date',
      'Cleaning start time',
      'Cleaning end time',
      'Rain status',
      'Water used',
      'Approved by',
    ];

    for (int i = 0; i < pmInfoLabelsRight.length; i++) {
      page.graphics.drawString(pmInfoLabelsRight[i], contentFont,
          bounds:
              Rect.fromLTWH(labelXRight, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(pmInfoValuesRight[i], contentFont,
          bounds:
              Rect.fromLTWH(valueXRight, currentY + 5, valueWidth, rowHeight));
      currentY += rightRowSpacing;
    }

    // Add space before Equipment ID section
    currentY += 60; // Added more space above Equipment ID
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds:
            Rect.fromLTWH(25, currentY, pageSize.width - 50, sectionHeight));
    page.graphics.drawString('Equipment ID', headerFont,
        bounds: Rect.fromLTWH(30, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Equipment Table Headers
    double columnWidth = (pageSize.width - 50) / 4;
    List<String> equipmentHeaders = [
      'S. No',
      'Block ID',
      'Inverter ID',
      'SMB ID'
    ];

    for (int i = 0; i < equipmentHeaders.length; i++) {
      page.graphics.drawString(equipmentHeaders[i], contentFont,
          bounds: Rect.fromLTWH(
              30 + (i * columnWidth), currentY + 5, columnWidth, rowHeight));
    }
    currentY += rowHeight;

    // Equipment Table Rows
    for (int i = 0;
        i < (mcExecutionDetailsModel.value?.schedules?.length ?? 0);
        i++) {
      var schedule = mcExecutionDetailsModel.value!.schedules![i];

      page.graphics.drawString('${i + 1}', contentFont,
          bounds: Rect.fromLTWH(30, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString(
          'blockID', contentFont, //'${schedule?.blockId}', contentFont,
          bounds: Rect.fromLTWH(
              30 + columnWidth, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString(
          'inverterId', contentFont, //'${schedule?.inverterId}', contentFont,
          bounds: Rect.fromLTWH(
              30 + 2 * columnWidth, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString(
          'smbId', contentFont, //'${schedule?.smbId}', contentFont,
          bounds: Rect.fromLTWH(
              30 + 3 * columnWidth, currentY + 5, columnWidth, rowHeight));
      currentY += rowHeight;
    }

    // Work Description Section
    currentY += 10;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds:
            Rect.fromLTWH(25, currentY, pageSize.width - 50, sectionHeight));
    page.graphics.drawString('Work description', headerFont,
        bounds: Rect.fromLTWH(30, currentY + 5, 0, 0));
    currentY += sectionHeight;

    String staticDescription =
        "This is a static description text that explains the work done or provides additional details.";
    page.graphics.drawString(staticDescription, contentFont,
        bounds:
            Rect.fromLTWH(30, currentY + 5, pageSize.width - 60, rowHeight * 2),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));
    currentY += rowHeight * 2;

    // Signature of trainer section
    final String signatureText = 'Signature of trainer';
    final Size signatureSize = contentFont.measureString(signatureText);

    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageSize.width - signatureSize.width - 30,
            currentY + 20, signatureSize.width, pageSize.height - 120))!;
  }
}
