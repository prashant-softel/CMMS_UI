import 'dart:async';

import 'package:cmms/app/edit_mrs/edit_mrs_presenter.dart';
import 'package:cmms/domain/models/create_mrs_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../utils/utility.dart';

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
  var setTemlateCtrlr = TextEditingController();

  Rx<int> mrsId = 0.obs;
  var isSetTemplate = false.obs;
  int whereUsedId = 0;
  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    try {
      await setMrsId();
      if (mrsId != 0) {
        await getMrsDetails(mrsId: mrsId.value, isloading: true);
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
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await editMrsPresenter.getValue();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        editMrsPresenter.saveValue(mrsId: mrsId.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "mrsId");
    } catch (e) {
      Utility.showDialog(e.toString() + 'mrsId');
    }
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
        // dropdownMapperData = element.approval_required;
      });
      whereUsedId = _mrsDetailsModel.whereUsedTypeId ?? 0;
      activityCtrlr.text = _mrsDetailsModel.activity ?? "";
      // activityCtrlr.text = _mrsDetailsModel. ?? "";
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
    String _setTemp = setTemlateCtrlr.text.trim();

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
        ID: mrsId.value,
        isEditMode: 1,
        facility_ID: facilityId,
        //  requestd_date: formattedFromdate,
        setAsTemplate: _setTemp,
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
      // Get.offAllNamed(
      //   Routes.mrsListScreen,
      // );
    }
  }
}
