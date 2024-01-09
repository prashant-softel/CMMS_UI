import 'dart:async';

import 'package:cmms/app/add_water_data_per_day/add_water_data_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWaterDataController extends GetxController {
  AddWaterDataController(
    this.addwaterDataPresenter,
  );
  AddWaterDataPresenter addwaterDataPresenter;
  final HomeController homecontroller = Get.find();

  bool openPurchaseDatePicker = false;
  var purchaseDateTc = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> type = 0.obs;

  RxList<MonthModel> month = <MonthModel>[
    MonthModel(name: "Please Select", id: "0"),
    MonthModel(name: 'Jan', id: "1"),
    MonthModel(name: 'Feb', id: "2"),
    MonthModel(name: 'March', id: "3"),
    MonthModel(name: 'April', id: "4"),
    MonthModel(name: 'May', id: "5"),
    MonthModel(name: 'June', id: "6"),
    MonthModel(name: 'July', id: "7"),
    MonthModel(name: 'Aug', id: "8"),
    MonthModel(name: 'Sept', id: "9"),
    MonthModel(name: 'Oct', id: "10"),
    MonthModel(name: 'Nov', id: "11"),
    MonthModel(name: 'Dec', id: "12"),
  ].obs;
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
      String? _type = await addwaterDataPresenter.getValue();
      if (_type == null || _type == '' || _type == "null") {
        var dataFromPreviousScreen = Get.arguments;

        type.value = dataFromPreviousScreen['type'];
        addwaterDataPresenter.saveValue(type: type.value.toString());
      } else {
        type.value = int.tryParse(_type) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'type');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }
}
