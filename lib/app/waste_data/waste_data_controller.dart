import 'dart:async';

import 'package:cmms/app/Statutory/statutory_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/waste_data/waste_data_presenter.dart';

import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  bool openFromDateToStartDatePicker = false;
  var waterDateTc = TextEditingController();
  RxList<MonthModel> month = <MonthModel>[
    MonthModel(name: 'Water used for domestic and other purpose', id: "1"),
    MonthModel(name: 'Water used for drinking', id: "2"),
    MonthModel(name: 'Water used for Module cleaning ', id: "3"),
    MonthModel(name: 'Ground Water  ', id: "4"),
    MonthModel(name: 'Surface Water ', id: "5"),
    MonthModel(
        name: 'Water Procured from Third Party for Module cleaning ', id: "6"),
    MonthModel(
        name: 'Water Consumption  from Third Party for Module cleaning ',
        id: "7"),
    MonthModel(
        name:
            'Water Procured from Third Party for Domestic and others purposes ',
        id: "8"),
    MonthModel(name: 'Water Procured from Third Party for Drinking', id: "9"),
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
