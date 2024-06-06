import 'dart:async';

import 'package:cmms/app/edit_return_mrs/edit_return_mrs_presenter.dart';
import 'package:cmms/domain/models/create_return_mrs_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
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
      getCmmsItemList(
        facilityId,
      );
      rowItem.value = [];
      _returnMrsrsDetailsModel.cmmrsItems?.forEach((element) {
        rowItem.value.add([
          {"key": "Drop_down", "value": '${element.asset_name}'},
          {'key': "Issue_Qty", "value": '${element.issued_qty}'},
          {'key': "Return_Qty", "value": '${element.returned_qty}'},
          {'key': "Remark", "value": 'remark'},
        ]);
        // dropdownMapperData = element.approval_required;
      });
      // whereUsedId = _mrsDetailsModel.whereUsedTypeId ?? 0;
      activityCtrlr.text = _returnMrsrsDetailsModel.activity ?? "";
      // activityCtrlr.text = _mrsDetailsModel. ?? "";
      remarkCtrlr.text = _returnMrsrsDetailsModel.remarks ?? "";
      whereUsedCtrlr.text = _returnMrsrsDetailsModel.whereUsedTypeId.toString();
    }
    // print({"mrsdetailss", returnMrsDetailsModel.value});
  }

  Future<void> getCmmsItemList(int _facilityId) async {
    int userId = varUserAccessModel.value.user_id ?? 0;

    final _assetList = await editmrsReturnPresenter.getCmmsItemList(
        facilityId: facilityId, userId: userId);
    if (_assetList != null) {
      //   assetItemList.value = _assetList.cmmrsItems ?? [];
      //

      update(["AssetList"]);
    }

    addRowItem();
  }

  void addRowItem() {
    rowItem.value.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Issue_Qty", "value": ''},
      {'key': "Return_Qty", "value": ''},
      {'key': "Remark", "value": ''},
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
        whereUsedType: 2,
        whereUsedTypeId: 0,
        remarks: _remark,
        cmmrsItems: items);
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
