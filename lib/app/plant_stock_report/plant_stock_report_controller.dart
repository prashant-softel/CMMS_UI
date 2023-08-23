import 'dart:async';

import 'package:cmms/app/plant_stock_report/plant_stock_report_presenter.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../home/home_controller.dart';

class PlantStockReportController extends GetxController {
  ///
  PlantStockReportController(
    this.pantStockReportPresenter,
  );
  PlantStockReportPresenter pantStockReportPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<PlantStockListModel?>? plantStockList = <PlantStockListModel?>[].obs;
  RxList<StockDetails?>? StockDetailsList = <StockDetails?>[].obs;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  StockDetails? plantStockListModel;
  PlantStockListModel? selectedItem;
  RxList<String> plantStockTableColumns = <String>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getPlantStockList(
            facilityId, formattedTodate1, formattedFromdate1, true);
      });
    });
    super.onInit();
  }

  Future<void> getPlantStockList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    plantStockList?.value = <PlantStockListModel>[];
    final _plantStockList = await pantStockReportPresenter.getPlantStockList(
        facilityId: facilityId,
        isLoading: isLoading,
        startDate: startDate,
        endDate: endDate);

    if (_plantStockList != null) {
      for (var facility in _plantStockList) {
        for (var stockDetail in facility!.stockDetails) {
          StockDetailsList!.add(stockDetail);
        }
      }
      paginationController = PaginationController(
        rowCount: StockDetailsList?.length ?? 0,
        rowsPerPage: 10,
      );
      if (StockDetailsList != null && StockDetailsList!.isNotEmpty) {
        plantStockListModel = StockDetailsList![0];
        var plantStockListJson = plantStockListModel?.toJson();
        plantStockTableColumns.value = <String>[];
        for (var key in plantStockListJson?.keys.toList() ?? []) {
          plantStockTableColumns.add(key);
        }
      }
    }
  }

  void getPlantStockListByDate() {
    getPlantStockList(facilityId, formattedTodate1, formattedFromdate1, true);
  }
}
