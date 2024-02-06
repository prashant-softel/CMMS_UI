import 'dart:async';

import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddVegetationPlanController extends GetxController {
  AddVegetationPlanController(this.addVegetationPresenter);

  AddVegetationPresenter addVegetationPresenter;
  final HomeController homeController = Get.find();

  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  RxList<Schedules?> schedules = <Schedules>[].obs;
  Rx<DateTime> selectedStartTime = DateTime.now().obs;

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

  RxList<VegetationEquipmentModel?> equipmentList =
      <VegetationEquipmentModel?>[].obs;
  RxList<Invs> smblist = <Invs>[].obs;

  // Rx<McPalningDetailsModel?> mcPlanDetailsModel = McPalningDetailsModel().obs;
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
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
      });
      //   if (id != 0) {
      //     Future.delayed(Duration(seconds: 1), () {
      //       getMcPlanDetail(planId: id.value);
      //     });
      //   }
      //   Future.delayed(Duration(seconds: 1), () {
      //     getFrequencyList();
      //   });

      //   Future.delayed(Duration(seconds: 1), () {
      //     getEquipmentModelList(facilityId, true);
      // });

      //   // getMcPlanHistory(id: id.value);
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
      print('AddVegetationPlan:$id');
    } catch (e) {
      print(e.toString() + 'userId');
    }
  }

  Future<void> getVegEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <VegetationEquipmentModel>[];
    final list = await addVegetationPresenter.getVegEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);
    equipmentList.value = list;
    update(['equipment_list']);
  }

  // void createMcPlan() async {
  //   var mappedData = {};
    // List<Schedule> schedules = [];

    // equipmentList.value.forEach((element) {
    //   (element?.invs ?? []).forEach((smbsItem) {
    //     if (smbsItem.selectedDay != null) {
    //       mappedData[smbsItem.selectedDay] = [
    //         ...(mappedData[smbsItem.selectedDay] ?? []),
    //         smbsItem.smbId
    //       ];
    //     }
    //   });
    // });
    // mappedData.forEach((key, value) {
  //     List<Equipments> eqp = value.map<Equipments>((e) {
  //       return Equipments(id: e);
  //     }).toList();
  //     schedules
  //         .add(Schedule(cleaningDay: int.tryParse('${key}'), equipments: eqp));
  //   });

  //   print({"mappedData": mappedData});

  //   String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
  //   String _mcTitelCtrlr = mcTitelCtrlr.text.trim();
  //   String _startDateTc = startDateTc.text.trim();

  //   CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
  //       planId: 0,
  //       // assignedToId: 0,

  //       facilityId: facilityId,
  //       // startDate: _startDateTc,
  //       startDate: "2023-12-02",
  //       frequencyId: selectedfrequencyId,
  //       noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
  //       title: _mcTitelCtrlr,
  //       schedules: schedules);

  //   var createMcModelJsonString = [createMcModel.toJson()];
  //   Map<String, dynamic>? responseCreateMcModel =
  //       await moduleCleaningPlanningPresenter.createMcPlan(
  //     createMcPlans: createMcModelJsonString,
  //     isLoading: true,
  //   );
  //   if (responseCreateMcModel == null) {}
  //   print('Create  Create GO  data: $createMcModelJsonString');
  // }

//   void updateMcPlan() async {
//     // return;
//     int i = -1;

//     List<Schedule>? sch =
//         mcPlanDetailsModel.value?.schedules.map<Schedule>((e) {
//       i++;
//       var row = rowItem.value[i];
//       return Schedule(
//           cleaningDay: e.cleaningDay,
//           cleaningType: int.tryParse(
//                   "${row[4]['value'] == 'Dry' ? 1 : (row[4]['value'] == 'Wel' ? 2 : null)}") ??
//               null,
//           equipments: e.equipments?.map((e) {
//             return Equipments(id: e?.id);
//           }).toList());
//     }).toList();
//     print({"sch": sch});
//     // rowItem.value.forEach((element) {
//     //   Schedule item = Schedule(
//     //     cleaningType: int.tryParse('${element[4]["id"]}'),
//     //   );

//     //   // Schedule.add(item);
//     // });

//     String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
//     String _mcTitelCtrlr = mcTitelCtrlr.text.trim();
//     String _startDateTc = startDateTc.text.trim();

//     CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
//         planId: id.value,
//         facilityId: facilityId,
//         startDate: _startDateTc,
//         frequencyId: selectedfrequencyId,
//         noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
//         title: _mcTitelCtrlr,
//         schedules: sch ?? []);

//     var updateMcModelJsonString = [createMcModel.toJson()];
//     Map<String, dynamic>? responseCreateMcModel =
//         await moduleCleaningPlanningPresenter.updateMcPlan(
//       updateMcPlans: updateMcModelJsonString,
//       isLoading: true,
//     );
//     if (responseCreateMcModel == null) {}
//     print('update MC   data: $updateMcModelJsonString');
//   }

//   Future<void> getMcPlanDetail({required int planId}) async {
//     // newPermitDetails!.value = <NewPermitListModel>[];
//     // mcPlanDetailsList?.value = <McPalningDetailsModel>[];

//     final _mcPlanDetails = await moduleCleaningPlanningPresenter
//         .getMcPlanDetail(planId: planId, isLoading: true);
//     print('MC plan Detail:$_mcPlanDetails');

//     if (_mcPlanDetails != null) {
//       mcPlanDetailsModel.value = _mcPlanDetails;
//       mcTitelCtrlr.text = mcPlanDetailsModel.value?.title ?? "";
//       selectedfrequency.value = mcPlanDetailsModel.value?.frequency ?? '';
//       startDateTc.text = mcPlanDetailsModel.value?.startDate ?? '';
//       durationInDayCtrlr.text =
//           mcPlanDetailsModel.value?.noOfCleaningDays.toString() ?? "";

//       rowItem.value = [];
//       schedules.value = _mcPlanDetails.schedules;
//       _mcPlanDetails.schedules.forEach(
//         (element) {
//           rowItem.value.add(
//             [
//               {"key": "day", "value": '${element.cleaningDay}'},
//               {"key": "noOfInverters", "value": '${element.invs}'},
//               {'key': "noOfSMBs", "value": '${element.smbs}'},
//               {'key': "noOfModules", "value": '${element.scheduledModules}'},
//               {'key': "cleaningType", "value": 'Please Select'},
//             ],
//           );
//         },
//       );
//     }
//   }

//   Future<void> getAssignedToList() async {
//     assignedToList.clear();
//     final _assignedToList =
//         await moduleCleaningPlanningPresenter.getAssignedToList(
//       facilityId: facilityId,
//     );

//     if (_assignedToList != null) {
//       for (var assignedTo in _assignedToList) {
//         assignedToList.add(assignedTo);
//       }
//       // selectedAssignedTo.value =
//       //     getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
//     }
//   }

//   Future<void> getFrequencyList() async {
//     final list =
//         await moduleCleaningPlanningPresenter.getFrequencyList(isLoading: true);

//     if (list != null) {
//       for (var _frequencyList in list) {
//         frequencyList.add(_frequencyList);
//       }
//     }
//   }

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
}
