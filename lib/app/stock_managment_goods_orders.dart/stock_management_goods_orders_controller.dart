import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/stock_managment_goods_orders.dart/stock_management_goods_orders_presenter.dart';
import 'package:cmms/domain/models/stock_management_update_goods_orders_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class StockManagementGoodsOrdersController extends GetxController {
  StockManagementGoodsOrdersController(
    this.stockManagementGoodsOrdersPresenter,
  );
  StockManagementGoodsOrdersPresenter stockManagementGoodsOrdersPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GoodsOrdersListModel?>? goodsOrdersList =
      <GoodsOrdersListModel?>[].obs;
  GoodsOrdersListModel? goodsOrdersListModel;
  RxList<String> goodsOrdersListTableColumns = <String>[].obs;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getGoodsOrdersList(facilityId, true);
      });
    });
    super.onInit();
  }

  Future<void> getGoodsOrdersList(int facilityId, bool isLoading) async {
    goodsOrdersList!.value = <GoodsOrdersListModel>[];
    final _goodsordersList =
        await stockManagementGoodsOrdersPresenter.getGoodsOrdersList(
            isLoading: true,
            start_date: '2020-01-01',
            end_date: '2023-12-31',
            facility_id: facilityId);

    if (_goodsordersList != null) {
      goodsOrdersList!.value = _goodsordersList;
      paginationController = PaginationController(
        rowCount: goodsOrdersList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (goodsOrdersList != null && goodsOrdersList!.isNotEmpty) {
        goodsOrdersListModel = goodsOrdersList![0];
        var newPermitListJson = goodsOrdersListModel?.toJson();
        goodsOrdersListTableColumns.value = <String>[];
        for (var key in newPermitListJson?.keys.toList() ?? []) {
          goodsOrdersListTableColumns.add(key);
        }
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      
    }
  }
}
