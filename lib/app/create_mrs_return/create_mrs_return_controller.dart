import 'dart:async';

import 'package:cmms/app/create_mrs_return/create_mrs_return_presenter.dart';
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
      {'key': "Material_Type", "value": ''},
      {'key': "Issue_Qty", "value": ''},
      {'key': "Return_Qty", "value": ''},
      {'key': "Remark", "value": ''},
    ]);
  }

  Future<void> createMrs() async {
    String _activity = activityCtrlr.text.trim();
    String _remark = remarkCtrlr.text.trim();

    Rx<DateTime> requestd_date = DateTime.now().obs;
    String formattedFromdate =
        DateFormat('yyyy-MM-dd').format(requestd_date.value);

    // List<Equipments> items = [];
    // rowItem.value.forEach((element) {
    //   Equipments item = Equipments(
    //     id: dropdownMapperData[element[0]["value"]]?.id,
    //     issued_qty: dropdownMapperData[element[0]["value"]]?.available_qty,
    //     asset_code: dropdownMapperData[element[0]["value"]]?.asset_code,
    //     equipmentID: dropdownMapperData[element[0]["value"]]?.asset_ID,
    //     asset_type_ID: dropdownMapperData[element[0]["value"]]?.asset_type_ID,
    //     approval_required: 1,
    //     requested_qty: int.tryParse(element[4]["value"] ?? '0'),
    //   );
    //   items.add(item);
    // });
    // CreateMrsModel createMrs = CreateMrsModel(
    //     ID: 0,
    //     isEditMode: 0,
    //     facility_ID: facilityId,
    //     setAsTemplate: "", //isSetTemplate == true ? 1 : 0,
    //     activity: _activity,
    //     //1 is job,2 is pm
    //     whereUsedType: 2,
    //     whereUsedTypeId: whereUsedTypeId,
    //     remarks: _remark,
    //     equipments: items);
    //  var createMrsJsonString = createMrs.toJson();
    var createReturnMrsJsonString = {
      "ID": 145,
      "isEditMode": 0,
      "facility_ID": 45,
      "requested_by_emp_ID": 1,
      // "returnDate":"2023-03-03",
      "setAsTemplate": "T3",
      "asset_item_ID": 4,
      "return_remarks": "Testing",
      "item_condition": 1,
      "cmmrsItems": [
        {
          "id": 316,
          "equipmentID": 12,
          "approval_required": 1,
          "asset_type_ID": 10,
          "return_remarks": "Test remarks",
          "requested_qty": 15,
          "issued_qty": 10,
          "returned_qty": 3,
          "is_faulty": 0
        }
      ]
    };

    print({"createMrsJsonString", createReturnMrsJsonString});
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
