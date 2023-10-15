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

  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;

  var selectedOption = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> id = 0.obs;

  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;
  RxList<SMBS> smblist = <SMBS>[].obs;

  // RxList<McPalningDetailsModel?>? mcPlanDetailsList =
  //     <McPalningDetailsModel?>[].obs;
  Rx<McPalningDetailsModel?> mcPlanDetailsModel = McPalningDetailsModel().obs;
  var days = <TypeModel>[
    TypeModel(name: 'Day 1', id: "1"),
    TypeModel(name: 'Day 2', id: "2"),
    TypeModel(name: 'Day 3', id: "3"),
  ];
  Map<String, TypeModel> typedropdownMapperData = {};

  RxList<TypeModel> cleaningType = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "1"),
    TypeModel(name: 'Wet', id: "2"),
  ].obs;
  // var days = <TypeModel>[
  //   TypeModel(name: "Please Select", id: "0"),
  //   TypeModel(name: 'Day 1', id: "1"),
  //   TypeModel(name: 'Day 2', id: "2"),
  //   TypeModel(name: 'Day 3', id: "3"),
  // ];
  void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfInverters", "value": ''},
      {'key': "noOfSMBs", "value": ''},
      {'key': "noOfModules", "value": ''},
      {'key': "cleaningType", "value": 'Please Select', "id": ""},
    ]);
  }

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

  Future<void> getEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <EquipmentListModel>[];

    final list = await moduleCleaningPlanningPresenter.getEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);

    if (list != null) {
      equipmentList.value = list;
    }

    update(['equipment_list']);
  }

  void createMcPlan() async {
    var mappedData = {};
    List<Schedule> schedules = [];

    equipmentList.value.forEach((element) {
      (element?.smbs ?? []).forEach((smbsItem) {
        if (smbsItem.selectedDay != null) {
          mappedData[smbsItem.selectedDay] = [
            ...(mappedData[smbsItem.selectedDay] ?? []),
            smbsItem.smbId
          ];
        }
      });
    });
    mappedData.forEach((key, value) {
      List<Equipments> eqp = value.map<Equipments>((e) {
        return Equipments(id: e);
      }).toList();
      schedules
          .add(Schedule(cleaningDay: int.tryParse('${key}'), equipments: eqp));
    });

    print({"mappedData": mappedData});

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _mcTitelCtrlr = mcTitelCtrlr.text.trim();

    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
        // planId: 0,
        // assignedToId: 0,

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
    if (responseCreateMcModel == null) {}
    print('Create  Create GO  data: $createMcModelJsonString');
  }

  void updateMcPlan() async {
    // return;
    int i = -1;

    List<Schedule>? sch =
        mcPlanDetailsModel.value?.schedules.map<Schedule>((e) {
      i++;
      var row = rowItem.value[i];
      return Schedule(
          cleaningDay: e.cleaningDay,
          cleaningType: int.tryParse("${row[4]['value']}") ?? 0,
          equipments: e.equipments?.map((e) {
            return Equipments(id: e?.id);
          }).toList());
    }).toList();
    print({"sch": sch});
    // rowItem.value.forEach((element) {
    //   Schedule item = Schedule(
    //     cleaningType: int.tryParse('${element[4]["id"]}'),
    //   );

    //   // Schedule.add(item);
    // });

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _mcTitelCtrlr = mcTitelCtrlr.text.trim();

    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
        facilityId: facilityId,
        frequencyId: selectedfrequencyId,
        noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
        title: _mcTitelCtrlr,
        schedules: sch ?? []);

    var updateMcModelJsonString = [createMcModel.toJson()];
    Map<String, dynamic>? responseCreateMcModel =
        await moduleCleaningPlanningPresenter.updateMcPlan(
      updateMcPlans: updateMcModelJsonString,
      isLoading: true,
    );
    if (responseCreateMcModel == null) {}
    print('update MC   data: $updateMcModelJsonString');
  }

  Future<void> getMcPlanDetail({required int planId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    // mcPlanDetailsList?.value = <McPalningDetailsModel>[];

    final _mcPlanDetails = await moduleCleaningPlanningPresenter
        .getMcPlanDetail(planId: planId, isLoading: true);
    print('MC plan Detail:$_mcPlanDetails');

    if (_mcPlanDetails != null) {
      mcPlanDetailsModel.value = _mcPlanDetails;
      mcTitelCtrlr.text = mcPlanDetailsModel.value?.title ?? "";
      selectedfrequency.value = mcPlanDetailsModel.value?.frequency ?? '';
      startDateTc.text = mcPlanDetailsModel.value?.startDate ?? '';
      durationInDayCtrlr.text =
          mcPlanDetailsModel.value?.noOfCleaningDays.toString() ?? "";

      rowItem.value = [];
      schedules.value = _mcPlanDetails.schedules;
      _mcPlanDetails.schedules.forEach(
        (element) {
          rowItem.value.add(
            [
              {"key": "day", "value": '${element.cleaningDay}'},
              {"key": "noOfInverters", "value": '${element.invs}'},
              {'key': "noOfSMBs", "value": '${element.smbs}'},
              {'key': "noOfModules", "value": '${element.scheduledModules}'},
              {'key': "cleaningType", "value": 'Please Select'},
            ],
          );
        },
      );
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
