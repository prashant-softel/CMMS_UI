import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/water_data_list/water_data_list_presenter.dart';
import 'package:cmms/domain/models/create_water_data_model.dart';
import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:cmms/domain/models/water_data_list_model.dart';
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

  Rx<DateTime> selectedProcurementTime = DateTime.now().obs;
  var procurementTimeCtrlr = TextEditingController();
  RxList<WaterSource?> typeOfWaterList = <WaterSource>[].obs;
  int detailId = 0;
  Rx<bool> istypeOfWaterListSelected = true.obs;
  Rx<String> selectedtypeOfWater = ''.obs;
  int selectedTypeOfWaterId = 0;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  RxList<MasterList> masterDataList = <MasterList>[].obs;
  RxList<WaterDataList> waterDataList = <WaterDataList>[].obs;
  RxList<String> masterDataListName = <String>[].obs;

  RxList<dynamic> headerList = [].obs;
  RxList<dynamic> mainHeaderList = [].obs;

  RxList<WaterDataList> filteredData = <WaterDataList>[].obs;
  WaterDataList? waterDataListModel;
  RxList<String> waterDataListTableColumns = <String>[].obs;

  int selectedYear = 2024;
  int selectedMonth = 4;
  String month = 'April';

  var descriptionCtrlr = TextEditingController();
  var qtyCtrlr = TextEditingController();

  RxString statusFilterText = ''.obs;

  bool openStartDatePicker = false;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Plan ID': true,
    'SOP Number': true,
    'Checklist': true,
    'Start Date': true,
    'Frequency Name': true,
  });
  final Map<String, double> columnwidth = {
    'Plan ID': 153,
    'SOP Number': 320,
    'Checklist': 220,
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
  Rx<bool> isLoading = true.obs;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(
        Duration(seconds: 2),
        () async {
          await getWaterDataList(
              facilityId, formattedTodate1, formattedFromdate1, false);
        },
      );
      Future.delayed(Duration(seconds: 1), () async {
        getTypeOfWaterList();
      });
    });

    super.onInit();
  }

  Future<void> getWaterDataList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport) async {
    waterDataList.value = <WaterDataList>[];
    filteredData.value = <WaterDataList>[];
    masterDataList.value = <MasterList>[];

    final _waterDataList = await waterDataListPresenter.getWaterDataList(
        isLoading: isLoading.value,
        start_date: startDate,
        end_date: endDate,
        facility_id: facilityId,
        isExport: isExport);
    waterDataList.value = _waterDataList;
    for (var masterdata in _waterDataList) {
      masterDataList.value = masterdata.master_list;
    }
    masterDataListName.value = [];
    headerList = [].obs;
    mainHeaderList = [].obs;
    mainHeaderList.add(
      {
        "label": 'Month',
        "isShow": true,
        'subHeader': "Month",
        "dataKey": 'Month',
        "colSpan": 1
      },
    );
    headerList.add(
      {
        "label": 'Month',
        "isShow": true,
        'subHeader': "Month",
        "dataKey": 'Month'
      },
    );
    masterDataListName.add('Month');
    print({"masterDataList.value": masterDataList.value});

    for (var _dataList in masterDataList.value) {
      // {"label": 'Headersdhfgd1', "isShow": true, 'key': "open"},
      print({"_dataList": _dataList});
      mainHeaderList.add(
        {
          "label": _dataList.water_type,
          "isShow": true,
          'subHeader': "Month",
          "dataKey": 'Month',
          "colSpan": _dataList.show_opening == 1 ? 4 : 2
        },
      );
      if (_dataList.show_opening == 1) {
        headerList.add(
          {
            "label": _dataList.water_type,
            "isShow": true,
            'subHeader': "open",
            "dataKey": 'opening'
          },
        );
      }
      headerList.add(
        {
          "label": _dataList.water_type,
          "isShow": _dataList.show_opening == 1 ? false : true,
          'subHeader': "procrument",
          "dataKey": 'procuredQty'
        },
      );
      headerList.add(
        {
          "label": _dataList.water_type,
          "isShow": false,
          'subHeader': "consmption",
          "dataKey": 'consumedQty'
        },
      );

      if (_dataList.show_opening == 1) {
        headerList.add(
          {
            "label": _dataList.water_type,
            "isShow": false,
            'subHeader': "close",
            "dataKey": 'closingQty'
          },
        );
      }

      masterDataListName.add(_dataList.water_type ?? '');
    }
    headerList.add(
      {
        "label": 'Action',
        "isShow": true,
        'subHeader': "",
        "dataKey": 'action'
      },
    );
    mainHeaderList.add(
      {
        "label": 'Action',
        "isShow": true,
        'subHeader': "",
        "dataKey": 'action',
        "colSpan": 1
      },
    );
    print({"headerList.length": headerList.length});
  
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: waterDataList.length,
      rowsPerPage: 10,
    );
    if (waterDataList.isNotEmpty) {
      filteredData.value = waterDataList.value;
      waterDataListModel = waterDataList[0];
      var newPermitListJson = waterDataListModel?.toJson();
      waterDataListTableColumns.value = <String>[];
      // for (var key in newPermit.vListJson?.keys.toList() ?? []) {
      //   waterDataListTableColumns.add(key);
      // }
    }
    }

  void clearData() {
    detailId = 0;
    procurementTimeCtrlr.clear();
    qtyCtrlr.clear();
    descriptionCtrlr.clear();
    selectedTypeOfWaterId = 0;
    selectedtypeOfWater.value = '';
  }

  void getTypeOfWaterList() async {
    typeOfWaterList.value = <WaterSource>[];
    final _typeOfWaterList = await waterDataListPresenter.getTypeOfWaterList(
      isLoading: true,
      facilityId: facilityId,
    );
    print('type Of Water List:$typeOfWaterList');
    for (var unit_currency_list in _typeOfWaterList) {
      typeOfWaterList.add(unit_currency_list);
    }

    update(['unit_currency_list']);
  }

  void createWaterData() async {
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedProcurementTime.value;
    String formattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(procurementTime);

    CreateWaterData createWaterData = CreateWaterData(
      id: detailId,
      consumeType: 1,
      facilityId: facilityId,
      creditQty: double.tryParse(_qtCtrlr) ?? 0,
      date: formattedDate,
      debitQty: 0,
      description: _descriptionCtrlr,
      waterTypeId: selectedTypeOfWaterId,
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

  void updateWaterData() async {
    int _id = detailId;
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedProcurementTime.value;
    String formattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(procurementTime);

    CreateWaterData updateWaterData = CreateWaterData(
      id: _id,
      consumeType: 1,
      facilityId: facilityId,
      creditQty: double.tryParse(_qtCtrlr) ?? 0,
      date: formattedDate,
      debitQty: 0,
      description: _descriptionCtrlr,
      waterTypeId: selectedTypeOfWaterId,
    );
    var updateWaterDataModelJsonString = updateWaterData.toJson();
    Map<String, dynamic>? responseCreateWaterDataModel =
        await waterDataListPresenter.updateWaterData(
      updateWaterData: updateWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $updateWaterDataModelJsonString');
  }

  void createWaterDataConsumption() async {
    int _id = detailId;
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedProcurementTime.value;
    String formattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(procurementTime);

    CreateWaterData createWaterData = CreateWaterData(
      id: _id,
      consumeType: 1,
      facilityId: facilityId,
      creditQty: 0,
      date: formattedDate,
      debitQty: double.tryParse(_qtCtrlr) ?? 0,
      description: _descriptionCtrlr,
      waterTypeId: selectedTypeOfWaterId,
    );
    var createWaterDataModelJsonString = createWaterData.toJson();
    Map<String, dynamic>? responseCreateWaterDataModel =
        await waterDataListPresenter.createWaterDataConsumption(
      createWaterData: createWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $createWaterDataModelJsonString');
  }

  void updateWaterDataConsumption() async {
    int _id = detailId;
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedProcurementTime.value;
    String formattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(procurementTime);

    CreateWaterData updateWaterData = CreateWaterData(
      id: _id,
      consumeType: 1,
      facilityId: facilityId,
      creditQty: 0,
      date: formattedDate,
      debitQty: double.tryParse(_qtCtrlr) ?? 0,
      description: _descriptionCtrlr,
      waterTypeId: selectedTypeOfWaterId,
    );
    print("update consumption payload ${updateWaterData}");
    var updateWaterDataModelJsonString = updateWaterData.toJson();
    Map<String, dynamic>? responseCreateWaterDataModel =
        await waterDataListPresenter.updateWaterDataConsumption(
      updateWaterData: updateWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $updateWaterDataModelJsonString');
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

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<WaterSource>:
        {
          if (value != "Please Select") {
            int typeOfWaterIndex =
                typeOfWaterList.indexWhere((x) => x?.name == value);
            selectedTypeOfWaterId = typeOfWaterList[typeOfWaterIndex]?.id ?? 0;
          } else {
            selectedTypeOfWaterId = 0;
          }
        }
        break;
    }
  }
}
