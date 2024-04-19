import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/water_data_list/water_data_list_presenter.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/models/create_water_data_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WaterDataListController extends GetxController {
  WaterDataListController(
    this.waterDataListPresenter,
  );
  WaterDataListPresenter waterDataListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<AuditPlanListModel> auditPlanList = <AuditPlanListModel>[].obs;
  RxList<AuditPlanListModel> filteredData = <AuditPlanListModel>[].obs;

  Rx<DateTime> selectedProcurementTime = DateTime.now().obs;
  var procurementTimeCtrlr = TextEditingController();
  // Rx<int> Plan Id = 0.obs;

  var descriptionCtrlr = TextEditingController();
  var qtyCtrlr = TextEditingController();

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
  RxString statusFilterText = ''.obs;

  //Start DateTime
  bool openStartDatePicker = false;

  // Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  // Rx<DateTime> toDate = DateTime.now().obs;
  // String get formattedFromdate =>
  //     DateFormat('dd/MM/yyyy').format(fromDate.value);
  // String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  // String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  // String get formattedFromdate1 =>
  //     DateFormat('yyyy-MM-dd').format(fromDate.value);

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Plan ID': true,
    'SOP Number': true,
    'Checklist': true,
    // 'Site Name': true,
    'Start Date': true,
    'Frequency Name': true,
  });
  final Map<String, double> columnwidth = {
    'Plan ID': 153,
    'SOP Number': 320,
    'Checklist': 220,
    // 'Site Name': 200,
    'Start Date': 250,
    'Frequency Name': 250,
  };

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  bool openFromDateToStartDatePicker = false;
  var waterDateTc = TextEditingController(text: DateTime.now().year.toString());

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> type = 0.obs;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () async {
        // getAuditPlanList(
        //     facilityId, formattedTodate1, formattedFromdate1, true);
      });
    });
    super.onInit();
  }

  void createWaterData() async {
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedProcurementTime.value;
    String formattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(procurementTime);

    CreateWaterData createWaterData = CreateWaterData(
      consumeType: 1,
      facilityId: facilityId,
      creditQty: 2,
      date: formattedDate,
      debitQty: double.tryParse(_qtCtrlr) ?? 0,
      description: _descriptionCtrlr,
      waterTypeId: 1,
    );
    var createWaterDataModelJsonString = createWaterData.toJson();
    Map<String, dynamic>? responseCreateWaterDataModel =
        await waterDataListPresenter.createWaterData(
      createWaterData: createWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $createWaterDataModelJsonString');
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
}
