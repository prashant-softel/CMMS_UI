import 'dart:async';

import 'package:cmms/app/checklist_mis_plan/checklist_mis_plan_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/water_data/water_data_presenter.dart';
import 'package:cmms/app/water_data_list/water_data_list_presenter.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WaterDataController extends GetxController {
  WaterDataController(
    this.waterDataPresenter,
  );
  WaterDataPresenter waterDataPresenter;
  final HomeController homecontroller = Get.find();

  bool openPurchaseDatePicker = false;
  var purchaseDateTc = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> type = 0.obs;

  @override
  void onInit() async {
    //await setType();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
    });
    super.onInit();
  }

  Future<void> setType() async {
    try {
      // Read jobId
      String? _type = await waterDataPresenter.getValue();
      if (_type == null || _type == '' || _type == "null") {
        var dataFromPreviousScreen = Get.arguments;

        type.value = dataFromPreviousScreen['type'];
        waterDataPresenter.saveValue(type: type.value.toString());
      } else {
        type.value = int.tryParse(_type) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'type');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }
}
