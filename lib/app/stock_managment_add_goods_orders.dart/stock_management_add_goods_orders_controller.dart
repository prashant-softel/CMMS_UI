import 'dart:async';

import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/create_go_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/history_model.dart';

import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:cmms/domain/models/request_order_list.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/business_list_model.dart';
import '../home/home_controller.dart';
import 'stock_management_add_goods_orders_presenter.dart';

class StockManagementAddGoodsOrdersController extends GetxController {
  ///
  StockManagementAddGoodsOrdersController(
    this.stockManagementAddGoodsOrdersPresenter,
  );
  StockManagementAddGoodsOrdersPresenter stockManagementAddGoodsOrdersPresenter;

  final HomeController homeController = Get.find();
  FocusNode delchfocus = FocusNode();
  ScrollController delchscroll = ScrollController();
  FocusNode ponofocus = FocusNode();
  ScrollController ponoscroll = ScrollController();
  FocusNode freightfocus = FocusNode();
  ScrollController freightscroll = ScrollController();
  FocusNode matpofocus = FocusNode();
  ScrollController matposcroll = ScrollController();
  FocusNode pacrfocus = FocusNode();
  ScrollController pacrscroll = ScrollController();
  FocusNode inregfocus = FocusNode();
  ScrollController inregscroll = ScrollController();
  FocusNode amntfocus = FocusNode();
  ScrollController amntscroll = ScrollController();
  FocusNode lrfocus = FocusNode();
  ScrollController lrscroll = ScrollController();
  FocusNode vehfocus = FocusNode();
  ScrollController vehscroll = ScrollController();
  FocusNode jobrfocus = FocusNode();
  ScrollController jobrscroll = ScrollController();
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  RxList<GetRequestOrderListModel?> goodsOrdersList =
      <GetRequestOrderListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<bool> isReqOrderSelected = true.obs;
  Rx<bool> ispaidSelected = true.obs;
  Rx<String> selectedReqOrder = ''.obs;
  Rx<String> selectedpaid = ''.obs;
  int selectedReqOrderId = 0;
  Rx<int> roId = 0.obs;
  var commentCtrlr = TextEditingController();
  Rx<String> selectedFacility = ''.obs;
  Rx<String> selectedUnitCurrency = ''.obs;

  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  int selectedUnitCurrencyId = 0;
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  StreamSubscription<int>? facilityIdStreamSubscription;
  Stream<int> get facilityId$ => _facilityId.stream;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  RxList<GetAssetItemsModel?> assetItemList = <GetAssetItemsModel>[].obs;
  Rx<String> selectedBusinessType = ''.obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  RxList<String> goodsOrdersListTableColumns = <String>[].obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  Rx<bool> isSelectedBusinessType = true.obs;

  int selectedBusinessTypeId = 1;
  int paidId = 0;
  RxBool showAdditionalColumn = false.obs;
  Rx<int> goId = 0.obs;
  int facilityId = 0;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  GetRequestOrderListModel? goodsOrdersListModel;

  //drop down list of assets
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  RxList<PaiedModel?> paid = <PaiedModel>[].obs;

  var paidByDropdownList = 'Select Gender'.obs;

  // Rx<bool> isAssetSelected = true.obs;
  // Rx<String> selectedAsset = ''.obs;

  // Rx<List<List<Map<String, String>>>> rowItem = Rx<List<List<Map<String, String>>>>([]);
  final rowItem = Rx<List<List<Map<String, String>>>>([]);
  // Map<String, GetAssetDataModel> dropdownMapperData = {};
  Map<String, GoDetails> dropdownMapperData = {};

  Map<String, PaiedModel> paiddropdownMapperData = {};
  RxList<GetPurchaseDetailsByIDModel?>? getPurchaseDetailsByIDModelList =
      <GetPurchaseDetailsByIDModel?>[].obs;
  Rx<GetPurchaseDetailsByIDModel?> getPurchaseDetailsByIDModel =
      GetPurchaseDetailsByIDModel().obs;
  Rx<GetRODetailsByIDModel?> getRoDetailsByIDModel =
      GetRODetailsByIDModel().obs;
  RxList<GetRODetailsByIDModel?>? getRoDetailsByIDModelList =
      <GetRODetailsByIDModel?>[].obs;
  RxList<GoDetails?>? goDetailsList = <GoDetails?>[].obs;
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

  /// date picker
  bool openPurchaseDatePicker = false;
  bool openChallanDatePicker = false;
  bool openPODatePicker = false;
  bool openReceivedPicker = false;
  Rx<String> asset = ''.obs;
  Rx<String> asstype = ''.obs;
  Rx<String> asscat = ''.obs;
  int assetNameId = 0;
  List<int?> idList = [];

  // var paid = <PaiedModel>[
  //   PaiedModel(name: "Please Select", id: 0),
  //   PaiedModel(name: 'Operator', id: 1),
  //   PaiedModel(name: 'Owner', id: 2),
  // ];
  // var selectedCountry = PaiedModel(name: "Please Select", id: 0).obs;

  ///
  ///    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
  //    facilityId = event;
  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 1), () {
          getFacilityList();
        });
      });
      Future.delayed(Duration(seconds: 2), () async {
        await getRequestOrderList(
          facilityId,
          formattedTodate1,
          formattedFromdate1,
          false,
        );
      });

      Future.delayed(Duration(seconds: 1), () {
        getUnitCurrencyList();
      });

      Future.delayed(Duration(seconds: 1), () {
        updatePaidBy();
      });
      Future.delayed(Duration(seconds: 1), () {
        getBusinessList(4);
      });
      Future.delayed(Duration(seconds: 1), () {
        //  getAssetList(facilityId);

        if (goId.value != 0) {
          Future.delayed(Duration(seconds: 1), () {
            getPurchaseDetailsById(id: goId.value);
            getGoHistory(id: goId.value);
          });
        }
      });
      delchfocus.addListener(() {
        if (!delchfocus.hasFocus) {
          delchscroll.jumpTo(0.0);
        }
      });
      ponofocus.addListener(() {
        if (!ponofocus.hasFocus) {
          ponoscroll.jumpTo(0.0);
        }
      });
      freightfocus.addListener(() {
        if (!freightfocus.hasFocus) {
          freightscroll.jumpTo(0.0);
        }
      });
      matpofocus.addListener(() {
        if (!matpofocus.hasFocus) {
          matposcroll.jumpTo(0.0);
        }
      });
      pacrfocus.addListener(() {
        if (!pacrfocus.hasFocus) {
          pacrscroll.jumpTo(0.0);
        }
      });
      inregfocus.addListener(() {
        if (!inregfocus.hasFocus) {
          inregscroll.jumpTo(0.0);
        }
      });
      amntfocus.addListener(() {
        if (!amntfocus.hasFocus) {
          amntscroll.jumpTo(0.0);
        }
      });
      lrfocus.addListener(() {
        if (!lrfocus.hasFocus) {
          lrscroll.jumpTo(0.0);
        }
      });
      vehfocus.addListener(() {
        if (!vehfocus.hasFocus) {
          vehscroll.jumpTo(0.0);
        }
      });
      jobrfocus.addListener(() {
        if (!jobrfocus.hasFocus) {
          jobrscroll.jumpTo(0.0);
        }
      });
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _goId = await stockManagementAddGoodsOrdersPresenter.getValue();
      if (_goId == null || _goId == '' || _goId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        goId.value = dataFromPreviousScreen['goId'];
        stockManagementAddGoodsOrdersPresenter.saveValue(
            goId: goId.value.toString());
      } else {
        goId.value = int.tryParse(_goId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'goId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getGoHistory({required int id}) async {
    /// TODO: CHANGE THESE VALUES

    int moduleType = 32;
    // int tempModuleType = 21;
    //
    historyList?.value =
        await stockManagementAddGoodsOrdersPresenter.getHistory(
              // tempModuleType,
              // tempJobCardId,
              moduleType,
              id,
              true,
            ) ??
            [];
    update(["historyList"]);
  }

  Future<void> getFacilityList() async {
    final _facilityList =
        await stockManagementAddGoodsOrdersPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getPurchaseDetailsById({required int id}) async {
    getPurchaseDetailsByIDModelList?.value = <GetPurchaseDetailsByIDModel>[];

    final _getPurchaseDetailsById = await stockManagementAddGoodsOrdersPresenter
        .getPurchaseDetailsById(id: id);
    print('Edit goods order  Detail:$_getPurchaseDetailsById');

    if (_getPurchaseDetailsById != null) {
      getPurchaseDetailsByIDModel.value = _getPurchaseDetailsById;

      print(
          'Additioanl Email Employees${_getPurchaseDetailsById.goDetails.length}');
      rowItem.value = [];
      goDetails?.value = _getPurchaseDetailsById.goDetails;

      _getPurchaseDetailsById.goDetails.forEach((element) {
        rowItem.value.add(
          [
            {
              "key": "Drop_down",
              "value": '${element.assetItem_Name}',
              'assetMasterItemID': '${element.assetMasterItemID}',
              'id': '${element.id}'
            },
            {
              'key': "Paid_By",
              "value": '${element.paid_by_name}',
              'id': '${element.paid_by_ID}'
            },
            {
              'key': "Requested",
              "value": '${element.requested_qty}',
              // 'id': '${element.assetMasterItemID}'
            },
            {
              'key': "Cost",
              "value": '${element.cost}',
              // 'id': '${element.assetMasterItemID}'
            },
            {
              'key': "Order",
              "value": '${element.ordered_qty}',
              // 'id': '${element.assetMasterItemID}'
            },
          ],
        );

        dropdownMapperData[element.assetItem_Name ?? ""] = goDetailsList!
            .firstWhere((e) => e?.name == element.assetItem_Name,
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

      print('AssetsItemId:$idList');
    }
  }

  Future<void> getBusinessList(ListType) async {
    final list = await stockManagementAddGoodsOrdersPresenter.getBusinessList(
      ListType: ListType,
      isLoading: true,
    );
    if (list!.length > 0) {
      for (var _ownerList in list) {
        ownerList.add(_ownerList);
      }
    }
  }

  // Future<void> getEquipmentAssetsList(int _facilityId) async {
  //   assetItemList.value = <GetAssetItemsModel>[];
  //   final _assetList = await stockManagementAddGoodsOrdersPresenter
  //       .getEquipmentAssetsList(facilityId: facilityId);
  //   if (_assetList != null) {
  //     for (var asset in _assetList) {
  //       assetItemList.add(asset);
  //     }
  //     //

  //     update(["AssetList"]);
  //   }

  //   addRowItem();
  // }
  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList = await stockManagementAddGoodsOrdersPresenter
        .getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
    addRowItem();
  }

  Future<void> getRoDetailsByID({required int requestID}) async {
    goDetailsList?.value = [];

    final _getRoDetailsById = await stockManagementAddGoodsOrdersPresenter
        .getRoDetailsByID(requestID: requestID);
    // print('Edit goods order  Detail:$_getRoDetailsById');

    if (_getRoDetailsById != null) {
      var _godetail = _getRoDetailsById.request_order_items;
      for (var asset in _godetail!) {
        goDetailsList!.add(asset);
      }
    }
    addRowItem();
  }

  Future<void> updatePaidBy() async {
    paid.value = <PaiedModel>[];
    final _paid = await stockManagementAddGoodsOrdersPresenter.updatePaidBy(
      isLoading: true,
      facilityId: facilityId,
    );
    print('paid by List:$_paid');
    if (_paid != null) {
      for (var paid_by in _paid) {
        paid.add(paid_by);
      }

      update(['paid']);
    }
  }

  // void updatePaidBy(String value) {
  //   paidByDropdownList.value = value;
  // }

  void toggleAdditionalColumn() {
    showAdditionalColumn.toggle();
  }

  void getUnitCurrencyList() async {
    unitCurrencyList.value = <CurrencyListModel>[];
    final _unitCUrrencyList =
        await stockManagementAddGoodsOrdersPresenter.getUnitCurrencyList(
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
      case RxList<CurrencyListModel>:
        {
          int currencyIndex =
              unitCurrencyList.indexWhere((x) => x?.name == value);
          selectedUnitCurrencyId = unitCurrencyList[currencyIndex]?.id ?? 0;
        }
        break;
      case RxList<GetRequestOrderListModel>:
        {
          int reqOrderIndex =
              goodsOrdersList.indexWhere((x) => x?.name == value);
          selectedReqOrderId =
              int.tryParse(goodsOrdersList[reqOrderIndex]?.name ?? "") ?? 0;
          getRoDetailsByID(requestID: selectedReqOrderId);
        }
        break;
      case RxList<BusinessTypeModel>:
        {
          int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
        }
        break;
      case RxList<PaiedModel>:
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
      {'key': "Paid_By", "value": 'Please Select', "id": ''},
      {'key': "Requested", "value": ''},
      {'key': "Cost", "value": ''},
      {'key': "Order", "value": ''},
    ]);
  }

  void createGoodsOrder() async {
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
          goItemID: 0,
          received_qty: 0,
          lost_qty: 0,
          accepted_qty: 0,
          damaged_qty: 0,
          requested_qty: double.tryParse(element[2]["value"] ?? '0'),
          assetMasterItemID:
              dropdownMapperData[element[0]["value"]]?.assetMasterItemID,
          cost: double.tryParse(element[3]["value"] ?? '0'),
          ordered_qty: double.tryParse(element[4]["value"] ?? '0'),
          paid_by_ID: paiddropdownMapperData[element[1]["value"]]?.id);
      items.add(item);
    });
    CreateGoModel createGoModel = CreateGoModel(
        is_submit: 1,
        id: 0,
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
        await stockManagementAddGoodsOrdersPresenter.createGoodsOrder(
      createGo: createGoModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    print('Create  Create GO  data: $createGoModelJsonString');
  }

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

      // poID: paiddropdownMapperData[element[1]["value"]]?.id)
      ;
      items.add(item);
    });
    CreateGoModel createGoModel = CreateGoModel(
        is_submit: 1,
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
        await stockManagementAddGoodsOrdersPresenter.updateGoodsOrder(
      createGo: createGoModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    print('update  Create GO  data: $createGoModelJsonString');
  }

  Future<void> getRequestOrderList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    goodsOrdersList.value = <GetRequestOrderListModel>[];
    final _goodsordersList =
        await stockManagementAddGoodsOrdersPresenter.getRequestOrderList(
      isLoading: true,
      start_date: startDate,
      end_date: endDate,
      facility_id: facilityId,
    );
    for (var requ in _goodsordersList) {
      goodsOrdersList.add(requ);
    }

    update(['requ']);
  }
}
