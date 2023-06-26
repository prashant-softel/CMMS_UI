import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
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
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId => _facilityId.value;
  RxList<BusinessTypeModel?> businessCategoryList = <BusinessTypeModel>[].obs;
  Rx<String> selectedBusinessType = ''.obs;
  Rx<bool> isSelectedBusinessType = true.obs;
  int selectedBusinessTypeId = 1;
  //
  /// date picker
  bool openPurchaseDatePicker = false;
  bool openChallanDatePicker = false;
  bool openPODatePicker = false;
  bool openReceivedPicker = false;

  var purchaseDateTc = TextEditingController();
  var challanDateTc = TextEditingController();
  var poDateDateTc = TextEditingController();
  var receivedDateTc = TextEditingController();

  ///
  @override
  void onInit() async {
    Future.delayed(Duration(seconds: 1), () {
      getUnitCurrencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getBusinessTypeList();
    });
    super.onInit();
  }

  Future<void> getBusinessTypeList() async {
    businessCategoryList.value = <BusinessTypeModel>[];
    final list = await stockManagementUpdateGoodsOrdersDetailsPresenter
        .getBusinessTypeList();

    for (var _equipmentCategoryList in list) {
      businessCategoryList.add(_equipmentCategoryList);
    }
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
      //  case RxList<>:
      // {
      //   int manufacturerIndex =
      //       manufacturerModelNameList.indexWhere((x) => x?.name == value);
      //   selectedmanufacturerNameId =
      //       manufacturerModelNameList[manufacturerIndex]?.id ?? 0;
      // }
      case RxList<BusinessTypeModel>:
        {
          int equipmentIndex =
              businessCategoryList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId =
              businessCategoryList[equipmentIndex]?.id ?? 0;
        }
        break;
    }
  }
}
