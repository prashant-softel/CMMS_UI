import 'dart:async';
import 'package:cmms/app/checklist_Inspection/ChecklistInsp_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/check_list_inspection_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ChecklistInspectionListController extends GetxController {
  ChecklistInspectionListController(
    this.checklistInspectionListPresenter,
  );
  ChecklistInspectionListPresenter checklistInspectionListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetChecklistInspection> checklist_inspection =
      <GetChecklistInspection>[].obs;
  Rx<DateTime> selectedProcurementTime = DateTime.now().obs;
  var procurementTimeCtrlr = TextEditingController();

  RxInt detailId = 0.obs;
  Rx<bool> istypeOfWaterListSelected = true.obs;
  Rx<String> selectedtypeOfWater = ''.obs;
  int selectedTypeOfWaterId = 0;

  RxList<String> masterDataListName = <String>[].obs;

  int selectedYear = 2024;
  int selectedMonth = 4;
  String month = 'April';

  var descriptionCtrlr = TextEditingController();
  var qtyCtrlr = TextEditingController();

  RxString statusFilterText = ''.obs;

  bool openStartDatePicker = false;

  bool openFromDateToStartDatePicker = false;
  var waterDateTc = TextEditingController(text: DateTime.now().year.toString());

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> type = 0.obs;
  Rx<bool> isLoading = true.obs;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(
        Duration(seconds: 2),
        () async {
          await getChecklistInspection();
        },
      );
    });

    super.onInit();
  }

  Future<void> getChecklistInspection({
    bool? isLoading,
  }) async {
    checklist_inspection.value = <GetChecklistInspection>[];
    final _attendanceList =
        await checklistInspectionListPresenter.getChecklistInspection(
      isLoading: isLoading,
    );

    checklist_inspection.value = _attendanceList;
    isLoading = false;
    update(['attendance-list']);
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

    selectedProcurementTime.value = selectedDateTime;

    procurementTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(selectedDateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: procurementTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? dateTime = selectedProcurementTime.value;

    DateTime fiveDaysAgo = DateTime.now().subtract(Duration(days: 5));

    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? fiveDaysAgo,
      firstDate: fiveDaysAgo,
      lastDate: DateTime.now(),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    DateTime dateTime = selectedProcurementTime.value;

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
    switch (list.runtimeType) {}
  }
}
