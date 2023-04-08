import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import 'calibration_list_presenter.dart';

class CalibrationListController extends GetxController {
  ///
  CalibrationListController(
    this.calibrationListPresenter,
  );
  CalibrationListPresenter calibrationListPresenter;
  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  TextEditingController previousDateController =
      TextEditingController(text: "");
  TextEditingController nextDueDateController = TextEditingController(text: "");

  ///
  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> calibrationHistory() async {
    Get.toNamed(
      Routes.CalibrationHistory,
    );
  }
}
