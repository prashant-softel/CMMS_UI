import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_presenter_details.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/plant_stock_month.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class PlantStockReportDetailsController extends GetxController {
  PlantStockReportDetailsController(
    this.plantStockReportDetailsPresenter,
  );
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // DateFormat('dd/MM/yyyy').format(fromDate.value);
  // String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  PlantStockReportDetailsPresenter plantStockReportDetailsPresenter;
  final HomeController homeController = Get.find();
  int facilityId = 0;
    RxList<StockDetails?> filteredData = <StockDetails?>[].obs;
  RxList<StockDetails?> StockDetailsList = <StockDetails?>[].obs;
  bool openPurchaseDatePicker = false;
  var purchaseDateTc = TextEditingController();
  // List<int> selectedmaterialId = <int>[].obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  RxList<GetAssetDataModel?> selectedAssetsNameList = <GetAssetDataModel>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  RxList<PlantStockListModel?> plantStockList = <PlantStockListModel?>[].obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get end_date => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get start_date => DateFormat('yyyy-MM-dd').format(fromDate.value);
  Rx<bool> ismaterialSelected = true.obs;
  Rx<String> selectedmaterial = ''.obs;
  int facilityID = 0;
  int assetItemID = 0;
  Rx<int> assetID = 0.obs;
  Rx<bool> isLoading = true.obs;
Rx<int> selectedmaterialId = 0.obs;
  Rx<int> type = 0.obs;
  Rx<int> selectedYear = 0.obs;
  Rx<int> selectedMonth = 0.obs;
  Rx<String> monthName = ''.obs;
  Rx<String> assetItemName = ''.obs;
  Rx<String> assetType = ''.obs;
  Rx<String> startdate = ''.obs;
  Rx<String> enddate = ''.obs;
  Rx<String> startDate = ''.obs;
  Rx<String> endDate = ''.obs;

  bool openFromDateToStartDatePicker = false;
  // String get formattedFromdate =>
  //     DateFormat('dd/MM/yyyy').format(fromDate.value);

  // Rx<PlantStockMonth?> plantStockReportByMonth = PlantStockMonth().obs;

  RxList<PlantStockMonth?> plantStockReportByMonthList =
      <PlantStockMonth?>[].obs;
  // Rx<PlantDetail?> plantdetails = PlantDetail().obs;
  RxList<PlantDetail?> plantDetailList = <PlantDetail?>[].obs;
  PlantDetail? plantDetails;
  RxList<double> totalColumn = <double>[].obs;

  MonthModel? monthModel = MonthModel(name: '');
  RxList<MonthModel> months = <MonthModel>[
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
    await setPlantDetails();
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityID = event;
      await getPlantStockMonthDetail(
        facilityID: facilityID,
        start_date: startdate.value,
        end_date: enddate.value,
        assetItemID: assetID.value,
      );
      //   Future.delayed(Duration(seconds: 1), () {
      //    getPlantStockList(facilityId, formattedTodate1, formattedFromdate1, false, selectedmaterialId.value);

      // });
      
        Future.delayed(Duration(seconds: 1), () {
        getAssetList(facilityId);
      });

    });
    super.onInit();
  }
  Future<void> getAssetList(int _facilityId) async {
    assetList.clear();
    assetList.value = <GetAssetDataModel>[];
    final _assetList =
        await plantStockReportDetailsPresenter.getAssetList(facilityId: facilityId);
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
  }


  Future<void> setPlantDetails() async {
    try {
      final _assetId = await plantStockReportDetailsPresenter.getValue();
      final _startdate =
          await plantStockReportDetailsPresenter.getStartdateValue();
      final _enddate = await plantStockReportDetailsPresenter.getEnddateValue();

      if (_assetId == null || _assetId.isEmpty || _assetId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        assetID.value = dataFromPreviousScreen['assetId'];
        startdate.value = dataFromPreviousScreen['startdate'];
        enddate.value = dataFromPreviousScreen['enddate'];
        DateTime start = DateTime.parse(startdate.value);
        DateTime end = DateTime.parse(enddate.value);
        startDate.value = DateFormat("dd/MM/yyyy").format(start);
        endDate.value = DateFormat("dd/MM/yyyy").format(end);

        plantStockReportDetailsPresenter.savestartValue(
            startdate: startdate.value.toString());
        plantStockReportDetailsPresenter.saveendValue(
            enddate: enddate.value.toString());

        plantStockReportDetailsPresenter.saveValue(
            assetId: assetID.value.toString());
      } else {
        assetID.value = int.tryParse(_assetId) ?? 0;
        startdate.value = _startdate ?? '';
        enddate.value = _enddate ?? '';
      }
    } catch (e) {
      print('${e.toString()} assetID');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getPlantStockListByDate() async {
    await getPlantStockMonthDetail(
      facilityID: facilityID,
      start_date: start_date,
      end_date: end_date,
      assetItemID: assetID.value,
    );
  }

  Future<void> getPlantStockMonthDetail({
    String? start_date,
    required String end_date,
    required int assetItemID,
    required int facilityID,
  }) async {
    final _plantStockMonthDetail =
        await plantStockReportDetailsPresenter.getPlantStockMonthDetail(
      start_date: start_date,
      end_date: end_date,
      assetItemID: assetItemID,
      facilityID: facilityID,
    );

    if (_plantStockMonthDetail != null) {
      plantStockReportByMonthList.value = _plantStockMonthDetail;
      // plantStockReportByMonth.value = plantStockReportByMonthList.firstWhereOrNull(
      //     (element) => element?.facilityID != 0);
      for (var plantDetail in plantStockReportByMonthList) {
        plantDetailList.value = plantDetail?.details ?? [];
        isLoading.value = false;
        plantDetails = plantDetailList
            .firstWhere((element) => element?.assetItemName != null);
        assetItemName.value = plantDetails?.assetItemName;
        plantDetails =
            plantDetailList.firstWhere((element) => element?.assetType != null);
        assetType.value = plantDetails?.assetType;
      }
    }
  }
void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case const (RxList<GetAssetDataModel>):
        {
          if (value != "Please Select") {
            int equipCatIndex = assetList.indexWhere((x) => x?.name == value);
             selectedmaterialId.value= assetList[equipCatIndex]?.id ?? 0;
             ismaterialSelected.value=true;
             selectedmaterial.value=value;
            }
           else {
            selectedmaterialId.value=0;
          }
        }
        break;
    }

  }
 
  // Future<void> getPlantStockList(int facilityId, dynamic startDate,
  //     dynamic endDate, bool? isExport,int ? selectedmaterialId,
  //     {bool isExportOnly = false}) async {
  //   if (!isExportOnly) {
  //     plantStockList!.clear();
  //     plantStockList?.value = <PlantStockListModel>[];
  //     StockDetailsList.value = <StockDetails>[];
  //   }
  //   final _plantStockList = await plantStockReportDetailsPresenter.getPlantStockList(
  //       facilityId: facilityId,
  //       isLoading: isLoading.value,
  //       isExport: isExport,
  //       startDate: startDate,
  //       endDate: endDate,
  //       selectedmaterialId: selectedmaterialId
  //       );

  //   if (_plantStockList != null && !isExportOnly) {
  //     plantStockList?.value = _plantStockList;
  //     isLoading.value = false;

  //     for (var facility in _plantStockList) {
  //       for (var stockDetail in facility!.stockDetails) {
  //         StockDetailsList.add(stockDetail);
  //       }
  //     }

  //     filteredData.value = StockDetailsList.toList();

  //     // paginationController = PaginationController(
  //     //   rowCount: StockDetailsList.length,
  //     //   rowsPerPage: 10,
  //     // );
  //   }
  // }
   
  
}
