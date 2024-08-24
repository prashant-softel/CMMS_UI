import 'dart:async';

import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/create_veg_plan_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
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
  RxList<Schedules?> schedules = <Schedules>[].obs;
  Rx<DateTime> selectedStartTime = DateTime.now().obs;
  Rx<VegPlanDetailModel?> vegPlanDetailsModel = VegPlanDetailModel().obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  RxBool isDurationEditable = true.obs; // New observable to control editability

  RxBool isAssignedToSelected = true.obs;
  RxString selectedAssignedTo = ''.obs;
  RxInt selectedAssignedToId = 0.obs;
  bool openStartDatePicker = false;
  var startDateTc = TextEditingController();
  TextEditingController vegTitleController = TextEditingController();
  FocusNode vegTitleFocus = FocusNode();
  ScrollController vegTitleScroll = ScrollController();
  var durationInDayCtrlr = TextEditingController();
  RxBool isFormInvalid = false.obs;
  RxBool isTitleInvalid = false.obs;
  RxBool isDateInvalid = false.obs;
  RxBool isDurationInvalid = false.obs;

  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;

  var selectedOption = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> vegid = 0.obs;
  Rx<int> vegType = 0.obs;

  RxList<VegetationEquipmentModel?> equipmentList =
      <VegetationEquipmentModel?>[].obs;
  RxList<SMBS> smbsList = <SMBS>[].obs;
  RxList<TypeModel> days = <TypeModel>[].obs;
  void dayCount({required int dayCount}) {
    days = <TypeModel>[].obs;
    for (int i = 1; i <= dayCount; i++) {
      days.add(TypeModel(name: 'Day $i', id: "$i"));
    }
  }

  Map<String, TypeModel> typedropdownMapperData = {};
  void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfBlocks", "value": ''},
      {'key': "noOfInverters", "value": ''},
      {'key': "area", "value": ''},
    ]);
  }

  void checkForm() {
    if (vegTitleController.text.isEmpty) {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedfrequencyId == 0) {
      isSelectedfrequency.value = false;
      isFormInvalid.value = true;
    }
    if (selectedAssignedToId == 0) {
      isAssignedToSelected.value = false;
      isFormInvalid.value = true;
    }
    if (startDateTc.text.isEmpty) {
      isDateInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (durationInDayCtrlr.text.isEmpty) {
      isDurationInvalid.value = true;
      isFormInvalid.value = true;
    }
  }

  @override
  void onInit() async {
    try {
      await setvegid();
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        facilityId = event;
        await getVegEquipmentModelList(facilityId, true);
        await getFrequencyList();
        await getAssignedToList();
        if (vegid != 0) {
          Future.delayed(Duration(seconds: 1), () async {
            await getVegPlanDetail(planId: vegid.value, facilityId: facilityId);
          });
        }
      });
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setvegid() async {
    try {
      final _vegid = await addVegetationPresenter.getValue();
      if (_vegid == null || _vegid == '' || _vegid == "null") {
        var dataFromPreviousScreen = Get.arguments;
        vegid.value = dataFromPreviousScreen['vegid'];
        vegType.value = dataFromPreviousScreen['vegType'];

        addVegetationPresenter.saveValue(vegid: vegid.value.toString());
      } else {
        vegid.value = int.tryParse(_vegid) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  void clearStoreData() {
    addVegetationPresenter.clearValue();
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
    equipmentList.forEach((element) {
      (element!.smbs ?? []).forEach((invsItem) {
        if (invsItem.selectedDay != null) {
          mappedData[invsItem.selectedDay] = [
            ...(mappedData[invsItem.selectedDay] ?? []),
            invsItem.smbId
          ];
        }
      });
    });
    mappedData.forEach((key, value) {
      List<Equipments> eqp = value.map<Equipments>((e) {
        return Equipments(id: e);
      }).toList();
      schedule.add(Schedule(
          cleaningDay: int.tryParse('${key}'), equipments: eqp, scheduleId: 0));
    });

    print({"mappedData": mappedData});

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _vegTitleController = vegTitleController.text.trim();
    String _startDate = startDateTc.text.trim();

    CreateVegPlanModel createVegModel = CreateVegPlanModel(
      facilityId: facilityId,
      resubmit: 0,
      frequencyId: selectedfrequencyId,
      planId: 0,
      startDate: _startDate,
      assignedTo: selectedAssignedToId.value,
      noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
      title: _vegTitleController,
      schedules: schedule,
    );

    var createVegModelJsonString = [createVegModel.toJson()];
    Map<String, dynamic>? responseCreateVegModel =
        await addVegetationPresenter.createVegetationPlan(
            createVegetationPlans: createVegModelJsonString,
            isLoading: true,
            facility_Id: facilityId);
    if (responseCreateVegModel == null) {}
    print('Create  Create GO  data: $createVegModelJsonString');
  }

  void updateVegPlan() async {
    int firstScheduleId = await fetchLastScheduleId();
    int scheduleIdCounter = firstScheduleId + 1;
    Map<int, List<Equipments>> equipmentMap = {};
    equipmentList.forEach((equipment) {
      equipment?.smbs?.forEach((smb) {
        if (smb.selectedDay != null) {
          int day = int.tryParse(smb.selectedDay!) ?? 0;
          if (day > 0) {
            if (!equipmentMap.containsKey(day)) {
              equipmentMap[day] = [];
            }
            equipmentMap[day]!.add(Equipments(id: smb.smbId));
          }
        }
      });
    });

    bool isFirstSchedule = true;
    List<Schedule> sch = equipmentMap.entries.map((entry) {
      int scheduleId;
      if (isFirstSchedule) {
        scheduleId = firstScheduleId;
        isFirstSchedule = false;
      } else {
        scheduleId = scheduleIdCounter++;
      }
      return Schedule(
          cleaningDay: entry.key,
          equipments: entry.value,
          scheduleId: scheduleId);
    }).toList();

    print({"sch": sch});

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _vegTitleController = vegTitleController.text.trim();
    String _startDate = startDateTc.text.trim();

    CreateVegPlanModel createVegModel = CreateVegPlanModel(
      planId: vegid.value,
      resubmit: 0,
      facilityId: facilityId,
      startDate: _startDate,
      frequencyId: selectedfrequencyId,
      noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
      title: _vegTitleController,
      assignedTo: selectedAssignedToId.value,
      schedules: sch,
    );

    var updateVegModelJsonString = [createVegModel.toJson()];
    Map<String, dynamic>? responseCreateVegModel =
        await addVegetationPresenter.updateVegPlan(
            updateVegPlans: updateVegModelJsonString,
            isLoading: true,
            facilityId: facilityId);
    if (responseCreateVegModel == null) {}
    print('update MC   data: $updateVegModelJsonString');
  }


  void resubmitVegPlan() async {
    int firstScheduleId = await fetchLastScheduleId();
    int scheduleIdCounter = firstScheduleId + 1;
    Map<int, List<Equipments>> equipmentMap = {};
    equipmentList.forEach((equipment) {
      equipment?.smbs?.forEach((smb) {
        if (smb.selectedDay != null) {
          int day = int.tryParse(smb.selectedDay!) ?? 0;
          if (day > 0) {
            if (!equipmentMap.containsKey(day)) {
              equipmentMap[day] = [];
            }
            equipmentMap[day]!.add(Equipments(id: smb.smbId));
          }
        }
      });
    });

    bool isFirstSchedule = true;
    List<Schedule> sch = equipmentMap.entries.map((entry) {
      int scheduleId;
      if (isFirstSchedule) {
        scheduleId = firstScheduleId;
        isFirstSchedule = false;
      } else {
        scheduleId = scheduleIdCounter++;
      }
      return Schedule(
          cleaningDay: entry.key,
          equipments: entry.value,
          scheduleId: scheduleId);
    }).toList();

    print({"sch": sch});

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _vegTitleController = vegTitleController.text.trim();
    String _startDate = startDateTc.text.trim();

    CreateVegPlanModel createVegModel = CreateVegPlanModel(
      planId: vegid.value,
      resubmit: 1,
      facilityId: facilityId,
      startDate: _startDate,
      frequencyId: selectedfrequencyId,
      noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
      title: _vegTitleController,
      assignedTo: selectedAssignedToId.value,
      schedules: sch,
    );

    var updateVegModelJsonString = [createVegModel.toJson()];
    Map<String, dynamic>? responseCreateVegModel =
        await addVegetationPresenter.updateVegPlan(
            updateVegPlans: updateVegModelJsonString,
            isLoading: true,
            facilityId: facilityId);
    if (responseCreateVegModel == null) {}
    print('update MC   data: $updateVegModelJsonString');
  }

  Future<int> fetchLastScheduleId() async {
    // await getVegPlanDetail(planId: vegid.value, facilityId: facilityId);

    if (vegPlanDetailsModel.value?.schedules != null &&
        vegPlanDetailsModel.value!.schedules!.isNotEmpty) {
      return vegPlanDetailsModel.value!.schedules!.first.scheduleId ?? 0;
    } else {
      return 0;
    }
  }

  Future<void> getVegPlanDetail({
    required int planId,
    required int facilityId,
  }) async {
    final _vegPlanDetails = await addVegetationPresenter.getVegPlanDetail(
      facilityId: facilityId,
      planId: planId,
      isLoading: true,
    );
    print('Veg plan Detail:$_vegPlanDetails');

    if (_vegPlanDetails != null) {
      vegPlanDetailsModel.value = _vegPlanDetails;
      vegTitleController.text = vegPlanDetailsModel.value?.title ?? "";
      selectedfrequencyId = vegPlanDetailsModel.value?.frequencyId ?? 0;
      selectedfrequency.value = vegPlanDetailsModel.value?.frequency ?? '';
      selectedAssignedToId.value = vegPlanDetailsModel.value?.assignedToId ?? 0;
      selectedAssignedTo.value = vegPlanDetailsModel.value?.assignedTo ?? '';
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
              {'key': "noOfBlocks", "value": '${element.smbs}'},
              {"key": "noOfInverters", "value": '${element.invs}'},
              {'key': "area", "value": '${element.scheduledArea}'},
            ],
          );
        },
      );
    }
  }

  RxList<TypeModel> cleaningType = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "1"),
    TypeModel(name: 'Wet', id: "2"),
  ].obs;

  Future<void> getFrequencyList() async {
    final list = await addVegetationPresenter.getFrequencyList(isLoading: true);

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList = await addVegetationPresenter.getAssignedToEmployee(
      facilityId: facilityId,
      featureId: UserAccessConstants.kVegetationControlFeatureId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case const (RxList<FrequencyModel>):
        {
          if (value != "Please Select") {
            int frequencyIndex =
                frequencyList.indexWhere((x) => x?.name == value);
            selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
            selectedfrequency.value = value;
            isSelectedfrequency.value = true;

            if (value == "Daily") {
              durationInDayCtrlr.text = '1';
              isDurationEditable.value = false;
            } else {
              isDurationEditable.value = true;
            }
          } else {
            selectedfrequencyId = 0;
          }
        }
        break;
      case const (RxList<EmployeeModel>):
        {
          if (value != "Please Select") {
            int assignedToIndex =
                assignedToList.indexWhere((x) => x?.name == value);
            selectedAssignedToId.value =
                assignedToList[assignedToIndex]?.id ?? 0;
            isAssignedToSelected.value = true;
            selectedAssignedTo.value = value;
          } else {
            selectedAssignedToId.value = 0;
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
    isDateInvalid.value = false;
    startDateTc
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
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
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
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
