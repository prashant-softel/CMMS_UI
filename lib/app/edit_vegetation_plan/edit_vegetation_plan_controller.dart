import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/edit_vegetation_plan/edit_vegetation_plan_presenter.dart';
import 'package:cmms/domain/models/create_veg_plan_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditVegetationPlanController extends GetxController {
  EditVegetationPlanController(this.editVegetationPresenter);

  EditVegetationPresenter editVegetationPresenter;
  final HomeController homeController = Get.find();

  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
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
  Rx<int> vegPlanId = 0.obs;

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
      await setVegPlanId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
      });
      if (vegPlanId.value != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getVegPlanDetail(planId: vegPlanId.value, facilityId: facilityId);
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

  // Future<void> setUserId() async {
  //   try {
  //     var dataFromPreviousScreen = Get.arguments;
  //     id.value = dataFromPreviousScreen['id'];
  //     print('AddVegetationPlan:$id');
  //   } catch (e) {
  //     print(e.toString() + 'userId');
  //   }
  // }

  Future<void> setVegPlanId() async {
    try {
      final _vegPlanId = await editVegetationPresenter.getValue();
      if (_vegPlanId == null || _vegPlanId == '' || _vegPlanId == "null") {
        var dataFromPreviousScreen = Get.arguments;
        vegPlanId.value = dataFromPreviousScreen['vegPlanId'];
        editVegetationPresenter.saveValue(
            vegPlanId: vegPlanId.value.toString());
      } else {
        vegPlanId.value = int.tryParse(_vegPlanId) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getVegEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <VegetationEquipmentModel>[];
    final list = await editVegetationPresenter.getVegEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);
    equipmentList.value = list;
    update(['veg_equipment_list']);
  }

  Future<void> updateVegPlan() async {
    List<Schedule>? sch =
        vegPlanDetailsModel.value?.schedules?.map<Schedule>((e) {
      // i++;
      return Schedule(
          cleaningDay: e.cleaningDay,
          equipments: e.equipments?.map((e) {
            return Equipments(id: e?.id);
          }).toList());
    }).toList();
    print({"sch": sch});

    String _startDate = startDateTc.text.trim();
    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _vegTitleController = vegTitleController.text.trim();

    CreateVegPlanModel createVegPlan = CreateVegPlanModel(
        planId: vegPlanId.value,
        facilityId: facilityId,
        title: _vegTitleController,
        startDate: _startDate,
        noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
        frequencyId: selectedfrequencyId,
        schedules: sch ?? []);
    var updateVegPlanJsonString = createVegPlan.toJson();
    Map<String, dynamic>? responseUpdateVegPlan =
        await editVegetationPresenter.updateVegPlan(
      updateVegPlans: updateVegPlanJsonString,
      isLoading: true,
    );
    if (responseUpdateVegPlan == null) {
      print("update veg plan: $updateVegPlanJsonString");
    }
  }

  Future<void> getVegPlanDetail({required int planId, bool? isLoading,required int facilityId}) async {
    final _vegPlanDetails = await editVegetationPresenter.getVegPlanDetail(facilityId:facilityId,
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

  Future<void> getFrequencyList() async {
    final list =
        await editVegetationPresenter.getFrequencyList(isLoading: true);

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
}
