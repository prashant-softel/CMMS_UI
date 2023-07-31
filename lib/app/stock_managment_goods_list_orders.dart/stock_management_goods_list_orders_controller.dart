import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/stock_managment_goods_list_orders.dart/stock_management_goods_list_orders_presenter.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/domain/models/stock_management_update_goods_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class StockManagementGoodsOrdersController extends GetxController {
  StockManagementGoodsOrdersController(
    this.stockManagementGoodsOrdersPresenter,
  );
  StockManagementGoodsOrdersPresenter stockManagementGoodsOrdersPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GoodsOrdersListModel?>? goodsOrdersList =
      <GoodsOrdersListModel?>[].obs;
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(toDate.value);

  GoodsOrdersListModel? goodsOrdersListModel;
  RxList<String> goodsOrdersListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

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
        getGoodsOrdersList(
            facilityId, formattedTodate1, formattedFromdate1, false);
      });
    });
    super.onInit();
  }

  Future<void> getGoodsOrdersList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    goodsOrdersList!.value = <GoodsOrdersListModel>[];
    final _goodsordersList =
        await stockManagementGoodsOrdersPresenter.getGoodsOrdersList(
            isLoading: true,
            start_date: startDate,
            end_date: endDate,
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

  void showAddGoodsOrdersDetails({int? id}) {
    Get.toNamed(Routes.updateGoodsOrdersDetailsScreen, arguments: id);
    print('Argument5:$id');
  }

  void viewAddGoodsOrdersDetails({int? id}) {
    Get.toNamed(Routes.viewGoodsOrders, arguments: id);
    print('Argument5:$id');
  }

  void getPmTaskListByDate() {
    getGoodsOrdersList(facilityId, formattedFromdate1, formattedTodate1, false);
  }

  void isDeleteDialog({String? id, String? generatedBy}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the SPV ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: generatedBy,
                    style: TextStyle(
                      color: ColorValues.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  deleteGoodsOrders(id).then((value) {
                    Get.back();
                    getGoodsOrdersList(
                        facilityId, formattedTodate, formattedFromdate, false);
                  });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deleteGoodsOrders(String? id) async {
    {
      await stockManagementGoodsOrdersPresenter.deleteFacility(
        id,
        isLoading: true,
      );
    }
  }
}
