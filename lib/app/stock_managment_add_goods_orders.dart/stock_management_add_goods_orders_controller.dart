import 'dart:async';
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
  Rx<bool> isReqOrderSelected = true.obs;
  Rx<bool> ispaidSelected = true.obs;
  Rx<String> selectedReqOrder = ''.obs;
  Rx<String> selectedpaid = ''.obs;

  Rx<bool> isRequestedInvalid = false.obs;
  Rx<bool> isCostInvalid = false.obs;
  Rx<bool> isBusinessTypeInvalid = false.obs;

  RxList<int> selectedReqOrderId = <int>[].obs;
  Rx<int> roId = 0.obs;
  var commentCtrlr = TextEditingController();
  Rx<String> selectedFacility = ''.obs;
  Rx<String> selectedUnitCurrency = 'Indian Rupee'.obs;

  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  int selectedUnitCurrencyId = 69;
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

  int selectedBusinessTypeId = 0;
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

  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;
  // final rowItem = Rx<List<List<Map<String, String>>>>([]);
  // Map<String, GetAssetDataModel> dropdownMapperData = {};
  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  RxMap<String, bool> errorState = <String, bool>{}.obs;
  RxMap<dynamic, dynamic> paiddropdownMapperData = {}.obs;
  RxList<GetPurchaseDetailsByIDModel?>? getPurchaseDetailsByIDModelList =
      <GetPurchaseDetailsByIDModel?>[].obs;
  Rx<GetPurchaseDetailsByIDModel?> getPurchaseDetailsByIDModel =
      GetPurchaseDetailsByIDModel().obs;
  Rx<GetRODetailsByIDModel?> getRoDetailsByIDModel =
      GetRODetailsByIDModel().obs;
  RxList<GetRODetailsByIDModel?>? getRoDetailsByIDModelList =
      <GetRODetailsByIDModel?>[].obs;
  RxList<GetAssetDataModel?>? goDetailsList = <GetAssetDataModel?>[].obs;
  RxList<Items?>? goDetailslist = <Items?>[].obs;

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

  // validators
  Rx<bool> isSelectedBusinessType = true.obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<bool> isPOInvalid = false.obs;
  Rx<bool> isPOdateInvalid = false.obs;
  Rx<bool> isAmountInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;

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

  bool validateFields() {
    bool isValid = true;
    errorState.clear();
    for (int i = 0; i < rowItem.length; i++) {
      var row = rowItem[i];
      for (var mapData in row) {
        if ((mapData['key'] == 'Drop_down' &&
                (mapData['value'] == null ||
                    mapData['value'] == 'Please Select')) ||
            (mapData['key'] == 'Paid_By' &&
                (mapData['value'] == null ||
                    mapData['value'] == 'Please Select')) ||
            (mapData['key'] == 'Order' &&
                (mapData['value'] == null || mapData['value'] == '')) ||
            // (mapData['key'] == 'Requested' &&
            //     (mapData['value'] == null || mapData['value'] == '')) ||
            // (mapData['key'] == 'Cost' &&
            //     (mapData['value'] == null || mapData['value'] == '')) ||
            (mapData['key'] == 'Order' &&
                (mapData['value'] == null || mapData['value'] == ''))) {
          errorState['$i-${mapData['key']}'] = true;
          isValid = false;
        }
      }
    }
    update();
    return isValid;
  }

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
        //   Future.delayed(Duration(seconds: 1), () {
        //     getFacilityList();
        //   });
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
        getBusinessList(4, facilityId);
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
      if (goId.value == 0) {
        addRowItem();
      }

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
      rowItem = <List<Map<String, String>>>[].obs;
      goDetailslist?.value = _getPurchaseDetailsById.goDetails;

      getPurchaseDetailsByIDModel.value?.goDetails.forEach((element) {
        rowItem.add(
          [
            {
              "key": "Drop_down",
              "value": '${element.assetItem_Name}',
              'assetMasterItemID': '${element.assetMasterItemID}',
              'id': '${element.id}'
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
            {
              'key': "Paid_By",
              "value": '${element.paid_by_name}',
              'id': '${element.paid_by_ID}'
            },
            {'key': "Action ", "value": ''},
          ],
        );

        dropdownMapperData[element.assetItem_Name ?? ""] = goDetailslist!
            .firstWhere((e) => e?.asset_type == element.asset_type,
                orElse: null)!;
        paiddropdownMapperData[element.paid_by_name ?? ""] = paid
            .firstWhere((e) => e?.name == element.paid_by_name, orElse: null)!;
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

  Future<void> getBusinessList(ListType, int facilityId) async {
    final list = await stockManagementAddGoodsOrdersPresenter.getBusinessList(
      ListType: ListType,
      facilityId: facilityId,
      isLoading: true,
    );
    if (list!.length > 0) {
      ownerList.value = list;
      // for (var _ownerList in list) {
      //   ownerList.add(_ownerList);
      // }
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
  }

  Future<void> getRoDetailsByID(
      {required List<int> requestID, required int facilityId}) async {
    goDetailsList?.value = [];

    final _getRoDetailsById = await stockManagementAddGoodsOrdersPresenter
        .getRoDetailsByID(requestID: requestID, facilityId: facilityId);
    // print('Edit goods order  Detail:$_getRoDetailsById');

    if (_getRoDetailsById != null) {
      getRoDetailsByIDModelList?.value = _getRoDetailsById;
      getRoDetailsByIDModel.value = getRoDetailsByIDModelList!
          .firstWhere((element) => element?.request_order_id != null);
      var _godetail = getRoDetailsByIDModel.value?.request_order_items;
      for (var asset in _godetail!) {
        goDetailsList!.add(asset);
      }
    }
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
    print("$value");
    switch (list.runtimeType) {
      case const (RxList<CurrencyListModel>):
        {
          if (value != "Please Select") {
            int currencyIndex =
                unitCurrencyList.indexWhere((x) => x?.name == value);
            selectedUnitCurrencyId = unitCurrencyList[currencyIndex]?.id ?? 0;
            isUnitCurrencySelected.value = true;
            print(
                "selectedBusinessTypeId: ${selectedUnitCurrencyId} \n ${selectedUnitCurrency}");
          } else {
            selectedUnitCurrencyId = 0;
          }
        }
        break;

      case const (RxList<GetRequestOrderListModel>):
        {
          if (value != "Please Select") {
            final filteredOrders =
                goodsOrdersList.where((order) => order?.status == 344).toList();
            if (filteredOrders.isNotEmpty) {
              int reqOrderIndex =
                  filteredOrders.indexWhere((x) => x?.requestOrderId == value);
              rowItem.value = <List<Map<String, String>>>[].obs;
              // rowItem.remove();
              selectedReqOrder.value =
                  filteredOrders[reqOrderIndex]?.requestOrderId.toString() ??
                      "";
              selectedReqOrderId.add(int.tryParse(filteredOrders[reqOrderIndex]
                          ?.requestOrderId
                          .toString() ??
                      "") ??
                  0);
              getRoDetailsByID(
                  requestID: selectedReqOrderId, facilityId: facilityId);
            }
          } else {
            selectedReqOrderId.value = [];
          }
        }
        break;
      case const (RxList<BusinessListModel>):
        {
          if (value != "Please Select") {
            int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
            selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
            selectedBusinessType.value = value;
            isSelectedBusinessType.value = true;
            print(
                "selectedBusinessTypeId: ${selectedBusinessType} \n ${selectedBusinessType}");
          } else {
            selectedBusinessTypeId = 0;
          }
        }
        break;
      case const (RxList<PaiedModel>):
        {
          if (value != "Please Select") {
            int paidIndex = paid.indexWhere((x) => x!.name == value);
            paidId = paid[paidIndex]!.id ?? 0;
          } else {
            paidId = 0;
          }
        }
        break;
    }
  }

  void addRowItem() {
    rowItem.add([
      {
        "key": "Drop_down",
        "value": 'Please Select',
        "assetMasterItemID": '',
        "id": ''
      },
      {'key': "Requested", "value": ''},
      {'key': "Cost", "value": ''},
      {'key': "Order", "value": ''},
      {'key': "Paid_By", "value": 'Please Select', "id": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  void createGoodsOrder() async {
    try {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
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

      // DateTime now = DateTime.now();
      // String currentDate =
      //     DateTime.now().toString().split(' ')[0].replaceAll('-', '-');

      // Initialize an empty list of Items
      List<Items> items = [];

      // Iterate through rowItem.value and populate the items list
      rowItem.value.forEach((element) {
        Items item = Items(
          goItemID: 0,
          received_qty: 0,
          lost_qty: 0,
          accepted_qty: 0,
          damaged_qty: 0,
          requested_qty: dropdownMapperData[element[0]["value"]]?.ordered_qty,
          assetMasterItemID: dropdownMapperData[element[0]["value"]]?.id,
          cost: dropdownMapperData[element[0]["value"]]
              ?.cost, // double.tryParse(element[3]["value"] ?? '0'),
          ordered_qty: double.tryParse(element[3]["value"] ?? '0'),
          paid_by_ID: paiddropdownMapperData[element[4]["value"]]?.id,
        );
        items.add(item);
      });

      // Create a CreateGoModel instance
      CreateGoModel createGoModel = CreateGoModel(
        is_submit: 1,
        id: 0,
        facility_id: facilityId,
        order_type: 1,
        location_ID: 1,
        vendorID: selectedBusinessTypeId,
        purchaseDate: null,
        challan_no: _challanNoCtrlr,
        challan_date: null,
        po_no: _pOCtrlr,
        po_date: _poDateDateTc,
        freight: _frieghtToPayPaidCtrlr,
        receivedAt: null,
        no_pkg_received: _noOfPackagesReceivedCtrlr,
        lr_no: _lrNoCtrlr,
        condition_pkg_received: _conditionOfPackagesReceivedCtrlr,
        vehicle_no: _vehicleNoCtrlr,
        gir_no: _girNoCtrlr,
        job_ref: _jobRefCtrlr,
        amount: int.tryParse(_amountCtrlr) ?? 0,
        currencyID: selectedUnitCurrencyId,
        items: items,
        freight_value: "",
        inspection_report: "",
      );

      // Convert the CreateGoModel instance to JSON
      var createGoModelJsonString = createGoModel.toJson();

      // Call the createGoodsOrder function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responseCreateGoModel =
          await stockManagementAddGoodsOrdersPresenter.createGoodsOrder(
        createGo: createGoModelJsonString,
        isLoading: true,
      );

      // Handle the response
      if (responseCreateGoModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create  Create GO  data: $createGoModelJsonString');
    } catch (e) {
      print(e);
    }
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
    rowItem.forEach((element) {
      Items item = Items(
        received_qty: 0,
        lost_qty: 0,
        accepted_qty: 0,
        damaged_qty: 0,
        requested_qty: dropdownMapperData[element[0]["value"]]?.ordered_qty,
        assetMasterItemID: dropdownMapperData[element[0]["value"]]?.id,
        cost: dropdownMapperData[element[0]["value"]]
            ?.cost, // double.tryParse(element[3]["value"] ?? '0'),
        ordered_qty: double.tryParse(element[3]["value"] ?? '0'),
        paid_by_ID: paiddropdownMapperData[element[4]["value"]]?.id,

        goItemID: int.tryParse('${element[0]["id"]}') ?? 0,
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
        freight_value: "",
        inspection_report: "",
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
    final filteredOrders =
        _goodsordersList.where((order) => order.status == 344).toList();
    for (var requ in filteredOrders) {
      goodsOrdersList.add(requ);
      selectedReqOrderId
          .add(int.tryParse(requ.requestOrderId.toString() ?? '') ?? 0);
    }
    if (filteredOrders.isNotEmpty) {
      // selectedReqOrderId.add(int.tryParse(filteredOrders[0].name ?? "") ?? 0);
      // selectedReqOrder.value = filteredOrders[0].name ?? "";
      await getRoDetailsByID(
          requestID: selectedReqOrderId.value, facilityId: facilityId);
    }

    update(['requ']);
  }

  void goodsOrderIds(_selectedGoIds) async {
    selectedReqOrderId.value = <int>[];
    for (var _selectedCategoryId in _selectedGoIds) {
      selectedReqOrderId.add(_selectedCategoryId);
    }
    await getRoDetailsByID(
        requestID: selectedReqOrderId.value, facilityId: facilityId);
  }

  void checkForm() {
    if (selectedUnitCurrencyId == 0) {
      isUnitCurrencySelected.value = false;
      isFormInvalid.value = true;
    }
    if (selectedBusinessTypeId == 0) {
      isSelectedBusinessType.value = false;
      isFormInvalid.value = true;
    }
    if (pOCtrlr.text.trim().length == 0) {
      isPOInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (poDateDateTc.text.trim().length == 0) {
      isPOdateInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (amountCtrlr.text.trim().length == 0) {
      isAmountInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (!validateFields()) {
      isFormInvalid.value = true;
    }
  }

  //validation
  // void checkForm() {
  //   if (selectedUnitCurrency == '') {
  //     isUnitCurrencySelected = false.obs;
  //   }
  //   if (selectedBusinessType == '') {
  //     isSelectedBusinessType = false.obs;
  //   }
  //   if (pOCtrlr.text.trim().length < 3) {
  //     isPOInvalid.value = true;
  //   }
  //   if (pOCtrlr.value == true) {
  //     isFormInvalid.value = true;
  //   }
  //   if (poDateDateTc.text.trim().length < 3) {
  //     isPOdateInvalid.value = true;
  //   }
  //   if (amountCtrlr.text.trim().length < 3) {
  //     isAmountInvalid.value = true;
  //   }

  //   if (amountCtrlr.value == true) {
  //     isFormInvalid.value = true;
  //   }

  //   if (TextEditingController().text.isEmpty) {
  //     isCostInvalid.value = true;
  //   } else {
  //     isCostInvalid.value = false;
  //   }

  //   if (TextEditingController().text.isEmpty) {
  //     isRequestedInvalid.value = true;
  //   } else {
  //     isRequestedInvalid.value = false;
  //   }

  //   // if (TextInputType.number=='') {
  //   //   isFormInvalid.value = true;
  //   // }
  // }
}
