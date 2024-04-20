import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/waste_data/waste_data_presenter.dart';

import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WasteDataController extends GetxController {
  WasteDataController(
    this.wasteDataPresenter,
  );
  WasteDataPresenter wasteDataPresenter;
  HomeController homeController = Get.find();
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<bool> isSelectedBusinessType = true.obs;

  int selectedBusinessTypeId = 1;
  Rx<String> selectedBusinessType = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

  Rx<String> selectedBlock = ''.obs;
  Rx<DateTime> selectedWasteDataTime = DateTime.now().obs;
  var wasteDataTimeCtrlr = TextEditingController();
  var qtyCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();

  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  bool openFromDateToStartDatePicker = false;
  var waterDateTc = TextEditingController();
  RxList<MonthModel> wasteData = <MonthModel>[
    MonthModel(
        name:
            'Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)',
        id: "1"),
    MonthModel(name: 'E- waste in kgs ', id: "2"),
    MonthModel(name: 'Battery Waste in number  ', id: "3"),
    MonthModel(name: 'Solar Module waste in number  ', id: "4"),
    MonthModel(
        name: 'Haz waste Oil (E.g. used transformer oil) in litres ', id: "5"),
    MonthModel(name: 'Haz Waste grease in kgs ', id: "6"),
    MonthModel(name: 'Haz solid waste (e.g. used oil cotton) in Kgs ', id: "7"),
    MonthModel(name: 'Haz waste oil barrel generated in No ', id: "8"),
  ].obs;

  ///
  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await wasteDataPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) {
      return;
    }

    final time = await pickTime(context);
    if (time == null) {
      return;
    }

    DateTime selectedDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    selectedWasteDataTime.value = selectedDateTime;
    wasteDataTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(selectedDateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: wasteDataTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? dateTime = selectedWasteDataTime.value;

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
    DateTime dateTime = selectedWasteDataTime.value;

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

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<BusinessTypeModel>:
        {
          int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
        }
        break;
    }
  }
}
