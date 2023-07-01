import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/create_go_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

import '../../domain/models/business_list_model.dart';
import '../home/home_controller.dart';
import 'stock_management_update_goods_orders_details_presenter.dart';

class StockManagementUpdateGoodsOrdersDetailsController extends GetxController {
  ///
  StockManagementUpdateGoodsOrdersDetailsController(
    this.stockManagementUpdateGoodsOrdersDetailsPresenter,
  );
  StockManagementUpdateGoodsOrdersDetailsPresenter
      stockManagementUpdateGoodsOrdersDetailsPresenter;
  final HomeController homecontroller = Get.find();
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<String> selectedUnitCurrency = ''.obs;
  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  int selectedUnitCurrencyId = 0;
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId => _facilityId.value;
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<String> selectedBusinessType = ''.obs;
  Rx<bool> isSelectedBusinessType = true.obs;
  int selectedBusinessTypeId = 1;
  int paidId = 0;
  RxBool showAdditionalColumn = false.obs;

  //drop down list of assets
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  var paidByDropdownList = 'Select Gender'.obs;

  Rx<bool> isAssetSelected = true.obs;
  Rx<String> selectedAsset = ''.obs;

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};

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
    Future.delayed(Duration(seconds: 1), () {
      getUnitCurrencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getBusinessList(4);
    });
    Future.delayed(Duration(seconds: 1), () {
      getAssetList(facilityId);
    });

    super.onInit();
  }

  Future<void> getBusinessList(ListType) async {
    final list =
        await stockManagementUpdateGoodsOrdersDetailsPresenter.getBusinessList(
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
    final _assetList = await stockManagementUpdateGoodsOrdersDetailsPresenter
        .getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
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
        await stockManagementUpdateGoodsOrdersDetailsPresenter
            .getUnitCurrencyList(
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
          asset_type_ID: paiddropdownMapperData[element[1]["value"]]?.id);
      items.add(item);
    });
    CreateGoModel createGoModel = CreateGoModel(
        facility_id: 45,
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
        amount: 0,
        currency: "",
        items: items);

    var createGoModelJsonString = createGoModel.toJson();
    Map<String, dynamic>? responseCreateWarrantyClaim =
        await stockManagementUpdateGoodsOrdersDetailsPresenter.createGoodsOrder(
      createGo: createGoModelJsonString,
      isLoading: true,
    );

    if (responseCreateWarrantyClaim == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    print('Create  Create GO  data: $createGoModelJsonString');
  }
}
