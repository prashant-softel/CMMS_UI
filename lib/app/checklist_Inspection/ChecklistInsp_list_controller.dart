import 'dart:async';
import 'package:cmms/app/checklist_Inspection/ChecklistInsp_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/check_list_inspection_model.dart';
import 'package:cmms/domain/models/create_water_data_model.dart';
import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:cmms/domain/models/water_data_list_model.dart';
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

  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isQtyInvalid = false.obs;
  Rx<DateTime> selectedProcurementTime = DateTime.now().obs;
  var procurementTimeCtrlr = TextEditingController();
  RxList<WaterSource?> typeOfWaterList = <WaterSource>[].obs;
  RxInt detailId = 0.obs;
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
  RxBool isDateInvalid = false.obs;
  RxList<MasterList> masterDataList = <MasterList>[].obs;
  RxList<WaterDataList> waterDataList = <WaterDataList>[].obs;
  RxList<String> masterDataListName = <String>[].obs;
  ChecklistInspectionModel? checklist_inspection;
  // List<InspectionData> inspectionData = [];
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
      Future.delayed(Duration(seconds: 1), () async {
        getChecklistInspection();
      });
    });

    super.onInit();
  }

  Future<void> getChecklistInspection({
    bool? isLoading,
  }) async {
    final _checklistInspection =
        await checklistInspectionListPresenter.getChecklistInspection(
      isLoading: isLoading,
    );

    checklist_inspection = _checklistInspection;
    // inspectionData = checklist_inspection?.inspectionData ?? [];
    isLoading = false;
  }

  Future<void> getWaterDataList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport) async {
    waterDataList.value = <WaterDataList>[];
    filteredData.value = <WaterDataList>[];
    masterDataList.value = <MasterList>[];

    final _waterDataList =
        await checklistInspectionListPresenter.getWaterDataList(
            isLoading: isLoading.value,
            start_date: selectedYear.toString(),
            end_date: (selectedYear + 1).toString(),
            facility_id: facilityId,
            isExport: isExport);
    waterDataList.value = _waterDataList;
    for (var masterdata in _waterDataList) {
      masterDataList.value = masterdata.master_list;
    }
    masterDataListName.value = [];
    headerList = [].obs;
    mainHeaderList = [].obs;
    mainHeaderList.addAll([
      {
        "label": 'Checklist Inspection Details',
        "isShow": true,
        'subHeader': "Checklist Name",
        "dataKey": 'ChecklistName',
        "colSpan": 3
      },
      {
        "label": 'SOP Number',
        "isShow": false,
        'subHeader': "SOP Number",
        "dataKey": 'SOPNumber',
        "colSpan": 0
      },
      {
        "label": 'Frequency',
        "isShow": false,
        'subHeader': "Frequency",
        "dataKey": 'Frequency',
        "colSpan": 0
      }
    ]);
    headerList.addAll([
      {
        "label": 'Checklist Name',
        "isShow": true,
        'subHeader': "Checklist Name",
        "dataKey": 'ChecklistName'
      },
      {
        "label": 'SOP Number',
        "isShow": true,
        'subHeader': "SOP Number",
        "dataKey": 'SOPNumber'
      },
      {
        "label": 'Frequency',
        "isShow": true,
        'subHeader': "Frequency",
        "dataKey": 'Frequency'
      },
    ]);
    // masterDataListName.add('Month');
    print({"checklist_inspection.value": checklist_inspection});
    var index = 0;
    for (var _dataList in checklist_inspection!.checklist!) {
      // {"label": 'Headersdhfgd1', "isShow": true, 'key': "open"},
      _dataList.monthlyInspection?.forEach((element) {
        if (index == 0) {
          mainHeaderList.add(
            {
              "label": element.inspectionMonth,
              "isShow": true,
              'subHeader': "inspectionMonth",
              "dataKey": 'inspectionMonth',
              "colSpan": 4
            },
          );
          headerList.add(
            {
              "label": element.inspectionMonth,
              "isShow": true,
              'subHeader': "Inspection Status",
              "dataKey": 'inspectionStatus'
            },
          );

          headerList.add(
            {
              "label": element.inspectionMonth,
              "isShow": true,
              'subHeader': "Date of Inspection",
              "dataKey": "dateOfInspection"
            },
          );
          headerList.add(
            {
              "label": element.inspectionMonth,
              "isShow": true,
              'subHeader': "Checklist Attachment ",
              "dataKey": "ChecklistAttachment"
            },
          );
          headerList.add(
            {
              "label": element.inspectionMonth,
              "isShow": true,
              'subHeader': "No of Unsafe Observation  ",
              "dataKey": "NoOfUnsafeObservations"
            },
          );
        }
      });

      index++;
      print({"_dataList": _dataList});

      // headerList.add(
      //   {
      //     "label": "Inspection Status ",
      //     "isShow": true,
      //     'subHeader': "Inspection Status ",
      //     "dataKey": 'Inspection Status '
      //   },
      // );

      // headerList.add(
      //   {
      //     "label": "Date of Inspection",
      //     "isShow": true,
      //     'subHeader': "Date of Inspection",
      //     "dataKey": "Date of Inspection"
      //   },
      // );
      // headerList.add(
      //   {
      //     "label": "Checklist Attachment",
      //     "isShow": true,
      //     'subHeader': "Checklist Attachment ",
      //     "dataKey": "Checklist Attachment "
      //   },
      // );
      // headerList.add(
      //   {
      //     "label": "No of Unsafe Observation ",
      //     "isShow": true,
      //     'subHeader': "No of Unsafe Observation  ",
      //     "dataKey": "No of Unsafe Observation  "
      //   },
      // );

      // if (_dataList.show_opening == 1) {
      //   headerList.add(
      //     {
      //       "label": _dataList.water_type,
      //       "isShow": false,
      //       'subHeader': "Closing",
      //       "dataKey": 'closingQty'
      //     },
      //   );
      // }

      // masterDataListName.add(_dataList.water_type ?? '');
    }
    headerList.add(
      {
        "label": 'Action',
        "isShow": true,
        'subHeader': "Action",
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
    detailId.value = 0;
    procurementTimeCtrlr.clear();
    qtyCtrlr.clear();
    descriptionCtrlr.clear();
    selectedTypeOfWaterId = 0;
    selectedtypeOfWater.value = '';
  }

  void getTypeOfWaterList() async {
    typeOfWaterList.value = <WaterSource>[];
    final _typeOfWaterList =
        await checklistInspectionListPresenter.getTypeOfWaterList(
      isLoading: true,
      facilityId: facilityId,
    );
    print('type Of Water List:$typeOfWaterList');
    for (var unit_currency_list in _typeOfWaterList) {
      typeOfWaterList.add(unit_currency_list);
    }

    update(['unit_currency_list']);
  }

  // void createWaterData() async {
  //   String _descriptionCtrlr = descriptionCtrlr.text.trim();
  //   String _qtCtrlr = qtyCtrlr.text.trim();
  //   DateTime procurementTime = selectedProcurementTime.value;
  //   String formattedDate =
  //       DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(procurementTime);

  //   CreateWaterData createWaterData = CreateWaterData(
  //     id: detailId.value,
  //     consumeType: 1,
  //     facilityId: facilityId,
  //     creditQty: double.tryParse(_qtCtrlr) ?? 0,
  //     date: formattedDate,
  //     debitQty: 0,
  //     description: _descriptionCtrlr,
  //     waterTypeId: selectedTypeOfWaterId,
  //   );
  //   var createWaterDataModelJsonString = createWaterData.toJson();
  //   Map<String, dynamic>? responseCreateWaterDataModel =
  //       await checklistInspectionListPresenter.createWaterData(
  //     createWaterData: createWaterDataModelJsonString,
  //     isLoading: true,
  //   );

  //   // Handle the response
  //   if (responseCreateWaterDataModel == null) {}

  //   print('Create Water data: $createWaterDataModelJsonString');
  // }

  void updateWaterData() async {
    int _id = detailId.value;
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
        await checklistInspectionListPresenter.updateWaterData(
      updateWaterData: updateWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $updateWaterDataModelJsonString');
  }

  void checkForm() {
    if (selectedTypeOfWaterId == 0) {
      istypeOfWaterListSelected.value = false;
      isFormInvalid.value = true;
    }
    if (qtyCtrlr.text.trim().length == 0) {
      isQtyInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (procurementTimeCtrlr.text.trim().length == 0) {
      isDateInvalid.value = true;
      isFormInvalid.value = true;
    }
  }

  void createWaterData() async {
    try {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      String _descriptionCtrlr = descriptionCtrlr.text.trim();
      String _qtCtrlr = qtyCtrlr.text.trim();
      DateTime procurementTime = selectedProcurementTime.value;
      String formattedDate =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(procurementTime);

      CreateWaterData createWaterData = CreateWaterData(
        id: detailId.value,
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
          await checklistInspectionListPresenter.createWaterData(
        createWaterData: createWaterDataModelJsonString,
        isLoading: true,
      );

      // Handle the response
      if (responseCreateWaterDataModel == null) {}

      print('Create Water data: $createWaterDataModelJsonString');
    } catch (e) {
      print(e);
    }
  }

  void createWaterDataConsumption() async {
    checkForm();
    if (isFormInvalid.value) {
      return;
    }
    int _id = detailId.value;
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
        await checklistInspectionListPresenter.createWaterDataConsumption(
      createWaterData: createWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $createWaterDataModelJsonString');
  }

  void updateWaterDataConsumption() async {
    int _id = detailId.value;
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedProcurementTime.value;
    String formattedDate = procurementTimeCtrlr.text;
    // DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(procurementTime);

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
        await checklistInspectionListPresenter.updateWaterDataConsumption(
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
    isDateInvalid.value = false;
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
    switch (list.runtimeType) {
      case const (RxList<WaterSource>):
        {
          if (value != "Please Select") {
            int typeOfWaterIndex =
                typeOfWaterList.indexWhere((x) => x?.name == value);
            selectedTypeOfWaterId = typeOfWaterList[typeOfWaterIndex]?.id ?? 0;
            istypeOfWaterListSelected.value = true;
          } else {
            selectedTypeOfWaterId = 0;
          }
        }
        break;
    }
  }

  void goWaterDataList() {
    getWaterDataList(facilityId, formattedFromdate, formattedFromdate1, false);
  }
}
