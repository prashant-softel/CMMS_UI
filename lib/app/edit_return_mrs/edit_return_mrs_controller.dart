import 'dart:async';

import 'package:cmms/app/edit_return_mrs/edit_return_mrs_presenter.dart';
import 'package:cmms/domain/models/create_return_mrs_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../constant/constant.dart';
import '../home/home_controller.dart';
import '../navigators/app_pages.dart';

class EditMrsReturnController extends GetxController {
  ///
  EditMrsReturnController(
    this.editmrsReturnPresenter,
  );
  EditMrsReturnPresenter editmrsReturnPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<PlantStockListModel?> assetItemList = <PlantStockListModel?>[].obs;
  RxList<StockDetails?> StockDetailsList = <StockDetails?>[].obs;
  var allDropdownsSelected = true.obs;

  // RxList<CmmrsItemsModel?> assetItemList = <CmmrsItemsModel?>[].obs;
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;

  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  var activityCtrlr = TextEditingController();
  var remarkCtrlr = TextEditingController();
  var whereUsedCtrlr = TextEditingController();
  var setTemlateCtrlr = TextEditingController();
  RxList<List<Map<String, String>>> rowFaultyItem =
      <List<Map<String, String>>>[].obs;
  RxMap<dynamic, dynamic> dropdownFaultyMapperData = {}.obs;
  int mrsId = 0;
  var isSetTemplate = false.obs;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  Rx<ReturnMrsDetailsModel?> returnMrsDetailsModel =
      ReturnMrsDetailsModel().obs;

  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    mrsId = Get.arguments;

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getReturnMrsDetails(
            mrsId: mrsId, isloading: true, facilityId: facilityId);
        getAssetList(facilityId);
      });
    });
    super.onInit();
  }

  Future<void> getReturnMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _returnMrsrsDetailsModel =
        await editmrsReturnPresenter.getReturnMrsDetails(
            mrsId: mrsId, isLoading: isloading, facilityId: facilityId);

    if (_returnMrsrsDetailsModel != null) {
      returnMrsDetailsModel.value = _returnMrsrsDetailsModel;

      getCmmsItemList(
        _returnMrsrsDetailsModel.mrs_id ?? 0,
      );
    }
    // print({"mrsdetailss", returnMrsDetailsModel.value});
  }

  Future<void> getCmmsItemList(int orginmrsId) async {
    final _assetList = await editmrsReturnPresenter.getCmmsItemList(
        facilityId: facilityId, isLoading: false, mrsId: orginmrsId);
    if (_assetList != null) {
      for (var facility in _assetList) {
        for (var stockDetail in facility!.stockDetails) {
          StockDetailsList.add(stockDetail);
          //  StockDetailsList.value = facility?.stockDetails ?? [];
        }
      }

      rowItem.value = [];
      returnMrsDetailsModel.value!.cmmrsItems?.forEach((element) {
        rowItem.value.add([
          {"key": "Drop_down", "value": '${element.name}'},
          {'key': "Sr_No", "value": ''},
          {'key': "code", "value": ''},
          {'key': "Material_Type", "value": ''},
          {'key': "Issue_Qty", "value": ''},
          {'key': "Used_Qty", "value": ''},
          {'key': "Return_Qty", "value": '${element.returned_qty}'},
          {'key': "Remark", "value": ''},
          // {'key': "Action ", "value": ''},
        ]);
        dropdownMapperData[element.name] = StockDetailsList.firstWhere(
            (e) => e!.asset_type == element.asset_type,
            orElse: null);
        // dropdownMapperData = element.approval_required;
      });
      // whereUsedId = _mrsDetailsModel.whereUsedTypeId ?? 0;
      activityCtrlr.text = returnMrsDetailsModel.value?.activity ?? "";
      // activityCtrlr.text = _mrsDetailsModel. ?? "";
      remarkCtrlr.text = returnMrsDetailsModel.value?.remarks ?? "";
      whereUsedCtrlr.text =
          returnMrsDetailsModel.value!.whereUsedTypeId.toString();
      // assetItemList.value = _assetList.s ?? [];
      //

      update(["AssetList"]);
    }

    // addRowItem();
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList =
        await editmrsReturnPresenter.getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      //for (var asset in _assetList) {
      assetList.value = _assetList;
      //  }

      rowFaultyItem.value = [];
      returnMrsDetailsModel.value!.cmmrsFaultyItems?.forEach((element) {
        rowFaultyItem.value.add([
          {"key": "Drop_down", "value": '${element.name}'},
          {'key': "code", "value": ''},
          {'key': "Material_Type", "value": ''},
          {'key': "Material_Category", "value": ''},
          {'key': "Sr_no", "value": ''},
          {'key': "Return_Qty", "value": '${element.returned_qty}'},
          {'key': "Remark", "value": ''},
          {'key': "Action ", "value": ''},
          // {'key': "Action ", "value": ''},
        ]);
        dropdownFaultyMapperData[element.name] = assetList.firstWhere(
            (e) => e!.asset_type == element.asset_type,
            orElse: null);
      });
      update(["AssetList"]);
    }
    // addRowFaultyItem();
  }

  void addRowItem() {
    rowItem.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Sr_No", "value": ''},
      {'key': "code", "value": ''},
      {'key': "Material_Type", "value": ''},
      {'key': "Issue_Qty", "value": ''},
      {'key': "Used_Qty", "value": ''},
      {'key': "Return_Qty", "value": ''},
      {'key': "Remark", "value": ''},
      // {'key': "Action ", "value": ''},
    ]);
  }

  void addRowFaultyItem() {
    rowFaultyItem.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "code", "value": ''},
      {'key': "Material_Type", "value": ''},
      {'key': "Material_Category", "value": ''},
      {'key': "Sr_no", "value": ''},
      {'key': "Return_Qty", "value": ''},
      {'key': "Remark", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  Future<void> createReturnMrs() async {
    String _activity = activityCtrlr.text.trim();
    String _remark = remarkCtrlr.text.trim();
    String _setTemp = setTemlateCtrlr.text.trim();

    Rx<DateTime> requestd_date = DateTime.now().obs;
    String formattedFromdate =
        DateFormat('yyyy-MM-dd').format(requestd_date.value);

    List<CmmsItem> items = [];
    List<FaultyItemsCmms> faultyItems = [];
    rowItem.value.forEach((element) {
      CmmsItem item = CmmsItem(
        mrs_item_ID: dropdownMapperData.value[element[0]["value"]]?.id,
        returned_qty: dropdownMapperData.value[element[0]["value"]].issued_qty -
            dropdownMapperData.value[element[0]["value"]]
                .consumed_qty, //double.tryParse(element[3]["value"] ?? '0'),

        return_remarks: element[7]["value"] ?? '0',
      );
      items.add(item);
    });
    rowFaultyItem.forEach((element) {
      FaultyItemsCmms item = FaultyItemsCmms(
        assetMasterItemID:
            dropdownFaultyMapperData.value[element[0]["value"]]?.id,
        mrsItemID: 0,
        // dropdownFaultyMapperData.value[element[0]["value"]].issued_qty,
        sr_no: element[4]["value"] ?? '0',
        returned_qty: int.tryParse(element[5]["value"] ?? '0'),
        return_remarks: element[6]["value"] ?? '0',
      );
      faultyItems.add(item);
    });
    CreateReturnMrsModel createMrs = CreateReturnMrsModel(
        ID: mrsId,
        facility_ID: facilityId,
        setAsTemplate: "", //isSetTemplate == true ? 1 : 0,
        activity: _activity,
        //1 is job,2 is pm
        whereUsedType: 27,
        whereUsedTypeId: returnMrsDetailsModel.value?.whereUsedTypeId,
        to_actor_id: facilityId, //
        to_actor_type_id: 2, // to_actor_type_id.value,
        from_actor_type_id: 3, // fromActorTypeId.value,
        from_actor_id: returnMrsDetailsModel.value?.whereUsedTypeId,
        remarks: _remark,
        cmmrsItems: items,
        faultyItems: faultyItems);
    var createReturnMrsJsonString = createMrs.toJson();

    print({"createReturnMrsJsonString", createReturnMrsJsonString});
    Map<String, dynamic>? responseCreateReturnMrs =
        await editmrsReturnPresenter.createReturnMrs(
      createReturnMrsJsonString: createReturnMrsJsonString,
      isLoading: true,
    );
    if (responseCreateReturnMrs == null) {
    } else {
      Get.offAllNamed(
        Routes.returnMrsList,
      );
    }
  }
}
