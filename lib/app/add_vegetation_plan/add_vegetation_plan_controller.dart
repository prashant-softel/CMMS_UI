import 'dart:async';

import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/create_veg_plan_model.dart';
// import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
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
  // RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  RxList<Schedules?> schedules = <Schedules>[].obs;
  Rx<DateTime> selectedStartTime = DateTime.now().obs;
  Rx<VegPlanDetailModel?> vegPlanDetailsModel = VegPlanDetailModel().obs;

  Rx<bool> isAssignedToSelected = true.obs;
  Rx<String> selectedAssignedTo = ''.obs;
  int selectedAssignedToId = 0;
  bool openStartDatePicker = false;
  var startDateTc = TextEditingController();
  TextEditingController vegTitleController = TextEditingController();
  FocusNode vegTitleFocus = FocusNode();
  ScrollController vegTitleScroll = ScrollController();

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
  RxList<Invs> invslist = <Invs>[].obs;
  RxList<TypeModel> days = <TypeModel>[].obs;
  void dayCount({required int dayCount}) {
    days = <TypeModel>[].obs;

    for (int i = 1; i <= dayCount; i++) {
      days.add(TypeModel(name: 'Day $i', id: "$i"));
    }
  }

  Map<String, TypeModel> typedropdownMapperData = {};

  // RxList<TypeModel> cleaningType = <TypeModel>[
  //   TypeModel(name: "Please Select", id: "0"),
  //   TypeModel(name: 'Dry', id: "1"),
  //   TypeModel(name: 'Wet', id: "2"),
  // ].obs;

 void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfBlocks", "value": ''},
      {'key': "noOfInverters", "value": ''},
      {'key': "area", "value": ''},
    ]);
  }

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
      });
        if (id != 0) {
          Future.delayed(Duration(seconds: 1), () {
            getVegPlanDetail(planId: id.value);
          });
        }
      Future.delayed(Duration(seconds: 1), () {
        getFrequencyList();
      });
      Future.delayed(Duration(seconds: 1), () {
        getVegEquipmentModelList(facilityId, true);
      });
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
    update(['veg_equipment_list']);
  }

  void createVegPlan() async {
    var mappedData = {};
    List<Schedule> schedule = [];
    equipmentList.value.forEach((element) {
      (element!.invs ?? []).forEach((invsItem) {
        if (invsItem.selectedDay != null) {
          mappedData[invsItem.selectedDay] = [
            ...(mappedData[invsItem.selectedDay] ?? []),
            invsItem.invId
          ];
        }
      });
    });
    mappedData.forEach((key, value) {
      List<Equipments> eqp = value.map<Equipments>((e) {
        return Equipments(id: e);
      }).toList();
      schedule
          .add(Schedule(cleaningDay: int.tryParse('${key}'), equipments: eqp));
    });

    print({"mappedData": mappedData});

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _vegTitleController = vegTitleController.text.trim();

    CreateVegPlanModel createVegModel = CreateVegPlanModel(
        facilityId: facilityId,
        frequencyId: selectedfrequencyId,
        noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
        title: _vegTitleController,
        schedules: schedule);

    var createVegModelJsonString = [createVegModel.toJson()];
    Map<String, dynamic>? responseCreateVegModel =
        await addVegetationPresenter.createVegetationPlan(
      createVegetationPlans: createVegModelJsonString,
      isLoading: true,
    );
    if (responseCreateVegModel == null) {}
    print('Create  Create GO  data: $createVegModelJsonString');
  }

  // void updateMcPlan() async {
  //   // return;
  //   int i = -1;

  //   List<Schedules>? sch =
  //       vegPlanDetailsModel.value?.schedules.map<Schedule>((e) {
  //     i++;
  //     var row = rowItem.value[i];
  //     return Schedule(
  //         cleaningDay: e.cleaningDay,
  //         cleaningType: int.tryParse(
  //                 "${row[4]['value'] == 'Dry' ? 1 : (row[4]['value'] == 'Wel' ? 2 : null)}") ??
  //             null,
  //         equipments: e.equipments?.map((e) {
  //           return Equipments(id: e?.id);
  //         }).toList());
  //   }).toList();
  //   print({"sch": sch});
  //   // rowItem.value.forEach((element) {
  //   //   Schedule item = Schedule(
  //   //     cleaningType: int.tryParse('${element[4]["id"]}'),
  //   //   );

  //   //   // Schedule.add(item);
  //   // });

  //   String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
  //   String _vegTitleController = vegTitleController.text.trim();
  //   String _startDateTc = startDateTc.text.trim();

  //   CreateVegPlanModel createVegModel = CreateVegPlanModel(
  //       planId: id.value,
  //       facilityId: facilityId,
  //       startDate: _startDateTc,
  //       frequencyId: selectedfrequencyId,
  //       noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
  //       title: _vegTitleController,
  //       schedules: sch ?? []);

  //   var updateMcModelJsonString = [createVegModel.toJson()];
  //   Map<String, dynamic>? responseCreateMcModel =
  //       await addVegetationPresenter.updateMcPlan(
  //     updateMcPlans: updateMcModelJsonString,
  //     isLoading: true,
  //   );
  //   if (responseCreateMcModel == null) {}
  //   print('update Veg   data: $updateMcModelJsonString');
  // }

  Future<void> getVegPlanDetail({required int planId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    // mcPlanDetailsList?.value = <McPalningDetailsModel>[];

    final _vegPlanDetails = await addVegetationPresenter.getVegPlanDetail(
        planId: planId, isLoading: true);
    print('Veg plan Detail:$_vegPlanDetails');

    if (_vegPlanDetails != null) {
      vegPlanDetailsModel.value = _vegPlanDetails;
      vegTitleController.text = vegPlanDetailsModel.value?.title ?? "";
      selectedfrequency.value = vegPlanDetailsModel.value?.frequency ?? '';
      startDateTc.text = vegPlanDetailsModel.value?.startDate ?? '';
      durationInDayCtrlr.text =
          vegPlanDetailsModel.value?.noOfCleaningDays.toString() ?? "";

      rowItem.value = [];
      schedules.value = _vegPlanDetails.schedules!;
      _vegPlanDetails.schedules?.forEach(
        (element) {
          rowItem.value.add(
            [
              {"key": "day", "value": '${element.cleaningDay}'},
              {'key': "noOfBlocks", "value": '${element.blocks}'},
              {"key": "noOfInverters", "value": '${element.invs}'},
              {'key': "area", "value": '${element.scheduledArea}'},
            ],
          );
        },
      );
    }
  }

  // Future<void> getAssignedToList() async {
  //   assignedToList.clear();
  //   final _assignedToList =
  //       await addVegetationPresenter.getAssignedToList(
  //     facilityId: facilityId,
  //   );

  //   if (_assignedToList != null) {
  //     for (var assignedTo in _assignedToList) {
  //       assignedToList.add(assignedTo);
  //     }
  //     // selectedAssignedTo.value =
  //     //     getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
  //   }
  // }

  Future<void> getFrequencyList() async {
    final list = await addVegetationPresenter.getFrequencyList(isLoading: true);

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
