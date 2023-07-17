import 'dart:async';

import 'package:cmms/app/create_mrs/create_mrs_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/create_mrs_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home/home_controller.dart';

class CreateMrsController extends GetxController {
  ///
  CreateMrsController(
    this.createMrsPresenter,
  );
  CreateMrsPresenter createMrsPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<GetAssetItemsModel?> assetItemList = <GetAssetItemsModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, GetAssetItemsModel> dropdownMapperData = {};
  var activityCtrlr = TextEditingController();
  var remarkCtrlr = TextEditingController();
  var whereUsedCtrlr = TextEditingController();

  int whereUsedTypeId = 0;

  ///
  @override
  void onInit() async {
    whereUsedTypeId = Get.arguments;
    if (whereUsedTypeId != 0) {
      whereUsedCtrlr.text = whereUsedTypeId.toString() ?? "";
    }
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getEquipmentList(
          facilityId,
        );
      });
    });
    super.onInit();
  }

  Future<void> getEquipmentList(int _facilityId) async {
    assetItemList.value = <GetAssetItemsModel>[];
    final _assetList =
        await createMrsPresenter.getEquipmentList(facilityId: facilityId);
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetItemList.add(asset);
      }
      //

      update(["AssetList"]);
    }
    addRowItem();
  }

  void addRowItem() {
    rowItem.value.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Material_Type", "value": ''},
      {'key': "Image", "value": ''},
      {'key': "Available_Qty", "value": ''},
      {'key': "Requested_Qty", "value": ''},
    ]);
  }

  Future<void> createMrs() async {
    String _activity = activityCtrlr.text.trim();
    String _remark = remarkCtrlr.text.trim();

    Rx<DateTime> requestd_date = DateTime.now().obs;
    String formattedFromdate =
        DateFormat('yyyy-MM-dd').format(requestd_date.value);

    List<Equipments> items = [];
    rowItem.value.forEach((element) {
      Equipments item = Equipments(
        id: dropdownMapperData[element[0]["value"]]?.id,
        issued_qty: dropdownMapperData[element[0]["value"]]?.available_qty,
        asset_code: dropdownMapperData[element[0]["value"]]?.asset_code,
        equipmentID: dropdownMapperData[element[0]["value"]]?.asset_ID,
        asset_type_ID: dropdownMapperData[element[0]["value"]]?.asset_type_ID,
        approval_required: 1,
        requested_qty: int.tryParse(element[4]["value"] ?? '0'),
      );
      items.add(item);
    });
    CreateMrsModel createMrs = CreateMrsModel(
        ID: 0,
        isEditMode: 0,
        facility_ID: facilityId,
        requestd_date: formattedFromdate,
        setAsTemplate: 0,
        activity: _activity,
        //1 is job,2 is pm
        whereUsedType: 2,
        whereUsedTypeId: whereUsedTypeId,
        return_remarks: _remark,
        equipments: items);
    var createMrsJsonString = createMrs.toJson();

    print({"createMrsJsonString", createMrsJsonString});
    Map<String, dynamic>? responseCreateMrs =
        await createMrsPresenter.createMrs(
      createMrsJsonString: createMrsJsonString,
      isLoading: true,
    );
    if (responseCreateMrs == null) {
    } else {
      Get.offAllNamed(
        Routes.mrsListScreen,
      );
    }
  }
}
