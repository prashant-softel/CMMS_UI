import 'dart:async';

import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/create_go_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

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
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
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
  Rx<String> selectedBusinessType = ''.obs;

  Rx<bool> isSelectedBusinessType = true.obs;
  int selectedBusinessTypeId = 1;
  int paidId = 0;
  RxBool showAdditionalColumn = false.obs;
  int? id = 0;
  int facilityId = 0;

  //drop down list of assets
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
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
  var paid = <PaiedModel>[
    PaiedModel(name: "Please Select", id: 0),
    PaiedModel(name: 'Operator', id: 1),
    PaiedModel(name: 'Owner', id: 2),
  ];
  var selectedCountry = PaiedModel(name: "Please Select", id: 0).obs;

  ///
  @override
  void onInit() async {
    id = Get.arguments;
    print('AddStock:$id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
      });
    });
    Future.delayed(Duration(seconds: 1), () {
      getUnitCurrencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getBusinessList(4);
    });
    Future.delayed(Duration(seconds: 1), () {
      getAssetList(facilityId);
      if (id != null) {
        Future.delayed(Duration(seconds: 1), () {
          getPurchaseDetailsById(id: id!);
        });
      }
    });

    super.onInit();
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
          'Additioanl Email Employees${_getPurchaseDetailsById.goDetails?.length ?? 0}');
      rowItem.value = [];
      _getPurchaseDetailsById.goDetails?.forEach((element) {
        rowItem.value.add([
          {"key": "Drop_down", "value": '${element.assetItem_Name}'},
          {'key': "Paid_By", "value": ''},
          {'key': "Cost", "value": '${element.cost}'},
          {'key': "Order", "value": '${element.ordered_qty}'},
        ]);
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

  void updatePaidBy(String value) {
    paidByDropdownList.value = value;
  }

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
      case RxList<BusinessTypeModel>:
        {
          int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
        }
        break;
      case RxList<BusinessTypeModel>:
        {
          int equipmentIndex = paid.indexWhere((x) => x.name == value);
          paidId = paid[equipmentIndex].id;
        }
        break;
    }
  }

  void addRowItem() {
    rowItem.value.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Paid_By", "value": 'Please Select'},
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
          assetItemID: dropdownMapperData[element[0]["value"]]?.id,
          cost: int.tryParse(element[2]["value"] ?? '0'),
          ordered_qty: int.tryParse(element[3]["value"] ?? '0'),
          poID: paiddropdownMapperData[element[1]["value"]]?.id);
      items.add(item);
    });
    CreateGoModel createGoModel = CreateGoModel(
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
        received_on: _receivedDateTc,
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
          assetItemID: dropdownMapperData[element[0]["value"]]?.id,
          cost: int.tryParse(element[2]["value"] ?? '0'),
          ordered_qty: int.tryParse(element[3]["value"] ?? '0'),
          poID: paiddropdownMapperData[element[1]["value"]]?.id);
      items.add(item);
    });
    CreateGoModel createGoModel = CreateGoModel(
        id: id,
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
        received_on: _receivedDateTc,
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
}
