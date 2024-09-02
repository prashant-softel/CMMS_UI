import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/utils/module_type_constants.dart';
import 'package:cmms/app/view_request_orders/request_goods_orders_view_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;

  Rx<bool> isCommentInvalid = false.obs;
  Rx<bool> isCostInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
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
      Future.delayed(Duration(seconds: 1), () {
        getUnitCurrencyList();
      });
      Future.delayed(
        Duration(seconds: 1),
        () {
          getAssetList(facilityId);

          if (roId.value != 0) {
            Future.delayed(Duration(seconds: 1), () {
              getRoDetailsByID(requestID: roId.value);
              getRoHistory(id: roId.value, facilityId: facilityId);
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

  void getUnitCurrencyList() async {
    unitCurrencyList.value = <CurrencyListModel>[];
    final _unitCUrrencyList =
        await purchaseGoodsorderViewPresenter.getUnitCurrencyList(
      isLoading: true,
      facilityId: facilityId,
    );
    print('Unit Currency List:$unitCurrencyList');
    for (var unit_currency_list in _unitCUrrencyList) {
      unitCurrencyList.add(unit_currency_list);
    }

    update(['unit_currency_list']);
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
      checkform();
      if (isFormInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderAproveModel =
          CommentModel(id: id, comment: _comment, facilityId: facilityId);

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

  void checkform() {
    if (approveCommentTextFieldCtrlr.text == '') {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
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
          CommentModel(id: id, comment: _comment, facilityId: facilityId);

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

  Future<void> getRoHistory({required int id, required int facilityId}) async {
    /// TODO: CHANGE THESE VALUES

    int moduleType = UserModuleTypeConstants.kReqOrderModuleTypeId;

    //
    historyList?.value = await purchaseGoodsorderViewPresenter.getRoHistory(
          // tempModuleType,
          // tempJobCardId,
          facilityId,
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
      {'key': "currency_drop_down", "value": 'Please Select'},
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
      getPurchaseDetailsByIDModel.value = getPurchaseDetailsByIDModelList
          ?.firstWhere((element) => element?.request_order_id != null);

      print(
          'Additioanl Email Employees${getPurchaseDetailsByIDModel.value?.request_order_items?.length ?? 0}');
      rowItem.value = [];
      getPurchaseDetailsByIDModel.value?.request_order_items
          ?.forEach((element) {
        rowItem.value.add([
          {"key": "Drop_down", "value": '${element.name}'},
          {'key': "currency_drop_down", "value": '${element.currency}'},
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
