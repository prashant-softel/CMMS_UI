import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/view_request_orders/request_goods_orders_view_presenter.dart';
import 'package:cmms/app/return_mrs/return_mrs_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class PurchaseGoodsorderViewController extends GetxController {
  RxList<GetRODetailsByIDModel?>? getPurchaseDetailsByIDModelList =
      <GetRODetailsByIDModel?>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Rx<GetRODetailsByIDModel?> getPurchaseDetailsByIDModel =
      GetRODetailsByIDModel().obs;
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;

  var commentCtrlr = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///
  PurchaseGoodsorderViewController(
    this.purchaseGoodsorderViewPresenter,
  );
  PurchaseGoodsorderViewPresenter purchaseGoodsorderViewPresenter;
  Rx<int> id = 0.obs;
  final HomeController homeController = Get.find();
  int facilityId = 0;

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
      });

      Future.delayed(Duration(seconds: 1), () {
        getAssetList(facilityId);

        if (id.value != 0) {
          Future.delayed(Duration(seconds: 1), () {
            getRoDetailsByID(requestID: id.value);
            // getGoHistory(id: id.value);
          });
        }
      });
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      var dataFromPreviousScreen = Get.arguments;

      id.value = dataFromPreviousScreen['id'];
      // id= Get.arguments;
      print('AddStock:$id');
      // final _flutterSecureStorage = const FlutterSecureStorage();
      // // Read jobId
      // String? _userId = await _flutterSecureStorage.read(key: "userId");
      // if (_userId == null || _userId == '' || _userId == "null") {
      //   var dataFromPreviousScreen = Get.arguments;

      //   userId.value = dataFromPreviousScreen['userId'];
      //   await _flutterSecureStorage.write(
      //     key: "userId",
      //     value: userId.value == null ? '' : userId.value.toString(),
      //   );
      // } else {
      //   userId.value = int.tryParse(_userId) ?? 0;
      // }
      //  await _flutterSecureStorage.delete(key: "userId");
    } catch (e) {
      print(e.toString() + 'userId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList = await purchaseGoodsorderViewPresenter.getAssetList(
        facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
  }

  approveGoodsOrder() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id.value, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await purchaseGoodsorderViewPresenter.approveGoodsOrder(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.purchaseGoodsorder);
      }
    }
  }

  rejectGoodsOrder() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id.value, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await purchaseGoodsorderViewPresenter.rejectGoodsOrder(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.purchaseGoodsorder);
      }
    }
  }

  void addRowItem() {
    rowItem.value.add([
      {"key": "Drop_down", "value": 'Please Select'},
      // {'key': "Paid_By", "value": 'Please Select'},
      {'key': "Cost", "value": ''},
      {'key': "Order", "value": ''},
      {'key': "Comment", "value": ''},
    ]);
  }

  Future<void> getRoDetailsByID({required int requestID}) async {
    getPurchaseDetailsByIDModelList?.value = <GetRODetailsByIDModel>[];

    final _getPurchaseDetailsById = await purchaseGoodsorderViewPresenter
        .getRoDetailsByID(requestID: requestID);
    // print('Edit goods order  Detail:$_getPurchaseDetailsById');

    if (_getPurchaseDetailsById != null) {
      getPurchaseDetailsByIDModel.value = _getPurchaseDetailsById;
      if (_getPurchaseDetailsById != null) {
        getPurchaseDetailsByIDModel.value = _getPurchaseDetailsById;

        print(
            'Additioanl Email Employees${_getPurchaseDetailsById.request_order_items?.length ?? 0}');
        rowItem.value = [];
        _getPurchaseDetailsById.request_order_items?.forEach((element) {
          rowItem.value.add([
            {"key": "Drop_down", "value": '${element.asset_name}'},
            // {'key': "Paid_By", "value": '${element.assetItem_Name}'},
            {'key': "Cost", "value": '${element.cost}'},
            {'key': "Order", "value": '${element.ordered_qty}'},
            {'key': "Comment", "value": '${element.comment}'},
          ]);
          commentCtrlr.text = getPurchaseDetailsByIDModel.value?.comment ?? "";
        });
      }
    }
  }
}
