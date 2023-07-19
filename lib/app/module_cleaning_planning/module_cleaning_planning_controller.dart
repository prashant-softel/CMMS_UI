import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class ModuleCleaningPlanningController extends GetxController {
  ///
  ModuleCleaningPlanningController(
    this.moduleCleaningPlanningPresenter,
  );
  var startDateTc = TextEditingController();
  bool openStartDatePicker = false;
  ModuleCleaningPlanningPresenter moduleCleaningPlanningPresenter;
  final HomeController homecontroller = Get.find();

  ///
  @override
  void onInit() async {
    super.onInit();
  }
}
