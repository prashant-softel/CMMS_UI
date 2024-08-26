import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
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
  ModuleCleaningPlanningController(this.moduleCleaningPlanningPresenter);
  ModuleCleaningPlanningPresenter moduleCleaningPlanningPresenter;
  final HomeController homecontroller = Get.find();
  var startDateTimeCtrlr = TextEditingController();
  var validTillTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedmcstarttime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;
  var validTillTimeCtrlrBuffer;
  var startDateTimeCtrlrBuffer;
  RxBool isDateInvalid = false.obs;
  RxBool isDurationInvalid = false.obs;

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
  RxInt selectedAssignedToId = 0.obs;

  bool openStartDatePicker = false;
  var startDateTc = TextEditingController();
  Rx<bool> isFormInvalid = false.obs;
  TextEditingController mcTitelCtrlr = TextEditingController();
  var durationInDayCtrlr = TextEditingController();

  Rx<String> selectedfrequency = ''.obs;
  Rx<String> selectedCleaningType = ''.obs;

  Rx<bool> isSelectedfrequency = true.obs;
  Rx<bool> isSelectedCleaningType = true.obs;
  RxMap<dynamic, dynamic> cleaningTyperopdownMapperData = {}.obs;

  int selectedfrequencyId = 0;
  int selectedCleaningId = 0;

  var selectedOption = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> id = 0.obs;
  Rx<int> planId = 0.obs;
  Rx<int> mcType = 0.obs;

  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;
  RxList<SMBS> smblist = <SMBS>[].obs;

  Rx<McPalningDetailsModel?> mcPlanDetailsModel = McPalningDetailsModel().obs;
  RxList<TypeModel> days = <TypeModel>[].obs;

  RxBool isDurationEditable = true.obs; // New observable to control editability

  void dayCount({required int dayCount}) {
    days = <TypeModel>[].obs;
    for (int i = 1; i <= dayCount; i++) {
      days.add(TypeModel(name: 'Day $i', id: "$i"));
    }
  }

  RxList<TypeModel> cleaningType = <TypeModel>[
    TypeModel(name: 'Wet', id: "1"),
    TypeModel(name: 'Dry', id: "2"),
    TypeModel(name: 'Robotic', id: "3"),
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
      await setMcId();
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        if (facilityId > 0) {
          Future.delayed(Duration(seconds: 1), () {
            getEquipmentModelList(facilityId, true);

            getAssignedToList();
          });
        }
      });

      if (id != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getMcPlanDetail(planId: id.value, facilityId: facilityId);
        });
      }

      Future.delayed(Duration(seconds: 1), () {
        getFrequencyList();
      });

      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> setMcId() async {
    try {
      final _mcid = await moduleCleaningPlanningPresenter.getValueMcId();
      final _planId = await moduleCleaningPlanningPresenter.getValuePlanId();

      if (_mcid == null || _mcid == '' || _mcid == "null") {
        var dataFromPreviousScreen = Get.arguments;

        id.value = dataFromPreviousScreen['mcid'];
        planId.value = dataFromPreviousScreen['planId'];
        mcType.value = dataFromPreviousScreen['mcType'];

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

    equipmentList.forEach((element) {
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
      schedules.add(Schedule(
          cleaningDay: int.tryParse('${key}'), equipments: eqp, scheduleId: 0));
    });

    print({"mappedData": mappedData});

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _mcTitelCtrlr = mcTitelCtrlr.text.trim();
    String _startDateTc = htmlEscape.convert(startDateTc.text.trim());
    print("Start Date: ${_startDateTc}");

    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
      resubmit: 0,
      planId: 0,
      facilityId: facilityId,
      startDate: _startDateTc,
      frequencyId: selectedfrequencyId,
      cleaningType: selectedCleaningId,
      noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
      title: _mcTitelCtrlr,
      schedules: schedules,
      assignedToId: selectedAssignedToId.value,
    );

    var createMcModelJsonString = [createMcModel.toJson()];
    Map<String, dynamic>? responseCreateMcModel =
        await moduleCleaningPlanningPresenter.createMcPlan(
      createMcPlans: createMcModelJsonString,
      isLoading: true,
      facilityId: facilityId,
    );
    if (responseCreateMcModel == null) {
      print("Failed to create MC Plan");
    }
    print('Create  Create GO  data: $createMcModelJsonString');
  }

  void updateMcPlan() async {
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
        if (existingScheduleIds.contains(scheduleIdCounter)) {
          scheduleId = scheduleIdCounter;
        } else {
          scheduleId = 0;
        }
        scheduleIdCounter++;
      }
      return Schedule(
          cleaningDay: entry.key,
          equipments: entry.value,
          scheduleId: scheduleId);
    }).toList();

    print({"sch": sch});

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _mcTitelCtrlr = mcTitelCtrlr.text.trim();
    String _startDateTc = startDateTc.text.trim();

    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
        resubmit: 0,
        planId: id.value,
        facilityId: facilityId,
        startDate: _startDateTc,
        frequencyId: selectedfrequencyId,
        noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
        title: _mcTitelCtrlr,
        assignedToId: selectedAssignedToId.value,
        schedules: sch,
        cleaningType: selectedCleaningId);

    var updateMcModelJsonString = [createMcModel.toJson()];
    Map<String, dynamic>? responseCreateMcModel =
        await moduleCleaningPlanningPresenter.updateMcPlan(
            updateMcPlans: updateMcModelJsonString,
            isLoading: true,
            facility_id: facilityId);
    if (responseCreateMcModel == null) {}
    print('update MC   data: $updateMcModelJsonString');
  }

  void renewMcPlan() async {
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
        if (existingScheduleIds.contains(scheduleIdCounter)) {
          scheduleId = scheduleIdCounter;
        } else {
          scheduleId = 0;
        }
        scheduleIdCounter++;
      }
      return Schedule(
          cleaningDay: entry.key,
          equipments: entry.value,
          scheduleId: scheduleId);
    }).toList();

    print({"sch": sch});

    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _mcTitelCtrlr = mcTitelCtrlr.text.trim();
    String _startDateTc = startDateTc.text.trim();

    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
        resubmit: 1,
        planId: id.value,
        facilityId: facilityId,
        startDate: _startDateTc,
        frequencyId: selectedfrequencyId,
        noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
        title: _mcTitelCtrlr,
        assignedToId: selectedAssignedToId.value,
        schedules: sch,
        cleaningType: selectedCleaningId);

    var updateMcModelJsonString = [createMcModel.toJson()];
    Map<String, dynamic>? responseCreateMcModel =
        await moduleCleaningPlanningPresenter.updateMcPlan(
            updateMcPlans: updateMcModelJsonString,
            isLoading: true,
            facility_id: facilityId);
    if (responseCreateMcModel == null) {}
    print('update MC   data: $updateMcModelJsonString');
  }

  Future<int> fetchLastScheduleId() async {
    if (mcPlanDetailsModel.value?.schedules != null &&
        mcPlanDetailsModel.value!.schedules.isNotEmpty) {
      return mcPlanDetailsModel.value!.schedules.first.scheduleId ?? 0;
    } else {
      return 0;
    }
  }

  List<int> existingScheduleIds = [];

  Future<void> getMcPlanDetail(
      {required int planId, required int facilityId}) async {
    final _mcPlanDetails =
        await moduleCleaningPlanningPresenter.getMcPlanDetail(
            planId: planId, facilityId: facilityId, isLoading: true);
    print('MC plan Detail:$_mcPlanDetails');

    if (_mcPlanDetails != null) {
      mcPlanDetailsModel.value = _mcPlanDetails;
      mcTitelCtrlr.text = mcPlanDetailsModel.value?.title ?? "";
      selectedfrequency.value = mcPlanDetailsModel.value?.frequency ?? '';
      selectedCleaningType.value =
          mcPlanDetailsModel.value?.cleaningTypeName ?? '';

      selectedAssignedToId.value = mcPlanDetailsModel.value?.assignedToId ?? 0;
      selectedCleaningId = mcPlanDetailsModel.value?.cleaningType ?? 0;

      selectedAssignedTo.value = mcPlanDetailsModel.value?.assignedTo ?? '';

      startDateTc.text = mcPlanDetailsModel.value?.startDate ?? '';
      durationInDayCtrlr.text =
          mcPlanDetailsModel.value?.noOfCleaningDays.toString() ?? "";

      rowItem.value = [];
      schedules.value = _mcPlanDetails.schedules;

      // Collect existing scheduleIds, filtering out any null values
      existingScheduleIds = _mcPlanDetails.schedules
          .map((schedule) => schedule.scheduleId)
          .whereType<int>() // Ensure only non-null integers are included
          .toList();

      _mcPlanDetails.schedules.forEach(
        (element) {
          rowItem.value.add(
            [
              {"key": "day", "value": '${element.cleaningDay}'},
              {"key": "noOfInverters", "value": '${element.invs}'},
              {'key': "noOfSMBs", "value": '${element.smbs}'},
              {'key': "noOfModules", "value": '${element.scheduledModules}'},
              {'key': "cleaningType", "value": '${element.cleaningTypeName}'},
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
            featureId: UserAccessConstants.kModuleCleaningplanFeatureId);

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
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
      case const (RxList<TypeModel>):
        {
          if (value != "Please Select") {
            int cleaningTypeIndex =
                cleaningType.indexWhere((x) => x.name == value);
            selectedCleaningId =
                int.tryParse(cleaningType[cleaningTypeIndex].id ?? '0') ?? 0;
            selectedCleaningType.value = value;
            isSelectedCleaningType.value = true;
          } else {
            selectedCleaningId = 0;
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

  void checkFromModule() {
    if (mcTitelCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedfrequencyId == 0) {
      isSelectedfrequency.value = false;
      isFormInvalid.value = true;
    }

    if (selectedCleaningId == 0) {
      isSelectedCleaningType.value = false;
      isFormInvalid.value = true;
    }
    if (selectedAssignedToId == 0) {
      isAssignedToSelected.value = false;
      isFormInvalid.value = true;
    }

    if (durationInDayCtrlr.text.trim() == '') {
      isEstimatedInvalid.value = true;
      isFormInvalid.value = true;
    }

    // if (startDateTimeCtrlrBuffer.text.trim().length == 0) {
    //   isstartdateInvalid.value = true;
    //   isFormInvalid = false.obs;
    // }
    if (validTillTimeCtrlr.text.trim().length == 0) {
      isstartdateInvalid.value = true;
      isFormInvalid = true.obs;
    }
  }

  Future pickDateTime_web(BuildContext context, int position) async {
    final ModuleCleaningPlanningController controller = Get.find();
    var dateTime = position == 0
        ? controller.selectedmcstarttime.value
        : controller.selectedValidTillTime.value;
    final date = await pickDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context, position, date);
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
    position == 0
        ? controller.selectedmcstarttime.value
        : controller.selectedValidTillTime.value = dateTime;
    position == 0 ? controller.startDateTc : controller.validTillTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: position == 0
              ? controller.startDateTc.text.length
              : controller.validTillTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    controller.validTillTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime.add(Duration(hours: 8)));
    controller.validTillTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
            .format(dateTime.add(Duration(hours: 8)));
    controller.startDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context, int position) async {
    final ModuleCleaningPlanningController controller = Get.find();
    DateTime? dateTime = position == 0
        ? controller.selectedmcstarttime.value
        : controller.selectedValidTillTime.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    print('New Date is: $newDate');
    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(
      BuildContext context, int position, DateTime? selectedDate) async {
    final ModuleCleaningPlanningController controller = Get.find();
    DateTime dateTime = position == 0
        ? controller.selectedmcstarttime.value
        : controller.selectedValidTillTime.value;
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    print('New Date new time : $newTime');
    if (newTime == null) {
      return null;
    }

    final currentTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      TimeOfDay.now().hour,
      TimeOfDay.now().minute,
    );
    final selected = DateTime(
      selectedDate?.year ?? DateTime.now().year,
      selectedDate?.month ?? DateTime.now().month,
      selectedDate?.day ?? DateTime.now().day,
      newTime.hour,
      newTime.minute,
    );

    if (currentTime.isAfter(selected)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Time"),
            content: Text("Please select a time in the future."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return null;
    }

    return newTime;
  }
}
