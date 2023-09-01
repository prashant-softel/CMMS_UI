import 'dart:async';

import 'package:cmms/app/create_mrs_return/create_mrs_return_presenter.dart';
import 'package:cmms/domain/models/create_return_mrs_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/models/employe_stock_model.dart';
import '../constant/constant.dart';
import '../home/home_controller.dart';
import '../navigators/app_pages.dart';

class CreateMrsReturnController extends GetxController {
  ///
  CreateMrsReturnController(
    this.createmrsReturnPresenter,
  );
  CreateMrsReturnPresenter createmrsReturnPresenter;
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

  int whereUsedTypeId = 0;
  var isSetTemplate = false.obs;

  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    whereUsedTypeId = Get.arguments;
    if (whereUsedTypeId != 0) {
      whereUsedCtrlr.text = whereUsedTypeId.toString();
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

  Future<void> getCmmsItemList(int _facilityId) async {
    int userId = varUserAccessModel.value.user_id ?? 0;

    final _assetList = await createmrsReturnPresenter.getCmmsItemList(
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
        issued_qty: dropdownMapperData[element[0]["value"]]?.quantity,
        returned_qty: int.tryParse(element[2]["value"] ?? '0'),
        requested_qty: 0,
        approval_required: 0,
        is_faulty: int.tryParse(element[3]["value"] ?? '0'),
        return_remarks: element[4]["value"] ?? '0',
      );
      items.add(item);
    });
    CreateReturnMrsModel createMrs = CreateReturnMrsModel(
        ID: 0,
        facility_ID: facilityId,
        setAsTemplate: "", //isSetTemplate == true ? 1 : 0,
        activity: _activity,
        //1 is job,2 is pm
        whereUsedType: 2,
        whereUsedTypeId: whereUsedTypeId,
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
        await createmrsReturnPresenter.createReturnMrs(
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
