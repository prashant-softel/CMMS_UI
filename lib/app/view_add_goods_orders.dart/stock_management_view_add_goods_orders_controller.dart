import 'dart:async';

import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/create_go_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/models/business_list_model.dart';
import '../home/home_controller.dart';
import 'stock_management_view_add_goods_orders_presenter.dart';

class ViewAddGoodsOrdersController extends GetxController {
  ///
  ViewAddGoodsOrdersController(
    this.viewAddGoodsOrdersPresenter,
  );
  ViewAddGoodsOrdersPresenter viewAddGoodsOrdersPresenter;
  final HomeController homecontroller = Get.find();
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<String> selectedUnitCurrency = ''.obs;
  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  int selectedUnitCurrencyId = 0;
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;

  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<String> selectedBusinessType = ''.obs;
  RxList<PaiedModel?> paid = <PaiedModel>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;

  // RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<GetAssetDataModel?> assetItemList = <GetAssetDataModel>[].obs;
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  TextEditingController closeCommentTextFieldCtrlr = TextEditingController();

  Rx<bool> isSelectedBusinessType = true.obs;
  int selectedBusinessTypeId = 1;
  int paidId = 0;
  RxBool showAdditionalColumn = false.obs;
  Rx<int> goId = 0.obs;

  Rx<int> goType = 0.obs;

  //drop down list of assets
  // RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  var paidByDropdownList = 'Select Gender'.obs;

  Rx<bool> isAssetSelected = true.obs;
  Rx<String> selectedAsset = ''.obs;

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};
  RxList<GetPurchaseDetailsByIDModel?>? getPurchaseDetailsByIDModelList =
      <GetPurchaseDetailsByIDModel?>[].obs;
  Rx<GetPurchaseDetailsByIDModel?> getPurchaseDetailsByIDModel =
      GetPurchaseDetailsByIDModel().obs;
  RxList<Items?>? goDetails = <Items?>[].obs;

//all textfield tc
  var challanNoCtrlr = TextEditingController();
  var pOCtrlr = TextEditingController();
  var frieghtToPayPaidCtrlr = TextEditingController();
  var noOfPackagesReceivedCtrlr = TextEditingController();
  var conditionOfPackagesReceivedCtrlr = TextEditingController();
  var girNoCtrlr = TextEditingController();
  var amountCtrlr = TextEditingController();
  var purchaseDateTc = TextEditingController();
  var challanDateTc = TextEditingController();
  var poDateDateTc = TextEditingController();
  var receivedDateTc = TextEditingController();
  var lrNoCtrlr = TextEditingController();
  var vehicleNoCtrlr = TextEditingController();
  var jobRefCtrlr = TextEditingController();
  var textController = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;

  /// date picker
  bool openPurchaseDatePicker = false;
  bool openChallanDatePicker = false;
  bool openPODatePicker = false;
  bool openReceivedPicker = false;
  // var paid = <PaiedModel>[
  //   PaiedModel(name: "Please Select", id: 0),
  //   PaiedModel(name: 'Operator', id: 1),
  //   PaiedModel(name: 'Owner', id: 2),
  // ];
  // var selectedCountry = PaiedModel(name: "Please Select", id: 0).obs;
  int facilityId = 0;
  final HomeController homeController = Get.find();

  ///
  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 1), () {
          getUnitCurrencyList();
        });
        Future.delayed(Duration(seconds: 1), () {
          getBusinessList(4, facilityId);
        });
        Future.delayed(Duration(seconds: 1), () {
          getAssetList(facilityId);
          if (goId != 0) {
            Future.delayed(Duration(seconds: 1), () {
              getPurchaseDetailsById(id: goId.value);
              getGoHistory(id: goId.value);
            });
          }
        });
      });
    } catch (e) {}
    super.onInit();
  }

  Future<void> setUserId() async {
    final String? _goId = Get.parameters['goId'];
    final String? _goType = Get.parameters['goType'];

    goId.value = int.tryParse(_goId ?? "") ?? 0;
    goType.value = int.tryParse(_goType ?? "") ?? 0;

    // try {
    //   final _goId = await viewAddGoodsOrdersPresenter.getValue();
    //   final _goType = await viewAddGoodsOrdersPresenter.getGoTypeValue();

    //   if (_goId == null || _goId == '' || _goId == "null") {
    //     var dataFromPreviousScreen = Get.arguments;

    //     goId.value = dataFromPreviousScreen['goId'];
    //     goType.value = dataFromPreviousScreen['goType'];

    //     viewAddGoodsOrdersPresenter.saveValue(goId: goId.value.toString());
    //     viewAddGoodsOrdersPresenter.saveTypeValue(
    //         goType: goType.value.toString());
    //   } else {
    //     goId.value = int.tryParse(_goId) ?? 0;
    //     goType.value = int.tryParse(_goType ?? "") ?? 0;
    //   }
    // } catch (e) {
    //   print(e.toString() + 'goId');
    //   //  Utility.showDialog(e.toString() + 'userId');
    // }
  }

  Future<void> getPurchaseDetailsById({required int id}) async {
    getPurchaseDetailsByIDModelList?.value = <GetPurchaseDetailsByIDModel>[];

    final _getPurchaseDetailsById =
        await viewAddGoodsOrdersPresenter.getPurchaseDetailsById(id: id);
    // print('Edit goods order  Detail:$_getPurchaseDetailsById');

    if (_getPurchaseDetailsById != null) {
      getPurchaseDetailsByIDModel.value = _getPurchaseDetailsById;

      print(
          'Additioanl Email Employees${_getPurchaseDetailsById.goDetails.length}');
      rowItem.value = [];
      _getPurchaseDetailsById.goDetails.forEach((element) {
        rowItem.value.add([
          {
            "key": "Drop_down",
            "value": '${element.assetItem_Name}',
            // "asset_code": '${element.asset_code}',
            'assetMasterItemID': '${element.assetMasterItemID}',
            'id': '${element.id}'
          },
          {'key': "Paid_By", "value": '${element.paid_by_name}'},
          {
            'key': "Requested",
            "value": '${element.requested_qty}',
            // 'id': '${element.assetMasterItemID}'
          },
          {'key': "Cost", "value": '${element.cost}'},
          {'key': "Order", "value": '${element.ordered_qty}'},
        ]);

        dropdownMapperData[element.assetItem_Name ?? ""] = assetList.firstWhere(
            (e) => e?.name == element.assetItem_Name,
            orElse: null)!;
      });

      challanDateTc.text =
          getPurchaseDetailsByIDModel.value?.challan_date ?? "";
      purchaseDateTc.text =
          getPurchaseDetailsByIDModel.value?.purchaseDate ?? "";
      poDateDateTc.text = getPurchaseDetailsByIDModel.value?.po_date ?? "";
      receivedDateTc.text = getPurchaseDetailsByIDModel.value?.receivedAt ?? "";
      challanNoCtrlr.text = getPurchaseDetailsByIDModel.value?.challan_no ?? "";
      pOCtrlr.text = getPurchaseDetailsByIDModel.value?.po_no ?? "";
      frieghtToPayPaidCtrlr.text =
          getPurchaseDetailsByIDModel.value?.freight ?? "";
      noOfPackagesReceivedCtrlr.text =
          getPurchaseDetailsByIDModel.value?.no_pkg_received ?? "";
      conditionOfPackagesReceivedCtrlr.text =
          getPurchaseDetailsByIDModel.value?.condition_pkg_received ?? "";
      girNoCtrlr.text = getPurchaseDetailsByIDModel.value?.gir_no ?? "";
      amountCtrlr.text =
          getPurchaseDetailsByIDModel.value?.amount.toString() ?? "";
      lrNoCtrlr.text = getPurchaseDetailsByIDModel.value?.lr_no ?? "";
      vehicleNoCtrlr.text = getPurchaseDetailsByIDModel.value?.vehicle_no ?? "";
      jobRefCtrlr.text = getPurchaseDetailsByIDModel.value?.job_ref ?? "";
      textController.text =
          getPurchaseDetailsByIDModel.value?.goDetails.toString() ?? "";
      selectedBusinessType.value =
          getPurchaseDetailsByIDModel.value?.vendor_name ?? "";
      selectedUnitCurrency.value =
          getPurchaseDetailsByIDModel.value?.currency ?? "";
    }
  }

  Future<void> getBusinessList(ListType, int facilityId) async {
    final list = await viewAddGoodsOrdersPresenter.getBusinessList(
      facilityId: facilityId,
      ListType: ListType,
      isLoading: true,
    );
    if (list!.length > 0) {
      for (var _ownerList in list) {
        ownerList.add(_ownerList);
      }
    }
  }

  void goodsOrderApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderAproveModel =
          CommentModel(id: id, comment: _comment, facilityId: facilityId);

      var goodsOrderApproveJsonString = commentGoodsOrderAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewAddGoodsOrdersPresenter.goodsOrderApprovedButton(
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> getGoHistory({required int id}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 32;
    // int tempModuleType = 21;
    //
    historyList?.value = await viewAddGoodsOrdersPresenter.getHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  void goodsOrderRejectButton({int? id}) async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderRejectModel =
          CommentModel(id: id, comment: _comment, facilityId: facilityId);

      var goodsOrderRejectJsonString = commentGoodsOrderRejectModel.toJson();

      Map<String, dynamic>? response =
          await viewAddGoodsOrdersPresenter.goodsOrderRejectButton(
        goodsOrderRejectJsonString: goodsOrderRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  // void goodsOrderCloseButton({int? id}) async {
  //   {
  //     String _comment = closeCommentTextFieldCtrlr.text.trim();

  //     CommentModel commentGoodsOrderCloseModel =
  //         CommentModel(id: id, comment: _comment);

  //     var goodsOrderCloseJsonString = commentGoodsOrderCloseModel.toJson();

  //     Map<String, dynamic>? response =
  //         await viewAddGoodsOrdersPresenter.goodsOrderCloseButton(
  //       goodsOrderCloseJsonString: goodsOrderCloseJsonString,
  //       isLoading: true,
  //     );
  //     if (response == true) {
  //       //getCalibrationList(facilityId, true);
  //     }
  //   }
  // }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList =
        await viewAddGoodsOrdersPresenter.getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
    addRowItem();
  }

  void updatePaidBy(String value) {
    paidByDropdownList.value = value;
  }

  void toggleAdditionalColumn() {
    showAdditionalColumn.toggle();
  }

  void getUnitCurrencyList() async {
    unitCurrencyList.value = <CurrencyListModel>[];
    final _unitCUrrencyList =
        await viewAddGoodsOrdersPresenter.getUnitCurrencyList(
      isLoading: true,
      facilityId: facilityId,
    );
    print('Unit Currency List:$unitCurrencyList');
    for (var unit_currency_list in _unitCUrrencyList) {
      unitCurrencyList.add(unit_currency_list);
    }

    update(['unit_currency_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<CurrencyListModel>):
        {
          int currencyIndex =
              unitCurrencyList.indexWhere((x) => x?.name == value);
          selectedUnitCurrencyId = unitCurrencyList[currencyIndex]?.id ?? 0;
        }
        break;
      case const (RxList<BusinessTypeModel>):
        {
          int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
        }
        break;
      case const (RxList<PaiedModel>):
        {
          int paidIndex = paid.indexWhere((x) => x!.name == value);
          paidId = paid[paidIndex]!.id ?? 0;
        }
        break;
    }
  }

  void addRowItem() {
    rowItem.value.add([
      {
        "key": "Drop_down",
        "value": 'Please Select',
        "assetMasterItemID": '',
        "id": ''
      },
      {'key': "Paid_By", "value": 'Please Select'},
      {'key': "Requested", "value": ''},
      {'key': "Cost", "value": ''},
      {'key': "Order", "value": ''},
    ]);
  }
  // void addRowItem() {
  //   rowItem.value.add([
  //     {"key": "Drop_down", "value": 'Please Select'},
  //     {'key': "Paid_By", "value": 'Please Select'},
  //     {'key': "Cost", "value": ''},
  //     {'key': "Order", "value": ''},
  //   ]);
  // }

  // void createGoodsOrder() async {
  //   String _challanNoCtrlr = challanNoCtrlr.text.trim();
  //   String _pOCtrlr = pOCtrlr.text.trim();
  //   String _frieghtToPayPaidCtrlr = frieghtToPayPaidCtrlr.text.trim();
  //   String _noOfPackagesReceivedCtrlr = noOfPackagesReceivedCtrlr.text.trim();
  //   String _conditionOfPackagesReceivedCtrlr =
  //       conditionOfPackagesReceivedCtrlr.text.trim();
  //   String _girNoCtrlr = girNoCtrlr.text.trim();
  //   String _amountCtrlr = amountCtrlr.text.trim();
  //   String _purchaseDateTc = purchaseDateTc.text.trim();
  //   String _challanDateTc = challanDateTc.text.trim();
  //   String _poDateDateTc = poDateDateTc.text.trim();
  //   String _receivedDateTc = receivedDateTc.text.trim();
  //   String _lrNoCtrlr = lrNoCtrlr.text.trim();
  //   String _vehicleNoCtrlr = vehicleNoCtrlr.text.trim();
  //   String _jobRefCtrlr = jobRefCtrlr.text.trim();
  //   List<Items> items = [];
  //   rowItem.value.forEach((element) {
  //     Items item = Items(
  //         goItemID: 0,
  //         received_qty: 0,
  //         lost_qty: 0,
  //         accepted_qty: 0,
  //         damaged_qty: 0,
  //         requested_qty: int.tryParse(element[2]["value"] ?? '0'),
  //         assetMasterItemID: dropdownMapperData[element[0]["value"]]?.id,
  //         cost: double.tryParse(element[3]["value"] ?? '0'),
  //         ordered_qty: int.tryParse(element[4]["value"] ?? '0'),
  //         paid_by_ID: paiddropdownMapperData[element[1]["value"]]?.id);
  //     items.add(item);
  //   });
  //   CreateGoModel createGoModel = CreateGoModel(
  //       id: 0,
  //       facility_id: facilityId,
  //       order_type: 1,
  //       location_ID: 1,
  //       vendorID: selectedBusinessTypeId,
  //       purchaseDate: _purchaseDateTc,
  //       challan_no: _challanNoCtrlr,
  //       challan_date: _challanDateTc,
  //       po_no: _pOCtrlr,
  //       po_date: _poDateDateTc,
  //       freight: _frieghtToPayPaidCtrlr,
  //       receivedAt: _receivedDateTc,
  //       no_pkg_received: _noOfPackagesReceivedCtrlr,
  //       lr_no: _lrNoCtrlr,
  //       condition_pkg_received: _conditionOfPackagesReceivedCtrlr,
  //       vehicle_no: _vehicleNoCtrlr,
  //       gir_no: _girNoCtrlr,
  //       job_ref: _jobRefCtrlr,
  //       amount: int.tryParse(_amountCtrlr) ?? 0,
  //       currencyID: selectedUnitCurrencyId,
  //       items: items);

  //   var createGoModelJsonString = createGoModel.toJson();
  //   Map<String, dynamic>? responseCreateGoModel =
  //       await viewAddGoodsOrdersPresenter.createGoodsOrder(
  //     createGo: createGoModelJsonString,
  //     isLoading: true,
  //   );

  //   if (responseCreateGoModel == null) {
  //     //  CreateNewPermitDialog();
  //     // showAlertDialog();
  //   }
  //   print('Create  Create GO  data: $createGoModelJsonString');
  // }

  void updateGoodsOrder() async {
    String _challanNoCtrlr = challanNoCtrlr.text.trim();
    String _pOCtrlr = pOCtrlr.text.trim();
    String _frieghtToPayPaidCtrlr = frieghtToPayPaidCtrlr.text.trim();
    String _noOfPackagesReceivedCtrlr = noOfPackagesReceivedCtrlr.text.trim();
    String _conditionOfPackagesReceivedCtrlr =
        conditionOfPackagesReceivedCtrlr.text.trim();
    String _girNoCtrlr = girNoCtrlr.text.trim();
    String _amountCtrlr = amountCtrlr.text.trim();
    String _purchaseDateTc = purchaseDateTc.text.trim();
    String _challanDateTc = challanDateTc.text.trim();
    String _poDateDateTc = poDateDateTc.text.trim();
    String _receivedDateTc = receivedDateTc.text.trim();
    String _lrNoCtrlr = lrNoCtrlr.text.trim();
    String _vehicleNoCtrlr = vehicleNoCtrlr.text.trim();
    String _jobRefCtrlr = jobRefCtrlr.text.trim();
    List<Items> items = [];
    rowItem.value.forEach((element) {
      Items item = Items(
        received_qty: 0,
        lost_qty: 0,
        accepted_qty: 0,
        damaged_qty: 0,
        requested_qty: double.tryParse(element[2]["value"] ?? '0'),
        goItemID: int.tryParse('${element[0]["id"]}'),
        assetMasterItemID: int.tryParse('${element[0]["assetMasterItemID"]}'),
        cost: double.tryParse(element[3]["value"] ?? '0'),
        ordered_qty: double.tryParse(element[4]["value"] ?? '0'),
        paid_by_ID: int.tryParse('${element[1]["id"]}'),
      );
      items.add(item);
      // Items item = Items(
      //     assetMasterItemID: dropdownMapperData[element[0]["value"]]?.id,
      //     cost: int.tryParse(element[2]["value"] ?? '0'),
      //     ordered_qty: int.tryParse(element[3]["value"] ?? '0'),
      //     poID: paiddropdownMapperData[element[1]["value"]]?.id);
      // items.add(item);
    });
    CreateGoModel createGoModel = CreateGoModel(
        id: goId.value,
        facility_id: facilityId,
        order_type: 1,
        location_ID: 1,
        vendorID: selectedBusinessTypeId,
        purchaseDate: _purchaseDateTc,
        challan_no: _challanNoCtrlr,
        challan_date: _challanDateTc,
        po_no: _pOCtrlr,
        po_date: _poDateDateTc,
        freight: _frieghtToPayPaidCtrlr,
        receivedAt: _receivedDateTc,
        no_pkg_received: _noOfPackagesReceivedCtrlr,
        lr_no: _lrNoCtrlr,
        condition_pkg_received: _conditionOfPackagesReceivedCtrlr,
        vehicle_no: _vehicleNoCtrlr,
        gir_no: _girNoCtrlr,
        job_ref: _jobRefCtrlr,
        amount: int.tryParse(_amountCtrlr) ?? 0,
        currencyID: selectedUnitCurrencyId,
        items: items);

    var createGoModelJsonString = createGoModel.toJson();
    Map<String, dynamic>? responseCreateGoModel =
        await viewAddGoodsOrdersPresenter.updateGoodsOrder(
      createGo: createGoModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    print('update  Create GO  data: $createGoModelJsonString');
  }
}
