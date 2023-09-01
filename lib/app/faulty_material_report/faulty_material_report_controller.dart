import 'dart:async';

import 'package:cmms/app/faulty_material_report/faulty_material_report_presenter.dart';
import 'package:cmms/app/plant_stock_report/plant_stock_report_presenter.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/get_faulty_material_report_model.dart';
import '../home/home_controller.dart';

class FaultyMaterialReportController extends GetxController {
  ///
  FaultyMaterialReportController(
    this.faultyMaterialReportPresenter,
  );
  FaultyMaterialReportPresenter faultyMaterialReportPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<FaultyMaterialReportModel?>? faultyMaterialReportList =
      <FaultyMaterialReportModel?>[].obs;
  FaultyMaterialReportModel? faultyMaterialReportModel;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  StockDetails? plantStockListModel;
  PlantStockListModel? selectedItem;
  RxList<String> faultyMaterialReportTableColumns = <String>[].obs;
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
        getFaultyMaterialReportList(
            facilityId, formattedTodate1, formattedFromdate1, true);
      });
    });
    super.onInit();
  }

  Future<void> getFaultyMaterialReportList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    faultyMaterialReportList?.value = <FaultyMaterialReportModel>[];
    final _preventiveCheckList =
        await faultyMaterialReportPresenter.getFaultyMaterialReportList(
            facilityId: facilityId,
            isLoading: isLoading,
            startDate: startDate,
            endDate: endDate);

    if (_preventiveCheckList != null) {
      faultyMaterialReportList!.value = _preventiveCheckList;
      paginationController = PaginationController(
        rowCount: faultyMaterialReportList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (faultyMaterialReportList != null &&
          faultyMaterialReportList!.isNotEmpty) {
        faultyMaterialReportModel = faultyMaterialReportList![0];
        var preventiveCheckListJson = faultyMaterialReportModel?.toJson();
        faultyMaterialReportTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          faultyMaterialReportTableColumns.add(key);
        }
      }
    }
  }

  void getPlantStockListByDate() {
    getFaultyMaterialReportList(
        facilityId, formattedTodate1, formattedFromdate1, true);
  }
}
