import 'dart:async';

import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:cmms/domain/models/create_mc_plan_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/mc_details_plan_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/inventory_category_model.dart';
import '../home/home_controller.dart';

class ModuleCleaningPlanningController extends GetxController {
  ///
  ModuleCleaningPlanningController(
    this.moduleCleaningPlanningPresenter,
  );
  ModuleCleaningPlanningPresenter moduleCleaningPlanningPresenter;
  final HomeController homecontroller = Get.find();

  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  RxList<Schedules?> schedules = <Schedules>[].obs;

  Rx<bool> isAssignedToSelected = true.obs;
  Rx<String> selectedAssignedTo = ''.obs;
  int selectedAssignedToId = 0;
  bool openStartDatePicker = false;
  var startDateTc = TextEditingController();
  // var mcTitelCtrlr = TextEditingController();
  TextEditingController mcTitelCtrlr = TextEditingController();

  var durationInDayCtrlr = TextEditingController();
  RxList<McPalningDetailsModel?>? getMcDetailsByIDModelList =
      <McPalningDetailsModel?>[].obs;
  Rx<McPalningDetailsModel?> getMcDetailsByIDModel =
      McPalningDetailsModel().obs;

  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;

  var selectedOption = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> id = 0.obs;

  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;
  RxList<SMBS> smblist = <SMBS>[].obs;

  RxList<McPalningDetailsModel?>? mcPlanDetailsList =
      <McPalningDetailsModel?>[].obs;
  Rx<McPalningDetailsModel?> mcPlanDetailsModel = McPalningDetailsModel().obs;
  var days = <TypeModel>[
    TypeModel(name: 'Day 1', id: "0"),
    TypeModel(name: 'Day 2', id: "1"),
    TypeModel(name: 'Day 3', id: "2"),
  ];
  Map<String, TypeModel> typedropdownMapperData = {};

  var type = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "0"),
    TypeModel(name: 'Wet', id: "1"),
  ];
  // var days = <TypeModel>[
  //   TypeModel(name: "Please Select", id: "0"),
  //   TypeModel(name: 'Day 1', id: "1"),
  //   TypeModel(name: 'Day 2', id: "2"),
  //   TypeModel(name: 'Day 3', id: "3"),
  // ];
  // void addRowItem() {
  //   rowItem.value.add([
  //     {"key": "day", "value": ''},
  //     {"key": "noOfInverters", "value": ''},
  //     {'key': "noOfSMBs", "value": ''},
  //     {'key': "noOfModules", "value": ''},
  //     {'key': "type", "value": 'Please Select'},
  //   ]);
  // }

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
      });
      if (id != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getMcPlanDetail(planId: id.value);
        });
      }
      Future.delayed(Duration(seconds: 1), () {
        getFrequencyList();
      });

      Future.delayed(Duration(seconds: 1), () {
        getEquipmentModelList(facilityId, true);
      });

      // getMcPlanHistory(id: id.value);
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      var dataFromPreviousScreen = Get.arguments;

      id.value = dataFromPreviousScreen['id'];
      // id= Get.arguments;
      print('AddStock:$id');
    } catch (e) {
      print(e.toString() + 'userId');
    }
  }
  // void onInit() async {
  //   try {
  //     facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
  //       facilityId = event;

  //       Future.delayed(Duration(seconds: 1), () {
  //         getFrequencyList();
  //       });

  //       Future.delayed(Duration(seconds: 1), () {
  //         getEquipmentModelList(facilityId, true);
  //       });
  //       Future.delayed(Duration(seconds: 1), () {
  //         getAssignedToList();
  //       });
  //       if (id != 0) {
  //         Future.delayed(Duration(seconds: 1), () {
  //           getMcPlanDetail(planId: id.value);
  //         });
  //       }
  //     });
  //     super.onInit();
  //   } catch (e) {
  //     print(e);
  //   }

  //   super.onInit();
  // }

  Future<void> getEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <EquipmentListModel>[];

    final list = await moduleCleaningPlanningPresenter.getEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);
    // print('incidentReportFacilityId$facilityId');
    // print('Incident Report List:$list');
    // for (var equipment_list in list) {
    //   equipmentList.add(equipment_list);
    // }

    if (list != null) {
      equipmentList.value = list;
      // for (var equimentCategory in list) {
      //   smblist.add(equimentCategory.smbs as SMBS);
      // }

      // }
    }

    update(['equipment_list']);
  }

  void createMcPlan() async {
    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _mcTitelCtrlr = mcTitelCtrlr.text.trim();
    List<Schedule> schedules = [];
    List<Equipments?>? equipments = [];
    equipmentList.forEach((e) {
      e?.smbs.forEach((element) {
        equipments.add(Equipments(id: element.smbId ?? 0));
      });
    });
    equipmentList.forEach((e) {
      schedules.add(
          Schedule(cleaningDay: 1, cleaningType: 1, equipments: equipments));
    });
    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
        // id: 0,
        facilityId: facilityId,
        frequencyId: selectedfrequencyId,
        noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
        title: _mcTitelCtrlr,
        schedules: schedules);

    var createMcModelJsonString = [createMcModel.toJson()];
    Map<String, dynamic>? responseCreateMcModel =
        await moduleCleaningPlanningPresenter.createMcPlan(
      createMcPlans: createMcModelJsonString,
      isLoading: true,
    );

    if (responseCreateMcModel != null) {
      getMcPlanDetail(planId: responseCreateMcModel['id'][0]);
    }
    // print('Create Mc  data: ${responseCreateMcModel!['id'][0]}');
  }

  Future<void> getMcPlanDetail({required int planId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    mcPlanDetailsList?.value = <McPalningDetailsModel>[];

    final _mcPlanDetails = await moduleCleaningPlanningPresenter
        .getMcPlanDetail(planId: planId, isLoading: true);
    print('MC plan Detail:$_mcPlanDetails');

    if (_mcPlanDetails != null) {
      mcPlanDetailsModel.value = _mcPlanDetails;
      mcTitelCtrlr.text = mcPlanDetailsModel.value?.title ?? "";
      selectedfrequency.value = mcPlanDetailsModel.value?.frequency ?? '';
      startDateTc.text = mcPlanDetailsModel.value?.startDate ?? '';
      // durationInDayCtrlr.text = mcPlanDetailsModel.value.es'

      rowItem.value = [];
      schedules.value = _mcPlanDetails.schedules;
      _mcPlanDetails.schedules.forEach((element) {
        rowItem.value.add([
          {"key": "day", "value": '${element.cleaningDay}'},
          {"key": "noOfInverters", "value": '${element.invs}'},
          {'key': "noOfSMBs", "value": '${element.smbs}'},
          {'key': "noOfModules", "value": '${element.scheduledModules}'},
          {'key': "type", "value": 'Please Select'},
        ]);
      });

      // scheduleId =
      //     listSchedules!.map((element) => element?.scheduleId).toList();
      // print('ScheduleId: ${scheduleId}');

      // rowItem.value = [];
      // schedules?.value = _mcPlanDetails.schedules;

      // _mcPlanDetails.schedules.forEach((element) {
      //   rowItem.value.add([
      //     {"key": "Schedule Id", "value": '${element!.scheduleId}'},
      //     {"key": "Days", "value": '${element.cleaningDay}'},ß
      //     {"key": "Scheduled Module", "value": '${element.scheduledModules}'},
      //     {"key": "Cleaned", "value": '${element.cleanedModules}'},
      //     {"key": "Abandoned", "value": '${element.abandonedModules}'},
      //     {"key": "Pending", "value": '${element.pendingModules}'},
      //     {"key": "Type", "value": '${element.cleaningTypeName}'},
      //     {"key": "Water Used", "value": '${element.waterUsed}'},
      //     {"key": "Remark", "value": '${element.remark}'},
      //     {"key": "Status", "value": '${element.status_short}'},
      //     {'key': "Actions", "value": ''},
      //   ]);
      // });
    }
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList =
        await moduleCleaningPlanningPresenter.getAssignedToList(
      facilityId: facilityId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
      // selectedAssignedTo.value =
      //     getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
    }
  }

  Future<void> getFrequencyList() async {
    final list =
        await moduleCleaningPlanningPresenter.getFrequencyList(isLoading: true);

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
          selectedfrequency.value = value;
        }
        break;

      default:
        {}
        break;
    }
  }
}
