import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/end_mc_execution_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/update_mc_execution_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
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

  int? scheduledId = 0;

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


  ///Permit Type
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;

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

  ///Date Time
  var startedAtDateTimeCtrlrWeb = TextEditingController();
  var plannedAtDateTimeCtrlrWeb = TextEditingController();

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

  List<int?> scheduleId = [];

  ///

  Map<String, dynamic> data = {};
  dynamic planId = [];
  @override
  void onInit() async {
    //  isCheckedList.assignAll(List.generate(equipmentList.length, (index) => false));

    data = Get.arguments;
    print('Data Id ${data['id']}');
    print('Data Status ${data['status']}');
    print('plan Id:${data['planId']}');
    print('cleaning Days:${data['cleaningDays']}');
    print('water Used:${data['waterUsed']}');

    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getTypePermitList();
    });

    Future.delayed(Duration(seconds: 1), () {
      getInventoryCategoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getEquipmentModelList(facilityId, true);
    });

    if (data['id'] != null) {
      Future.delayed(Duration(seconds: 1), () {
        getMCExecutionDetail(executionId: data['id']!);
      });
    }

    super.onInit();
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

  Future<void> getEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <EquipmentListModel>[];

    final list = await addModuleCleaningExecutionPresenter
        .getEquipmentModelList(isLoading: isLoading, facilityId: facilityId);
    // print('incidentReportFacilityId$facilityId');
    // print('Incident Report List:$list');
    for (var equipment_list in list) {
      equipmentList.add(equipment_list);
    }

    if (list != null) {
      equipmentList.value = list;
      // filteredData.value = incidentReportList.value;
      // print('Filtered data:${filteredData.value}');

      // if (filteredData != null && filteredData.isNotEmpty) {
      //   incidentReportModelList = filteredData[0];
      //   var incidentListJson = incidentReportModelList?.toJson();
      //   incidentListTableColumns.value = <String>[];
      //   for (var key in incidentListJson?.keys.toList() ?? []) {
      //     incidentListTableColumns.add(key);
      //   }
      // }
    }

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
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  ///Update MC Schedule Execution
  void updateMCScheduleExecution(
      {int? scheduleId, int? cleaningDay, int? waterUsed}) async {
    {
      var remark;
      rowItem.value.forEach((element) {
        // items.add(item);
      });
      print('data${rowItem.value}');

      // String remark = items.join(', ');
      // print('Items remark:${remark}');
      //  late List<LotoList> loto_map_list = [];

      // filteredEquipmentNameList.forEach((e) {
      //   loto_map_list.add(LotoList(Loto_id: e?.id, Loto_Key: e?.name));
      // });
      List<int> data = [];
      
      equipmentList.value.forEach((element) {
        if (element!.isChecked!) {
          data.add(element.invId!);
        }
      });
      print('cleaned:$data');

      UpdateMcScheduleExecutionModel updateMCScheduleExecutionModel =
          UpdateMcScheduleExecutionModel(
              scheduleId: scheduleId,
              cleaningDay: cleaningDay,
              waterUsed: waterUsed,
              remark: rowItem.value[0][8]["value"],
              cleanedEquipmentIds: [10, 11],
              abandonedEquipmentIds: [12]);

      var updateMCScheduleExecutionJsonString =
          updateMCScheduleExecutionModel.toJson();
      Map<String, dynamic>? responseUpdateMCExecution =
          await addModuleCleaningExecutionPresenter.updateMCScheduleExecution(
        updateMCScheduleExecutionJsonString:
            updateMCScheduleExecutionJsonString,
        isLoading: true,
      );

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
      String _comment = commentTextFieldCtrlr.text.trim();

      CommentModel commentAbandonModel =
          CommentModel(id: id, comment: _comment);

      var abandoneJsonString = commentAbandonModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      Map<String, dynamic>? response =
          await addModuleCleaningExecutionPresenter.abandonAllExecutionButton(
        abandoneJsonString: abandoneJsonString,
        isLoading: true,
      );
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
      planId: data['planId'],
    );

    // print('Plan Data:${data['planId']}');
  }

  Future<void> startMCExecutionScheduleButton({int? scheduleID}) async {
    final _startMCScheduleExecutionBtn =
        await addModuleCleaningExecutionPresenter
            .startMCExecutionScheduleButton(
      scheduleId: scheduleId.first,
    );

    // print('Plan Data:${data['planId']}');
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
          executionId: data['id'],
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
      );
      print('EndJsonData:$endJsonString');
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> getMCExecutionDetail({required int executionId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    mcExecutionDetailsList?.value = <EndMCExecutionDetailsModel>[];

    final _mcExecutionDetails = await addModuleCleaningExecutionPresenter
        .getMCExecutionDetail(executionId: executionId);
    print('MC Execution Detail:$_mcExecutionDetails');

    if (_mcExecutionDetails != null) {
      mcExecutionDetailsModel.value = _mcExecutionDetails;
      plannedAtDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${mcExecutionDetailsModel.value?.plannedAt}'))}';
      startedAtDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${mcExecutionDetailsModel.value?.startedAt}'))}';
      listSchedules?.value = mcExecutionDetailsModel.value?.schedules ?? [];
      scheduleId =
          listSchedules!.map((element) => element?.scheduleId).toList();
      print('ScheduleId: ${scheduleId}');

      rowItem.value = [];
      schedules?.value = _mcExecutionDetails.schedules;

      _mcExecutionDetails.schedules.forEach((element) {
        rowItem.value.add([
          {"key": "Schedule Id", "value": '${element!.scheduleId}'},
          {"key": "Days", "value": '${element.cleaningDay}'},
          {"key": "Scheduled Module", "value": '${element.scheduledModules}'},
          {"key": "Cleaned", "value": '${element.cleanedModules}'},
          {"key": "Abandoned", "value": '${element.abandonedModules}'},
          {"key": "Pending", "value": '${element.pendingModules}'},
          {"key": "Type", "value": '${element.cleaningTypeName}'},
          {"key": "Water Used", "value": '${element.waterUsed}'},
          {"key": "Remark", "value": '${element.remark}'},
          {"key": "Status", "value": '${element.status_short}'},
          {'key': "Actions", "value": ''},
        ]);
      });
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      case RxList<ModuleListModel>:
        {
          int moduleListIndex = moduleList.indexWhere((x) => x?.name == value);
          selectedModuleListId = moduleList[moduleListIndex]?.id ?? 0;
          print('Module List Id: $selectedModuleListId');
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  // void createEscalationMatrix() async {
  //   List<Escalation> days = [];
  //   rowItem.value.forEach((element) {
  //     Escalation day = Escalation(
  //       days: int.tryParse(element[0]["value"] ?? '0'),
  //       role_id: dropdownMapperData[element[1]["value"]]?.id,
  //     );
  //     days.add(day);
  //   });

  //   print('Days:${days}');

  //   late List<Status_escalation> state_escalation_list = [];

  //   state_escalation_list
  //       .add(Status_escalation(status_id: 102, escalation: days));

  //   CreateEscalationMatrixModel createEscalationMatrixModel =
  //       CreateEscalationMatrixModel(
  //     module_id: selectedModuleListId,
  //     status_escalation: state_escalation_list,
  //   );

  //   var escalationMatrixJsonString = [createEscalationMatrixModel.toJson()];
  //   Map<String, dynamic>? responseCreateEscalationMatrixModel =
  //       await addEscalationPresenter.createEscalationMatrix(
  //     createEscalationMatrix: escalationMatrixJsonString,
  //     isLoading: true,
  //   );

  //   if (responseCreateEscalationMatrixModel == null) {
  //     //  CreateNewPermitDialog();
  //     // showAlertDialog();
  //   }
  //   print('Add Escalation Matrix   data: $escalationMatrixJsonString');
  // }

  // void createEscalationMatrix() async {
  //   {
  //     List<Escalation> days = [];
  //     rowItem.value.forEach((element) {
  //       Escalation day = Escalation(
  //         role_id: dropdownMapperData[element[1]["value"]]?.role_id,
  //         days: int.tryParse(element[0]["value"] ?? '0'),
  //       );
  //       days.add(day);
  //     });

  //     late List<Status_escalation> status_escalation = [];

  //     status_Escalation.forEach((e) {
  //       status_escalation.add(
  //           Status_escalation(status_id: e.status_id, escalation: e.escalation
  //               // is_required: e.is_required
  //               ));
  //     });

  //     CreateEscalationMatrixModel createEscalationMatrixModel =
  //         CreateEscalationMatrixModel();

  //     var escalationMatrixJsonString = [
  //       {
  //         "module_id": selectedModuleListId,
  //         "status_escalation": status_escalation
  //       }
  //     ];
  //     Map<String, dynamic>? responseCreateEscalationMatrix =
  //         await viewIncidentReportPresenter.createEscalationMatrix(
  //       createEscalationMatrix: escalationMatrixJsonString,
  //       isLoading: true,
  //     );

  //     if (responseCreateEscalationMatrix == null) {}
  //     print('Create Escalation Matrix data: $escalationMatrixJsonString');
  //   }
  // }

  Future<void> editIncidentReport({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }
}
