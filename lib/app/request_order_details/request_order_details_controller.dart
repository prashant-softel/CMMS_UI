import 'dart:async';

import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/request_order_details/request_order_details_presenter.dart';
import 'package:cmms/app/utils/module_type_constants.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:cmms/domain/models/request_order_model.dart';

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

import '../home/home_controller.dart';

class GoodsOrdersReqDetailController extends GetxController {
  ///
  GoodsOrdersReqDetailController(
    this.goodsOrdersReqDetailPresenter,
  );
  GoodsOrdersReqDetailPresenter goodsOrdersReqDetailPresenter;
  final HomeController homecontroller = Get.find();
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;
  RxList<GetRODetailsByIDModel?> getPurchaseDetailsByIDModelList =
      <GetRODetailsByIDModel?>[].obs;
  Rx<GetRODetailsByIDModel?> getPurchaseDetailsByIDModel =
      GetRODetailsByIDModel().obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  // int get facilityId => _facilityId.value;
  int selectedPurchaseID = 0;
  var commentCtrlr = TextEditingController();

  StreamSubscription<int>? facilityIdStreamSubscription;
  final HomeController homeController = Get.find();
  int facilityId = 0;
  Rx<int> roId = 0.obs;

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
      });

      Future.delayed(Duration(seconds: 1), () {
        getAssetList(facilityId);

        if (roId.value != 0) {
          Future.delayed(Duration(seconds: 1), () async {
            await getRoDetailsByID(
                requestID: roId.value, facilityId: facilityId);
            await getRoHistory(id: roId.value, facilityId: facilityId);
          });
        }
      });
    } catch (e) {}

    super.onInit();
  }

  // void onInit() async {
  //   facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
  //     facilityId = event;
  //   });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getAssetList(facilityId);
  //   });
  //   if (id != 0) {
  //     Future.delayed(Duration(seconds: 1), () {
  //       getRoDetailsByID(requestID: id.value);
  //     });
  //   }
  //   super.onInit();
  // }

  Future<void> setUserId() async {
    try {
      final _roId = await goodsOrdersReqDetailPresenter.getValue();

      if (_roId == null || _roId == '' || _roId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        roId.value = dataFromPreviousScreen['roId'];

        goodsOrdersReqDetailPresenter.saveValue(roId: roId.value.toString());
      } else {
        roId.value = int.tryParse(_roId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'roId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getRoHistory({required int id, required int facilityId}) async {
    /// TODO: CHANGE THESE VALUES

    int moduleType = UserModuleTypeConstants.kReqOrderModuleTypeId;

    //
    historyList?.value = await goodsOrdersReqDetailPresenter.getRoHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          id,
          facilityId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList = await goodsOrdersReqDetailPresenter.getAssetList(
        facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
    addRowItem();
  }

  void addRowItem() {
    rowItem.add([
      {
        "key": "Drop_down",
        "value": 'Please Select',
        "assetMasterItemID": '',
        "id": ''
      },
      {'key': "Cost", "value": ''},
      {'key': "Order", "value": ''},
      {'key': "Comment", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  Future<void> getRoDetailsByID(
      {required int requestID, required int facilityId}) async {
    getPurchaseDetailsByIDModelList.value = <GetRODetailsByIDModel>[];

    final _getPurchaseDetailsById = await goodsOrdersReqDetailPresenter
        .getRoDetailsByID(requestID: requestID, facilityId: facilityId);
    // print('Edit gosods order  Detail:$_getPurchaseDetailsById');

    if (_getPurchaseDetailsById != null) {
      getPurchaseDetailsByIDModelList.value = _getPurchaseDetailsById;
      getPurchaseDetailsByIDModel.value = getPurchaseDetailsByIDModelList
          .firstWhere((element) => element?.request_order_id != null);

      print(
          'Additioanl Email Employees${getPurchaseDetailsByIDModel.value?.request_order_items?.length ?? 0}');
      rowItem = <List<Map<String, String>>>[].obs;
      getPurchaseDetailsByIDModel.value?.request_order_items
          ?.forEach((element) {
        rowItem.add([
          {
            "key": "Drop_down",
            "value": '${element.name}',
            'assetMasterItemID': '${element.assetMasterItemID}',
            'itemID': '${element.itemID}'
          },
          // {'key': "Paid_By", "value": '${element.assetItem_Name}'},
          {'key': "Cost", "value": '${element.cost}'},
          {'key': "Order", "value": '${element.ordered_qty}'},
          {'key': "Comment", "value": '${element.comment}'},
          {'key': "Action", "value": ''},
        ]);

        commentCtrlr.text = getPurchaseDetailsByIDModel.value?.comment ?? "";
        dropdownMapperData[element.name ?? ""] =
            assetList.firstWhere((e) => e?.name == element.name, orElse: null)!;
      });
    }
  }

  void submitPurchaseOrderData() async {
    List<SubmitItems> items = [];
    rowItem.forEach((element) {
      SubmitItems item = SubmitItems(
          itemID: 0,
          assetMasterItemID: dropdownMapperData[element[0]["value"]]?.id,
          cost: int.tryParse(element[1]["value"] ?? '0'),
          ordered_qty: int.tryParse(element[2]["value"] ?? '0'),
          comment: element[3]["value"] ?? '0');

      items.add(item);

      print('Create req  order  data: $item');
    });

    CreateRequestOrderDataModel createRequestOrderDataModel =
        CreateRequestOrderDataModel(
            facilityID: facilityId,
            items: items,
            comment: commentCtrlr.text,
            request_order_id: 0);

    var createGoReqModelJsonString = createRequestOrderDataModel.toJson();
    Map<String, dynamic>? responseCreateGoModel =
        await goodsOrdersReqDetailPresenter.submitPurchaseOrderData(
      createGoReq: createGoReqModelJsonString,
      isLoading: true,
    );
    if (responseCreateGoModel != null) {
      // Get.offAllNamed(Routes.purchaseGoodsorder);
    }

    print('Create GO  req  data: $createGoReqModelJsonString');
  }

  void updatePurchaseOrderData() async {
    List<SubmitItems> items = [];
    rowItem.forEach((element) {
      SubmitItems item = SubmitItems(
          itemID: int.tryParse('${element[0]["itemID"]}'),
          assetMasterItemID: int.tryParse('${element[0]["assetMasterItemID"]}'),
          cost: int.tryParse(element[1]["value"] ?? '0'),
          ordered_qty: int.tryParse(element[2]["value"] ?? '0'),
          comment: element[3]["value"] ?? '0');

      items.add(item);

      print('update req  order  data: $item');
    });

    CreateRequestOrderDataModel createRequestOrderDataModel =
        CreateRequestOrderDataModel(
            facilityID: facilityId,
            items: items,
            comment: commentCtrlr.text,
            request_order_id: roId.value);

    var createGoReqModelJsonString = createRequestOrderDataModel.toJson();
    Map<String, dynamic>? responseCreateGoModel =
        await goodsOrdersReqDetailPresenter.updatePurchaseOrderData(
      createGoReq: createGoReqModelJsonString,
      isLoading: true,
    );
    if (responseCreateGoModel != null) {
      Get.offAllNamed(Routes.purchaseGoodsorder);
    }

    print('update GO  req  data: $createGoReqModelJsonString');
  }
}
