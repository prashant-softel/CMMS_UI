import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/waste_data/waste_data_presenter.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/create_waste_data_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_of_waste_model.dart';
import 'package:cmms/domain/models/waste_data_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WasteDataController extends GetxController {
  WasteDataController(
    this.wasteDataPresenter,
  );
  WasteDataPresenter wasteDataPresenter;

  final HomeController homecontroller = Get.find();
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  RxList<WasteDataList> wasteDataList = <WasteDataList>[].obs;
  RxList<WasteDataList> filteredData = <WasteDataList>[].obs;
  RxList<MasterList> masterDataList = <MasterList>[].obs;
  RxList<dynamic> headerList = [].obs;
  RxList<String> masterDataListName = <String>[].obs;
  RxList<String> wasteDataListTableColumns = <String>[].obs;
  WasteDataList? wasteDataListModel;
  RxList<dynamic> mainHeaderList = [].obs;
  RxInt hazardous = 0.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  int selectedBusinessTypeId = 1;
  int detailId = 0;
  Rx<String> selectedBusinessType = ''.obs;
  Rx<bool> isSelectedBusinessType = true.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  int facilityId = 0;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  Rx<String> selectedBlock = ''.obs;
  Rx<DateTime> selectedWasteDataTime = DateTime.now().obs;
  var wasteDataTimeCtrlr = TextEditingController();
  var qtyCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  RxList<WasteSource?> typeOfWasteList = <WasteSource>[].obs;
  RxList<WasteSource?> hazWasteList = <WasteSource>[].obs;
  RxList<WasteSource?> nonHazWasteList = <WasteSource>[].obs;
  Rx<bool> istypeOfWasteListSelected = true.obs;
  Rx<String> selectedtypeOfWaste = ''.obs;
  int selectedTypeOfWasteId = 0;

  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  bool openFromDateToStartDatePicker = false;
  var waterDateTc = TextEditingController();

  Rx<bool> isLoading = true.obs;
  int selectedYear = 2024;

  ///
  // @override
  // void onInit() async {
  //   await setId();
  //   facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
  //     facilityId = event;
  //     Future.delayed(Duration(seconds: 2), () async {
  //       await getWasteDataList(
  //         hazardous.value,
  //         facilityId,
  //         formattedTodate1,
  //         formattedFromdate1,
  //         false,
  //       );
  //     });
  //     Future.delayed(Duration(seconds: 1), () async {
  //       getTypeOfWasteList();
  //     });
  //   });
  //   super.onInit();
  // }

  void onReady() async {
    await setId();
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        await getWasteDataList(
          hazardous.value,
          facilityId,
          formattedTodate1,
          formattedFromdate1,
          false,
        );
      });
      Future.delayed(Duration(seconds: 1), () async {
        getTypeOfWasteList();
      });
    });
    super.onReady();
  }

  void clearStoreData() {
    wasteDataPresenter.clearHazardousValue();
  }

  Future<void> setId() async {
    try {
      String? _hazardous = await wasteDataPresenter.getHazardousValue();
      if (_hazardous == null || _hazardous == '' || _hazardous == "null") {
        var dataFromPreviousScreen = Get.arguments;
        hazardous.value = dataFromPreviousScreen['hazardous'];
        wasteDataPresenter.saveHazardousValue(
            hazardous: hazardous.value.toString());
      } else {
        hazardous.value = int.tryParse(_hazardous) ?? 0;
      }
    } catch (e) {
      print(e.toString() + ' month or year');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }

  Future<void> getWasteDataList(
    int isHazardous,
    int facilityId,
    dynamic startDate,
    dynamic endDate,
    bool isExport,
  ) async {
    wasteDataList.value = <WasteDataList>[];
    filteredData.value = <WasteDataList>[];
    masterDataList.value = <MasterList>[];

    final _wasteDataList = await wasteDataPresenter.getWasteDataList(
      isLoading: isLoading.value,
      start_date: selectedYear.toString(),
      end_date: (selectedYear + 1).toString(),
      facility_id: facilityId,
      isExport: isExport,
      isHazardous: isHazardous,
    );
    wasteDataList.value = _wasteDataList;

    for (var masterdata in _wasteDataList) {
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
          "label": _dataList.waste_type,
          "isShow": true,
          'subHeader': "Month",
          "dataKey": 'Month',
          "colSpan": _dataList.show_opening == 1 ? 4 : 2
        },
      );
      if (_dataList.show_opening == 1) {
        headerList.add(
          {
            "label": _dataList.waste_type,
            "isShow": true,
            'subHeader': "Opening",
            "dataKey": 'opening'
          },
        );
      }
      headerList.add(
        {
          "label": _dataList.waste_type,
          "isShow": _dataList.show_opening == 1 ? false : true,
          'subHeader': "+",
          "dataKey": '+'
        },
      );
      headerList.add(
        {
          "label": _dataList.waste_type,
          "isShow": false,
          'subHeader': "-",
          "dataKey": '-'
        },
      );

      if (_dataList.show_opening == 1) {
        headerList.add(
          {
            "label": _dataList.waste_type,
            "isShow": false,
            'subHeader': "Closing",
            "dataKey": 'closingQty'
          },
        );
      }

      masterDataListName.add(_dataList.waste_type ?? '');
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
      rowCount: wasteDataList.length,
      rowsPerPage: 10,
    );
    if (wasteDataList.isNotEmpty) {
      filteredData.value = wasteDataList.value;
      wasteDataListModel = wasteDataList[0];
      var newPermitListJson = wasteDataListModel?.toJson();
      wasteDataListTableColumns.value = <String>[];
      // for (var key in newPermit.vListJson?.keys.toList() ?? []) {
      //   wasteDataListTableColumns.add(key);
      // }
    }
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

  void getTypeOfWasteList() async {
    typeOfWasteList.value = <WasteSource>[];
    final _typeOfWaterList = await wasteDataPresenter.getTypeOfWasteList(
      isLoading: true,
      facilityId: facilityId,
    );
    print('type Of Water List:$typeOfWasteList');
    for (var waste_data_list in _typeOfWaterList) {
      typeOfWasteList.add(waste_data_list);
    }
    hazWasteList.value =
        typeOfWasteList.where((element) => element?.isHazardous == 1).toList();
    nonHazWasteList.value =
        typeOfWasteList.where((element) => element?.isHazardous == 0).toList();
    update(['unit_currency_list']);
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

  void clearData() {
    detailId = 0;
    wasteDataTimeCtrlr.clear();
    qtyCtrlr.clear();
    descriptionCtrlr.clear();
    selectedTypeOfWasteId = 0;
    selectedtypeOfWaste.value = '';
  }

  void createWasteData() async {
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedWasteDataTime.value;
    String formattedDate = DateFormat("yyyy-MM-dd").format(procurementTime);

    CreateWasteData createWasteData = CreateWasteData(
      consumeType: 1,
      facilityId: facilityId,
      creditQty: 0,
      date: formattedDate,
      debitQty: double.tryParse(_qtCtrlr) ?? 0,
      description: _descriptionCtrlr,
      wasteTypeId: selectedTypeOfWasteId,
    );
    var createWaterDataModelJsonString = createWasteData.toJson();
    Map<String, dynamic>? responseCreateWaterDataModel =
        await wasteDataPresenter.createWasteData(
      createWasteData: createWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $createWaterDataModelJsonString');
  }

  void updateWasteData() async {
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedWasteDataTime.value;
    String formattedDate = DateFormat("yyyy-MM-dd").format(procurementTime);

    CreateWasteData createWasteData = CreateWasteData(
      id: detailId,
      consumeType: 1,
      facilityId: facilityId,
      creditQty: 0,
      date: formattedDate,
      debitQty: double.tryParse(_qtCtrlr) ?? 0,
      description: _descriptionCtrlr,
      wasteTypeId: selectedTypeOfWasteId,
    );
    var createWaterDataModelJsonString = createWasteData.toJson();
    Map<String, dynamic>? responseCreateWaterDataModel =
        await wasteDataPresenter.updateWasteData(
      createWasteData: createWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $createWaterDataModelJsonString');
  }

  void createWasteDataDisposed() async {
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedWasteDataTime.value;
    String formattedDate = DateFormat("yyyy-MM-dd").format(procurementTime);

    CreateWasteData createWasteData = CreateWasteData(
      id: detailId,
      consumeType: 1,
      facilityId: facilityId,
      creditQty: double.tryParse(_qtCtrlr) ?? 0,
      date: formattedDate,
      debitQty: 0,
      description: _descriptionCtrlr,
      wasteTypeId: selectedTypeOfWasteId,
    );
    var createWaterDataModelJsonString = createWasteData.toJson();
    Map<String, dynamic>? responseCreateWaterDataModel =
        await wasteDataPresenter.createWasteDataDisposed(
      createWasteData: createWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $createWaterDataModelJsonString');
  }

  void updateWasteDataDisposed() async {
    String _descriptionCtrlr = descriptionCtrlr.text.trim();
    String _qtCtrlr = qtyCtrlr.text.trim();
    DateTime procurementTime = selectedWasteDataTime.value;
    String formattedDate = DateFormat("yyyy-MM-dd").format(procurementTime);

    CreateWasteData createWasteData = CreateWasteData(
      id: detailId,
      consumeType: 1,
      facilityId: facilityId,
      creditQty: double.tryParse(_qtCtrlr) ?? 0,
      date: formattedDate,
      debitQty: 0,
      description: _descriptionCtrlr,
      wasteTypeId: selectedTypeOfWasteId,
    );
    var createWaterDataModelJsonString = createWasteData.toJson();
    Map<String, dynamic>? responseCreateWaterDataModel =
        await wasteDataPresenter.updateWasteDataDisposed(
      createWasteData: createWaterDataModelJsonString,
      isLoading: true,
    );

    // Handle the response
    if (responseCreateWaterDataModel == null) {}

    print('Create Water data: $createWaterDataModelJsonString');
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<WasteSource>:
        {
          if (value != "Please Select") {
            int typeOfWaterIndex =
                typeOfWasteList.indexWhere((x) => x?.name == value);
            selectedTypeOfWasteId = typeOfWasteList[typeOfWaterIndex]?.id ?? 0;
          } else {
            selectedTypeOfWasteId = 0;
          }
        }
        break;
    }
  }

  void goWasteDataList() {
    getWasteDataList(hazardous.value, facilityId, formattedFromdate,
        formattedFromdate1, false);
  }
}
