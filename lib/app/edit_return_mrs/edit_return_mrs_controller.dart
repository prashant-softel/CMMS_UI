import 'dart:async';

import 'package:cmms/app/edit_return_mrs/edit_return_mrs_presenter.dart';
import 'package:cmms/domain/models/create_return_mrs_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/models/employe_stock_model.dart';
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
  RxList<CmmrsItemsModel?> assetItemList = <CmmrsItemsModel?>[].obs;

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, CmmrsItemsModel> dropdownMapperData = {};
  var activityCtrlr = TextEditingController();
  var remarkCtrlr = TextEditingController();
  var whereUsedCtrlr = TextEditingController();
  var setTemlateCtrlr = TextEditingController();

  int mrsId = 0;
  var isSetTemplate = false.obs;

  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    mrsId = Get.arguments;
    if (mrsId != 0) {
      await getReturnMrsDetails(mrsId: mrsId, isloading: true);
    }
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getCmmsItemList(
          facilityId,
        );
      });
    });
    super.onInit();
  }

  Future<void> getReturnMrsDetails({int? mrsId, bool? isloading}) async {
    final _returnMrsrsDetailsModel = await editmrsReturnPresenter
        .getReturnMrsDetails(mrsId: mrsId, isLoading: isloading);

    if (_returnMrsrsDetailsModel != null) {
      rowItem.value = [];
      _returnMrsrsDetailsModel.cmmrsItems?.forEach((element) {
        rowItem.value.add([
          {"key": "Drop_down", "value": '${element.asset_name}'},
          {'key': "Issue_Qty", "value": '${element.issued_qty}'},
          {'key': "Return_Qty", "value": '${element.returned_qty}'},
          {'key': "is_faulty", "value": '0'},
          {'key': "Remark", "value": 'remark'},
        ]);
        // dropdownMapperData = element.approval_required;
      });
      // whereUsedId = _mrsDetailsModel.whereUsedTypeId ?? 0;
      activityCtrlr.text = _returnMrsrsDetailsModel.activity ?? "";
      // activityCtrlr.text = _mrsDetailsModel. ?? "";
      remarkCtrlr.text = _returnMrsrsDetailsModel.remarks ?? "";
      whereUsedCtrlr.text = _returnMrsrsDetailsModel.whereUsedType.toString();
    }
    // print({"mrsdetailss", returnMrsDetailsModel.value});
  }

  Future<void> getCmmsItemList(int _facilityId) async {
    int userId = varUserAccessModel.value.user_id ?? 0;

    final _assetList = await editmrsReturnPresenter.getCmmsItemList(
        facilityId: facilityId, userId: userId);
    if (_assetList != null) {
      assetItemList.value = _assetList.cmmrsItems ?? [];
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
      {'key': "is_faulty", "value": ''},
      {'key': "Remark", "value": ''},
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
    rowItem.value.forEach((element) {
      CmmsItem item = CmmsItem(
        asset_item_ID: dropdownMapperData[element[0]["value"]]?.id,
        issued_qty: dropdownMapperData[element[0]["value"]]?.quantity ?? 0,
        returned_qty: int.tryParse(element[2]["value"] ?? '0'),
        requested_qty: 0,
        approval_required: 0,
        is_faulty: 0, // int.tryParse(element[3]["value"] ?? '0'),
        return_remarks: element[4]["value"] ?? '0',
      );
      items.add(item);
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
    // var createReturnMrsJsonString = {
    //   "ID": 0,
    //   "facility_ID": 45,
    //   "setAsTemplate": "T140",
    //   "whereUsedType": 1,
    //   "whereUsedTypeId": 9999,
    //   "remarks": "Testing on live",
    //   "activity": "return activity",
    //   "cmmrsItems": [
    //     {
    //       "asset_item_ID": 12,
    //       "approval_required": 1,
    //       "return_remarks": "Test remarks",
    //       "requested_qty": 99,
    //       "issued_qty": 65,
    //       "returned_qty": 10,
    //       "is_faulty": 0
    //     }
    //   ]
    // };

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
