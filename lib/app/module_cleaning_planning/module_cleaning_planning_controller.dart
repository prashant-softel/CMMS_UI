import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:cmms/domain/models/create_mc_plan_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/mc_details_plan_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home/home_controller.dart';

class ModuleCleaningPlanningController extends GetxController {
  ///
  ModuleCleaningPlanningController(
    this.moduleCleaningPlanningPresenter,
  );
  ModuleCleaningPlanningPresenter moduleCleaningPlanningPresenter;
  final HomeController homecontroller = Get.find();
  var startDateTimeCtrlr = TextEditingController();
  var validTillTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedmcstarttime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;
  var validTillTimeCtrlrBuffer;
  var startDateTimeCtrlrBuffer;

  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  RxList<Schedules?> schedules = <Schedules>[].obs;
  Rx<DateTime> selectedStartTime = DateTime.now().obs;
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isEstimatedInvalid = false.obs;
   Rx<bool> isstartdateInvalid = false.obs;

  
  Rx<bool> isAssignedToSelected = true.obs;
  Rx<String> selectedAssignedTo = ''.obs;
  int selectedAssignedToId = 0;
  bool openStartDatePicker = false;
  var startDateTc = TextEditingController();
  // var mcTitelCtrlr = TextEditingController();

   Rx<bool> isFormInvalid = false.obs;
  TextEditingController mcTitelCtrlr = TextEditingController();

  var durationInDayCtrlr = TextEditingController();

  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;

  var selectedOption = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> id = 0.obs;
  Rx<int> planId = 0.obs;

  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;
  RxList<SMBS> smblist = <SMBS>[].obs;

  // RxList<McPalningDetailsModel?>? mcPlanDetailsList =
  //     <McPalningDetailsModel?>[].obs;
  Rx<McPalningDetailsModel?> mcPlanDetailsModel = McPalningDetailsModel().obs;
  RxList<TypeModel> days = <TypeModel>[].obs;
  void dayCount({required int dayCount}) {
    days = <TypeModel>[].obs;

    for (int i = 1; i <= dayCount; i++) {
      days.add(TypeModel(name: 'Day $i', id: "$i"));
    }
  }

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
      await setMcId();
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 1), () {
          getEquipmentModelList(facilityId, true);
        });
      });
      if (id != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getMcPlanDetail(planId: id.value, facilityId: facilityId);
        });
      }
      Future.delayed(Duration(seconds: 1), () {
        getFrequencyList();
      });

      // getMcPlanHistory(id: id.value);
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  // Future<void> setUserId() async {
  //   try {
  //     var dataFromPreviousScreen = Get.arguments;

  //     id.value = dataFromPreviousScreen['id'];
  //     // id= Get.arguments;
  //     print('AddStock:$id');
  //   } catch (e) {
  //     print(e.toString() + 'userId');
  //   }
  // }
  Future<void> setMcId() async {
    try {
      final _mcid = await moduleCleaningPlanningPresenter.getValueMcId();
      final _planId = await moduleCleaningPlanningPresenter.getValuePlanId();

      if (_mcid == null || _mcid == '' || _mcid == "null") {
        var dataFromPreviousScreen = Get.arguments;

        id.value = dataFromPreviousScreen['mcid'];
        planId.value = dataFromPreviousScreen['planId'];

        moduleCleaningPlanningPresenter.saveValueMcId(
            mcid: id.value.toString());
        moduleCleaningPlanningPresenter.saveValuePlanId(
            planId: planId.value.toString());
      } else {
        id.value = int.tryParse(_mcid) ?? 0;
        planId.value = int.tryParse(_planId.toString()) ?? 0;
      }
    } catch (e) {
      //  Utility.showDialog(e.toString(), 'mcid');
    }
  }

  Future<void> getEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <EquipmentListModel>[];

    final list = await moduleCleaningPlanningPresenter.getEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);

    equipmentList.value = list;

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
    String _startDateTc = htmlEscape.convert(startDateTimeCtrlr.text.trim());
    print("Start Date: ${_startDateTc}");

    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
        planId: 0,
        // assignedToId: 0,

        facilityId: facilityId,
        startDate: _startDateTc,
        // startDate: "2023-12-02",
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
          cleaningType: int.tryParse(
                  "${row[4]['value'] == 'Dry' ? 1 : (row[4]['value'] == 'Wel' ? 2 : null)}") ??
              null,
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
    String _startDateTc = startDateTc.text.trim();

    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
        planId: id.value,
        facilityId: facilityId,
        startDate: _startDateTc,
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

  Future<void> getMcPlanDetail(
      {required int planId, required int facilityId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    // mcPlanDetailsList?.value = <McPalningDetailsModel>[];

    final _mcPlanDetails =
        await moduleCleaningPlanningPresenter.getMcPlanDetail(
            planId: planId, facilityId: facilityId, isLoading: true);
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
          if(value != "Please Select"){
            int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
          selectedfrequency.value = value;
           isSelectedfrequency.value=true;
          }else{
            selectedfrequencyId=0;
          }
        }
        break;

      default:
        {}
        break;
    }
  }

  Future pickDateTime(BuildContext context) async {
    var dateTime = selectedStartTime.value;
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
    selectedStartTime.value = dateTime;
    startDateTc
      ..text = DateFormat("dd-MM-yyyy HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: startDateTc.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? dateTime = selectedStartTime.value;

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
    DateTime dateTime = selectedStartTime.value;

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
  void checkFromModule(){
    if(mcTitelCtrlr.text.trim().length==0){
      isTitleInvalid.value=true;
      isFormInvalid.value = true;
    }
 if (selectedfrequency == '') {
      isSelectedfrequency.value = false;
      isFormInvalid.value = true;
    }
      if(durationInDayCtrlr.text.trim().length==0){
      isEstimatedInvalid.value=true;
      isFormInvalid.value = true;
    }
  
     if (startDateTimeCtrlrBuffer.text.trim().length == 0) {
      isstartdateInvalid.value= true;
       isFormInvalid = false.obs;;
    }
     if (validTillTimeCtrlr.text.trim().length == 0) {
      isstartdateInvalid.value = true;
      isFormInvalid = false.obs;;
    }
  }
}
