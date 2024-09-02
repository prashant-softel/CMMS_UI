import 'dart:async';
import 'package:cmms/app/receive_goods_order/receive_goods_order_presenter.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/create_go_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../../domain/models/business_list_model.dart';
import '../home/home_controller.dart';

class ReceiveGoodsOrdersController extends GetxController {
  ///
  ReceiveGoodsOrdersController(
    this.receiveGoodsOrdersPresenter,
  );
  ReceiveGoodsOrdersPresenter receiveGoodsOrdersPresenter;

  final HomeController homeController = Get.find();
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<String> selectedUnitCurrency = ''.obs;
  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  int selectedUnitCurrencyId = 0;
  Rx<bool> isInvoiceNumberInvalid = false.obs;
  Rx<bool> isCostInvalid = false.obs;

  Rx<bool> isAccepetedInvalid = false.obs;

  Rx<bool> isRequestedInvalid = false.obs;

  Rx<bool> isDeliverChalanInvalid = false.obs;
  Rx<bool> isGrnNoInvalid = false.obs;
  Rx<bool> isCountOfPackageReceivedInvalid = false.obs;
  Rx<bool> isVehicalInvalid = false.obs;
  Rx<bool> isGateInwardRegisterInvalid = false.obs;
  Rx<bool> isFreightInvalid = false.obs;
  Rx<bool> isLrNoInvalid = false.obs;
  Rx<bool> isMaterialReciveDateInvalid = false.obs;
  Rx<bool> isDeliveryChallanDateInvalid = false.obs;

  Rx<bool> isInvoiceDateInvalid = false.obs;

  Rx<bool> isEWayBillInvalid = false.obs;
  Rx<bool> isInspectionReportInvalid = false.obs;

  Rx<bool> isFormInvalid = false.obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isBlockSelected = true.obs;
  int selectedBlockId = 0;
  RxList<int?> selectedBlockIdList = <int>[].obs;
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  StreamSubscription<int>? facilityIdStreamSubscription;
  Stream<int> get facilityId$ => _facilityId.stream;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<String> selectedBusinessType = ''.obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  Rx<bool> isSelectedBusinessType = true.obs;
  int selectedBusinessTypeId = 1;
  int paidId = 0;
  RxBool showAdditionalColumn = false.obs;
  Rx<int> goId = 0.obs;
  int facilityId = 0;

  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();

  //drop down list of assets
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  RxList<PaiedModel?> paid = <PaiedModel>[].obs;

  var paidByDropdownList = 'Select Gender'.obs;

  Rx<bool> isAssetSelected = true.obs;
  Rx<String> selectedAsset = ''.obs;
  TextEditingController closeCommentTextFieldCtrlr = TextEditingController();
  // Rx<List<List<Map<String, String>>>> rowItem = Rx<List<List<Map<String, String>>>>([]);
  final rowItem = Rx<List<List<Map<String, String>>>>([]);
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};
  RxList<GetPurchaseDetailsByIDModel?>? getPurchaseDetailsByIDModelList =
      <GetPurchaseDetailsByIDModel?>[].obs;
  RxList<Items?>? goDetails = <Items?>[].obs;
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
  var freightValueCtrlr = TextEditingController();
  var inspectionReportCtrlr = TextEditingController();
  FocusNode VehicalFocus = FocusNode();
  ScrollController VehicalScroll = ScrollController();

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

  void onInit() async {
    try {
      await setUserId();
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
        updatePaidBy();
      });
      Future.delayed(Duration(seconds: 1), () {
        getBusinessList(4, facilityId);
      });
      Future.delayed(Duration(seconds: 1), () {
        getAssetList(facilityId);

        if (goId.value != 0) {
          Future.delayed(Duration(seconds: 1), () {
            getPurchaseDetailsById(id: goId.value);
          });
        }
      });
    } catch (e) {}
    await getGoHistory(id: goId.value);
    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _goId = await receiveGoodsOrdersPresenter.getValue();
      if (_goId == null || _goId == '' || _goId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        goId.value = dataFromPreviousScreen['goId'];
        receiveGoodsOrdersPresenter.saveValue(goId: goId.value.toString());
      } else {
        goId.value = int.tryParse(_goId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'userId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getFacilityList() async {
    final _facilityList = await receiveGoodsOrdersPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getGoHistory({required int id}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 32;
    // int tempModuleType = 21;
    //
    historyList?.value = await receiveGoodsOrdersPresenter.getHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getPurchaseDetailsById({required int id}) async {
    getPurchaseDetailsByIDModelList?.value = <GetPurchaseDetailsByIDModel>[];

    final _getPurchaseDetailsById =
        await receiveGoodsOrdersPresenter.getPurchaseDetailsById(id: id);
    // print('Edit goods order  Detail:$_getPurchaseDetailsById');

    if (_getPurchaseDetailsById != null) {
      getPurchaseDetailsByIDModel.value = _getPurchaseDetailsById;

      print(
          'Additioanl Email Employees${_getPurchaseDetailsById.goDetails.length ?? 0}');
      rowItem.value = [];
      goDetails?.value = _getPurchaseDetailsById.goDetails ?? [];
      _getPurchaseDetailsById.goDetails.forEach((element) {
        rowItem.value.add([
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
            'id': '${element.assetMasterItemID}'
          },
          {
            'key': "Received",
            "value": '${element.received_qty}',
            "sr_no": '${element.sr_no}',
            // "lostQty": '${element.lost_qty}'
          },
          {
            'key': "Accepted",
            "value": '${element.accepted_qty}',
            // 'id': '${element.assetMasterItemID}'
          },
          {
            'key': "Damaged",
            "value": '${element.damaged_qty}',
            // 'id': '${element.assetMasterItemID}'
          },
          {
            'key': "storage_rack_no",
            "value": '${element.storage_rack_no}',
            // 'id': '${element.assetMasterItemID}'
          },
          {
            'key': "storage_row_no",
            "value": '${element.storage_row_no}',
            // 'id': '${element.assetMasterItemID}'
          },
          {
            'key': "storage_column_no",
            "value": '${element.storage_column_no}',
            // 'id': '${element.assetMasterItemID}'
          },
        ]);
        dropdownMapperData[element.assetItem_Name ?? ""] = assetList.firstWhere(
            (e) => e?.name == element.assetItem_Name,
            orElse: null)!;
      });
      String challanDate =
          getPurchaseDetailsByIDModel.value?.challan_date ?? "";
      challanDateTc.text = (challanDate == "0001-01-01") ? "" : challanDate;

      String receivedDate = getPurchaseDetailsByIDModel.value?.receivedAt ?? "";
      receivedDateTc.text = (receivedDate == "0001-01-01") ? "" : receivedDate;

      String purchaseDate =
          getPurchaseDetailsByIDModel.value?.purchaseDate ?? "";
      purchaseDateTc.text = (purchaseDate == "0001-01-01") ? "" : purchaseDate;
      poDateDateTc.text = getPurchaseDetailsByIDModel.value?.po_date ?? "";

      challanNoCtrlr.text = getPurchaseDetailsByIDModel.value?.challan_no ?? "";
      pOCtrlr.text = getPurchaseDetailsByIDModel.value?.po_no ?? "";
      frieghtToPayPaidCtrlr.text =
          getPurchaseDetailsByIDModel.value?.freight ?? "";
      noOfPackagesReceivedCtrlr.text =
          getPurchaseDetailsByIDModel.value?.no_pkg_received ?? "";
      conditionOfPackagesReceivedCtrlr.text =
          getPurchaseDetailsByIDModel.value?.condition_pkg_received ?? "";
      freightValueCtrlr.text =
          getPurchaseDetailsByIDModel.value?.freight_value ?? "";
      inspectionReportCtrlr.text =
          getPurchaseDetailsByIDModel.value?.inspection_report ?? "";
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
      selectedUnitCurrencyId =
          getPurchaseDetailsByIDModel.value?.currencyID ?? 0;
      // idList =
      //     _getPurchaseDetailsById.goDetails!.map((e) => e.assetMasterItemID).toList();
      // print('AssetsItemId:$idList');
    }
  }

  Future<void> getBusinessList(ListType, int facilityId) async {
    final list = await receiveGoodsOrdersPresenter.getBusinessList(
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

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList =
        await receiveGoodsOrdersPresenter.getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
    addRowItem();
  }

  Future<void> updatePaidBy() async {
    paid.value = <PaiedModel>[];
    final _paid = await receiveGoodsOrdersPresenter.updatePaidBy(
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
        await receiveGoodsOrdersPresenter.getUnitCurrencyList(
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
          if (value != "Please Select") {
            int currencyIndex =
                unitCurrencyList.indexWhere((x) => x?.name == value);
            selectedUnitCurrencyId = unitCurrencyList[currencyIndex]?.id ?? 0;
          } else {
            selectedUnitCurrencyId = 0;
          }
        }
        break;
      case const (RxList<BusinessTypeModel>):
        {
          if (value != "Please Select") {
            int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
            selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
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
      {'key': "Received", "value": '', "sr_no": '0'},
      {'key': "Accepted", "value": ''},
      {'key': "Damaged", "value": ''}, {'key': "storage_rack_no", "value": ''},
      {'key': "storage_row_no", "value": ''},
      {'key': "storage_column_no", "value": ''},

      // {'key': "Pending", "value": ''},
    ]);
  }

  Future<void> checkform() async {
    if (approveCommentTextFieldCtrlr.text == '') {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  void approveGOReceiveButton({int? id}) async {
    {
      await checkform();
      if (isFormInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");

        return;
      }
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderAproveModel =
          CommentModel(id: id, comment: _comment, facilityId: facilityId);

      var goodsOrderApproveJsonString = commentGoodsOrderAproveModel.toJson();

      Map<String, dynamic>? response =
          await receiveGoodsOrdersPresenter.approveGOReceiveButton(
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void rejectGOReceiveButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderAproveModel =
          CommentModel(id: id, comment: _comment, facilityId: facilityId);

      var goodsOrderApproveJsonString = commentGoodsOrderAproveModel.toJson();

      Map<String, dynamic>? response =
          await receiveGoodsOrdersPresenter.rejectGOReceiveButton(
        goodsOrderApproveJsonString: goodsOrderApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void createGoodsOrder() async {
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
    List<Items> items = [];
    rowItem.value.forEach((element) {
      Items item = Items(
        goItemID: 0,
        assetMasterItemID: dropdownMapperData[element[0]["value"]]?.id,
        cost: double.tryParse(element[2]["value"] ?? '0'),
        ordered_qty: double.tryParse(element[3]["value"] ?? '0'),
        paid_by_ID: paiddropdownMapperData[element[1]["value"]]?.id,
      );
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
        await receiveGoodsOrdersPresenter.createGoodsOrder(
      createGo: createGoModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    print('Create  Create GO  data: $createGoModelJsonString');
  }

  void goodsOrderCloseButton({int? id}) async {
    {
      String _comment = closeCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderCloseModel =
          CommentModel(id: id, comment: _comment, facilityId: facilityId);

      var goodsOrderCloseJsonString = commentGoodsOrderCloseModel.toJson();

      Map<String, dynamic>? response =
          await receiveGoodsOrdersPresenter.goodsOrderCloseButton(
        goodsOrderCloseJsonString: goodsOrderCloseJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  //validation check from
  void checkForm() {
    if (challanNoCtrlr.text.trim().length < 3) {
      isInvoiceNumberInvalid.value = true;
    }
    if (isInvoiceNumberInvalid.value == true) {
      isFormInvalid.value = true;
    }
    if (frieghtToPayPaidCtrlr.text.trim().length < 3) {
      isDeliverChalanInvalid.value = true;
    }

    if (isDeliverChalanInvalid.value == true) {
      isFormInvalid.value = true;
    }

    ///
    if (noOfPackagesReceivedCtrlr.text.trim().length < 3) {
      isCountOfPackageReceivedInvalid.value = true;
    }

    if (isCountOfPackageReceivedInvalid.value == true) {
      isFormInvalid.value = true;
    }

    if (vehicleNoCtrlr.text.trim().length < 3) {
      isVehicalInvalid.value = true;
    }

    if (isVehicalInvalid.value == true) {
      isFormInvalid.value = true;
    }
    if (conditionOfPackagesReceivedCtrlr.text.trim().length < 3) {
      isGateInwardRegisterInvalid.value = true;
    }

    if (isGateInwardRegisterInvalid.value == true) {
      isFormInvalid.value = true;
    }

    if (freightValueCtrlr.text.trim().length < 3) {
      isFreightInvalid.value = true;
    }

    if (isFreightInvalid.value == true) {
      isFormInvalid.value = true;
    }
    if (lrNoCtrlr.text.trim().length < 3) {
      isLrNoInvalid.value = true;
    }

    if (isLrNoInvalid.value == true) {
      isFormInvalid.value = true;
    }
    if (receivedDateTc.text.trim().length < 3) {
      isMaterialReciveDateInvalid.value = true;
    }

    if (isMaterialReciveDateInvalid.value == true) {
      isFormInvalid.value = true;
    }

    if (challanDateTc.text.trim().length < 3) {
      isDeliveryChallanDateInvalid.value = true;
    }

    if (isDeliveryChallanDateInvalid.value == true) {
      isFormInvalid.value = true;
    }
    if (purchaseDateTc.text.trim().length < 3) {
      isInvoiceDateInvalid.value = true;
    }

    if (isInvoiceDateInvalid.value == true) {
      isFormInvalid.value = true;
    }

    if (jobRefCtrlr.text.trim().length < 3) {
      isEWayBillInvalid.value = true;
    }

    if (isEWayBillInvalid.value == true) {
      isFormInvalid.value = true;
    }
    if (inspectionReportCtrlr.text.trim().length < 3) {
      isInspectionReportInvalid.value = true;
    }

    if (isInspectionReportInvalid.value == true) {
      isFormInvalid.value = true;
    }
    if (girNoCtrlr.text.trim().length < 3) {
      isGrnNoInvalid.value = true;
    }

    if (isGrnNoInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
    if (TextEditingController().text.isEmpty) {
      isCostInvalid.value = true;
    } else {
      isCostInvalid.value = false;
    }
    if (TextEditingController().text.isEmpty) {
      isRequestedInvalid.value = true;
    } else {
      isRequestedInvalid.value = false;
    }
    if (TextEditingController().text.isEmpty) {
      isAccepetedInvalid.value = true;
    } else {
      isAccepetedInvalid.value = false;
    }
  }

  void updateGOReceive() async {
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
    String _freightValueCtrlr = freightValueCtrlr.text.trim();
    String _inspectionReportCtrlr = inspectionReportCtrlr.text.trim();
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
        // goItemID: int.tryParse('${element[0]["id"]}'),
        // // requested_qty: int.tryParse('${element[4]["recieveQty"]}'),
        // lost_qty: 0, //int.tryParse('${element[5]["lostQty"]}'),
        // assetMasterItemID: int.tryParse('${element[0]["assetMasterItemID"]}'),
        // paid_by_ID: int.tryParse('${element[1]["id"]}'),
        // cost: int.tryParse(element[3]["value"] ?? '0'),
        // ordered_qty: int.tryParse(element[4]["value"] ?? '0'),
        // received_qty: int.tryParse(element[5]["value"] ?? '0'),
        // accepted_qty: int.tryParse(element[6]["value"] ?? '0'),
        // damaged_qty: int.tryParse(element[7]["value"] ?? '0'),
        // requested_qty: int.tryParse(element[2]["value"] ?? '0'),
        goItemID: int.tryParse('${element[0]["id"]}'),
        lost_qty: 0, //int.tryParse('${element[4]["lostQty"]}'),
        assetMasterItemID: int.tryParse('${element[0]["assetMasterItemID"]}'),
        paid_by_ID: int.tryParse('${element[1]["id"]}'),
        cost: double.tryParse(element[3]["value"] ?? '0'),
        ordered_qty: double.tryParse(element[4]["value"] ?? '0'),
        received_qty: double.tryParse(element[5]["value"] ?? '0'),
        sr_no: element[5]["sr_no"],
        accepted_qty: double.tryParse(element[6]["value"] ?? '0'),
        damaged_qty: double.tryParse(element[7]["value"] ?? '0'),
        requested_qty: double.tryParse(element[2]["value"] ?? '0'),
        storage_column_no: '${element[10]["value"]}',
        storage_rack_no: '${element[8]["value"]}',
        storage_row_no: '${element[9]["value"]}',
      );

      // poID: paiddrpdownMapperData[element[1]["value"]]?.id)
      ;
      items.add(item);
    });

    CreateGoModel createGoModel = CreateGoModel(
        id: goId.value,
        facility_id: facilityId,
        is_submit: 1,
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
        freight_value: _freightValueCtrlr,
        inspection_report: _inspectionReportCtrlr,
        gir_no: _girNoCtrlr,
        job_ref: _jobRefCtrlr,
        amount: int.tryParse(_amountCtrlr) ?? 0,
        currencyID: selectedUnitCurrencyId,
        items: items);

    var createGoModelJsonString = createGoModel.toJson();
    Map<String, dynamic>? responseCreateGoModel =
        await receiveGoodsOrdersPresenter.updateGOReceive(
      createGo: createGoModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    print('update  Create GO  data: $createGoModelJsonString');
  }

  void updateGOReceiveIsSubmit0() async {
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
    List<Items> items = [];
    rowItem.value.forEach((element) {
      Items item = Items(
        goItemID: int.tryParse('${element[0]["id"]}'),
        lost_qty: 0, //int.tryParse('${element[4]["lostQty"]}'),
        assetMasterItemID: int.tryParse('${element[0]["assetMasterItemID"]}'),
        paid_by_ID: int.tryParse('${element[1]["id"]}'),
        cost: double.tryParse(element[3]["value"] ?? '0'),
        ordered_qty: double.tryParse(element[4]["value"] ?? '0'),
        received_qty: double.tryParse(element[5]["value"] ?? '0'),
        accepted_qty: double.tryParse(element[6]["value"] ?? '0'),
        damaged_qty: double.tryParse(element[7]["value"] ?? '0'),
        requested_qty: double.tryParse(element[2]["value"] ?? '0'),
      );

      // poID: paiddropdownMapperData[element[1]["value"]]?.id)
      ;
      items.add(item);
    });

    CreateGoModel createGoModel = CreateGoModel(
        id: goId.value,
        facility_id: facilityId,
        is_submit: 0,
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
        await receiveGoodsOrdersPresenter.updateGOReceiveIsSubmit0(
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
