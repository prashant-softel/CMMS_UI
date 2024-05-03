import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/utils/module_type_constants.dart';
import 'package:cmms/app/view_request_orders/request_goods_orders_view_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseGoodsorderViewController extends GetxController {
  RxList<GetRODetailsByIDModel?>? getPurchaseDetailsByIDModelList =
      <GetRODetailsByIDModel?>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Rx<GetRODetailsByIDModel?> getPurchaseDetailsByIDModel =
      GetRODetailsByIDModel().obs;
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  var commentCtrlr = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///
  PurchaseGoodsorderViewController(
    this.purchaseGoodsorderViewPresenter,
  );
  PurchaseGoodsorderViewPresenter purchaseGoodsorderViewPresenter;
  Rx<int> roId = 0.obs;
  final HomeController homeController = Get.find();
  int facilityId = 0;

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
      });

      Future.delayed(
        Duration(seconds: 1),
        () {
          getAssetList(facilityId);

          if (roId.value != 0) {
            Future.delayed(Duration(seconds: 1), () {
              getRoDetailsByID(requestID: roId.value);
              getRoHistory(id: roId.value);
            });
          }
        },
      );
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _roId = await purchaseGoodsorderViewPresenter.getValue();

      if (_roId == null || _roId == '' || _roId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        roId.value = dataFromPreviousScreen['roId'];

        purchaseGoodsorderViewPresenter.saveValue(roId: roId.value.toString());
      } else {
        roId.value = int.tryParse(_roId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'userId');
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

  void approveGoodsOrder({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderAproveModel =
          CommentModel(id: id, comment: _comment);

      var goodsOrderApproveJsonString = commentGoodsOrderAproveModel.toJson();

      Map<String, dynamic>? response =
          await purchaseGoodsorderViewPresenter.approveGoodsOrder(
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  // approveGoodsOrder() async {
  //   {
  //     String _comment = commentCtrlr.text.trim();

  //     CommentModel commentModel = CommentModel(id: id.value, comment: _comment);

  //     var approvetoJsonString = commentModel.toJson();
  //     final response = await purchaseGoodsorderViewPresenter.approveGoodsOrder(
  //       approvetoJsonString: approvetoJsonString,
  //       isLoading: true,
  //     );
  //     if (response == true) {
  //       Get.offAllNamed(Routes.purchaseGoodsorder);
  //     }
  //   }
  // }

  // rejectGoodsOrder() async {
  //   {
  //     String _comment = commentCtrlr.text.trim();

  //     CommentModel commentModel = CommentModel(id: id.value, comment: _comment);

  //     var rejecttoJsonString = commentModel.toJson();
  //     final response = await purchaseGoodsorderViewPresenter.rejectGoodsOrder(
  //       rejecttoJsonString: rejecttoJsonString,
  //       isLoading: true,
  //     );
  //     if (response == true) {
  //       Get.offAllNamed(Routes.purchaseGoodsorder);
  //     }
  //   }
  // }
  void rejectGoodsOrder({int? id}) async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderRejectModel =
          CommentModel(id: id, comment: _comment);

      var goodsOrderRejectJsonString = commentGoodsOrderRejectModel.toJson();

      Map<String, dynamic>? response =
          await purchaseGoodsorderViewPresenter.rejectGoodsOrder(
        goodsOrderRejectJsonString: goodsOrderRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> getRoHistory({required int id}) async {
    /// TODO: CHANGE THESE VALUES

    int moduleType = UserModuleTypeConstants.kReqOrderModuleTypeId;

    //
    historyList?.value = await purchaseGoodsorderViewPresenter.getRoHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
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
        .getRoDetailsByID(requestID: requestID, facilityId: facilityId);
    // print('Edit goods order  Detail:$_getPurchaseDetailsById');

    if (_getPurchaseDetailsById != null) {
      getPurchaseDetailsByIDModelList?.value = _getPurchaseDetailsById;
      getPurchaseDetailsByIDModel.value = getPurchaseDetailsByIDModelList?.firstWhere((element) => element?.request_order_id != null);

      print(
          'Additioanl Email Employees${getPurchaseDetailsByIDModel.value?.request_order_items?.length ?? 0}');
      rowItem.value = [];
      getPurchaseDetailsByIDModel.value?.request_order_items?.forEach((element) {
        rowItem.value.add([
          {"key": "Drop_down", "value": '${element.name}'},
          // {'key': "Paid_By", "value": '${element.assetItem_Name}'},
          {'key': "Cost", "value": '${element.cost}'},
          {'key': "Order", "value": '${element.ordered_qty}'},
          {'key': "Comment", "value": '${element.comment}'},
        ]);
        commentCtrlr.text = getPurchaseDetailsByIDModel.value?.comment ?? "";
        dropdownMapperData[element.name ?? ""] =
            assetList.firstWhere((e) => e?.name == element.name, orElse: null)!;
      });
    }
  }
}
