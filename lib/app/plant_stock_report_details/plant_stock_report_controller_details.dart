import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_presenter_details.dart';
import 'package:cmms/domain/models/plant_stock_month.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PlantStockReportDetailsController extends GetxController {
  PlantStockReportDetailsController(
    this.plantStockReportDetailsPresenter,
  );

  PlantStockReportDetailsPresenter plantStockReportDetailsPresenter;
  final HomeController homeController = Get.find();

  bool openPurchaseDatePicker = false;
  var purchaseDateTc = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get end_date => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get start_date => DateFormat('yyyy-MM-dd').format(fromDate.value);

  int facilityID = 0;
  int assetItemID = 0;
  Rx<int> assetID = 0.obs;
  Rx<bool>isLoading=true.obs; 

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
    });
    super.onInit();
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
        startDate.value=DateFormat("dd/MM/yyyy").format(start);
        endDate.value=DateFormat("dd/MM/yyyy").format(end);

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
        isLoading.value=false;
        plantDetails = plantDetailList
            .firstWhere((element) => element?.assetItemName != null);
        assetItemName.value = plantDetails?.assetItemName;
        plantDetails =
            plantDetailList.firstWhere((element) => element?.assetType != null);
        assetType.value = plantDetails?.assetType;
      }

    }
    
    
  }
}
