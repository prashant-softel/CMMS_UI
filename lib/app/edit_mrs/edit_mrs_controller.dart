import 'dart:async';

import 'package:cmms/app/edit_mrs/edit_mrs_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/create_mrs_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home/home_controller.dart';

class EditMrsController extends GetxController {
  ///
  EditMrsController(
    this.editMrsPresenter,
  );
  EditMrsPresenter editMrsPresenter;
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

  int mrsId = 0;
  var isSetTemplate = false.obs;
  int whereUsedId = 0;
  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    mrsId = Get.arguments;
    print('mrsId:$mrsId');
    if (mrsId != 0) {
      await getMrsDetails(mrsId: mrsId, isloading: true);
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

  Future<void> getMrsDetails({int? mrsId, bool? isloading}) async {
    final _mrsDetailsModel = await editMrsPresenter.getMrsDetails(
        mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      rowItem.value = [];
      _mrsDetailsModel.cmmrsItems?.forEach((element) {
        rowItem.value.add([
          {"key": "Drop_down", "value": '${element.asset_name}'},
          {'key': "Material_Type", "value": '${element.asset_type}'},
          {'key': "Image", "value": '${element.approved_date}'},
          {'key': "Available_Qty", "value": '${element.available_qty}'},
          {'key': "Requested_Qty", "value": '${element.requested_qty}'},
        ]);
        //  dropdownMapperData = element.approval_required;
      });
      whereUsedId = _mrsDetailsModel.whereUsedTypeId ?? 0;
      activityCtrlr.text = _mrsDetailsModel.activity ?? "";
      remarkCtrlr.text = _mrsDetailsModel.remarks ?? "";
      whereUsedCtrlr.text = _mrsDetailsModel.whereUsedType.toString();
    }
    print({"mrsdetailss", _mrsDetailsModel});
  }

  Future<void> getEquipmentList(int _facilityId) async {
    assetItemList.value = <GetAssetItemsModel>[];
    final _assetList =
        await editMrsPresenter.getEquipmentList(facilityId: facilityId);
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetItemList.add(asset);
      }
      //

      update(["AssetList"]);
    }
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

  Future<void> editMrs() async {
    String _activity = activityCtrlr.text.trim();
    String _remark = remarkCtrlr.text.trim();

    // Rx<DateTime> requestd_date = DateTime.now().obs;
    // String formattedFromdate =
    //     DateFormat('yyyy-MM-dd').format(requestd_date.value);

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
    CreateMrsModel editMrs = CreateMrsModel(
        ID: mrsId,
        isEditMode: 1,
        facility_ID: facilityId,
        //  requestd_date: formattedFromdate,
        setAsTemplate: "",
        activity: _activity,
        //1 is job,2 is pm
        whereUsedType: 2,
        whereUsedTypeId: whereUsedId,
        remarks: _remark,
        equipments: items);
    var editMrsJsonString = editMrs.toJson();

    print({"editMrsJsonString", editMrsJsonString});
    Map<String, dynamic>? responseEditMrs = await editMrsPresenter.editMrs(
      editMrsJsonString: editMrsJsonString,
      isLoading: true,
    );
    if (responseEditMrs == null) {
    } else {
      Get.offAllNamed(
        Routes.mrsListScreen,
      );
    }
  }
}
