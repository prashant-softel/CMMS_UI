import 'dart:async';

import 'package:cmms/app/edit_mrs/edit_mrs_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/create_mrs_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;

  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  RxMap<String, bool> errorState = <String, bool>{}.obs;
  // List<String> removedMaterials = <String>[].obs;
  // RxList<GetAssetItemsModel?> removedMaterials = <GetAssetItemsModel?>[].obs;

  var activityCtrlr = TextEditingController();
  var remarkCtrlr = TextEditingController();
  var whereUsedCtrlr = TextEditingController();
  var setTemlateCtrlr = TextEditingController();

  Rx<int> mrsId = 0.obs;
  Rx<bool> isFormInvalid = false.obs;
  Rx<int> type = 0.obs;
  var isSetTemplate = false.obs;
  int whereUsedId = 0;
  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  Rx<int> fromActorTypeId = 0.obs;
  Rx<int> to_actor_type_id = 0.obs;
  Rx<String> whereUsedTypeName = "".obs;

  ///
  @override
  void onInit() async {
    try {
      await setMrsId();

      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        if (facilityId > 0) {
          Future.delayed(Duration(seconds: 1), () async {
            await getEquipmentList(
              facilityId,
            );
            if (mrsId != 0) {
              await getMrsDetails(
                  mrsId: mrsId.value, isloading: true, facilityId: facilityId);
            }
          });
        }
      });
      // if (mrsId != 0) {
      //   await getMrsDetails(mrsId: mrsId.value, isloading: true);
      // }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await editMrsPresenter.getValue();
      final _type = await editMrsPresenter.getValue();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        // type.value = dataFromPreviousScreen['type'];
        String? typeValue = dataFromPreviousScreen['type'];

        editMrsPresenter.saveValue(mrsId: mrsId.value.toString());
        editMrsPresenter.saveValuee(type: type.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
        type.value = int.tryParse(_type!) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "mrsId");
    } catch (e) {
      Utility.showDialog(e.toString(), 'mrsId');
    }
  }

  Future<void> getMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _mrsDetailsModel = await editMrsPresenter.getMrsDetails(
        facilityId: facilityId, mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      whereUsedId = _mrsDetailsModel.whereUsedRefID ?? 0;
      activityCtrlr.text = _mrsDetailsModel.activity ?? "";
      // activityCtrlr.text = _mrsDetailsModel. ?? "";
      remarkCtrlr.text = _mrsDetailsModel.remarks ?? "";
      whereUsedCtrlr.text = _mrsDetailsModel.whereUsedRefID.toString();
      to_actor_type_id.value = _mrsDetailsModel.whereUsedRefID;
      fromActorTypeId.value = 2;
      whereUsedTypeName.value = _mrsDetailsModel.whereUsedTypeName ?? "";
      rowItem.value = [];
      _mrsDetailsModel.cmmrsItems?.forEach((element) {
        rowItem.add(
          [
            {"key": "Drop_down", "value": '${element.asset_name}'},
            {'key': "Material_Type", "value": ''},
            // {'key': "Image", "value": '${element.approved_date}'},
            {'key': "Available_Qty", "value": ''},
            {'key': "Requested_Qty", "value": '${element.requested_qty}'},
            {'key': "Action ", "value": ''},
          ],
        );
        // dropdownMapperData = element.approval_required;
        // dropdownMapperData[element.asset_type ?? ""] = assetItemList.firstWhere(
        //     (e) => e?.asset_type == element.asset_type,
        //     orElse: null)!;
        dropdownMapperData[element.asset_name] = assetItemList.firstWhere(
            (e) => e!.asset_type == element.asset_type,
            orElse: null);
        dropdownMapperData[element.asset_name] = assetItemList.firstWhere(
            (e) => e!.available_qty == element.available_qty,
            orElse: null);
      });
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
    rowItem.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Material_Type", "value": ''},
      // {'key': "Image", "value": ''},
      {'key': "Available_Qty", "value": ''},
      {'key': "Requested_Qty", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  void checkform() {
    if (remarkCtrlr.text == '') {
      Fluttertoast.showToast(msg: 'Enter Comment!');
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  bool validateFields() {
    bool isValid = true;
    errorState.clear();
    for (int i = 0; i < rowItem.length; i++) {
      var row = rowItem[i];
      for (var mapData in row) {
        if ((mapData['key'] == 'Drop_down' &&
                (mapData['value'] == null ||
                    mapData['value'] == 'Please Select')) ||
            (mapData['key'] == 'Requested_Qty' &&
                (mapData['value'] == null || mapData['value'] == ''))) {
          errorState['$i-${mapData['key']}'] = true;
          isValid = false;
        }
      }
    }
    update();
    return isValid;
  }

  Future<void> editMrs() async {
    {
      // checkform();
      // if (isFormInvalid.value) {
      //   return;
      // }
      if (!validateFields()) {
        return;
      } else {
        String _activity = activityCtrlr.text.trim();
        String _remark = remarkCtrlr.text.trim();
        String _setTemp = setTemlateCtrlr.text.trim();
        String _wheredused = whereUsedCtrlr.text.trim();
        List<Equipments> items = [];
        rowItem.forEach((element) {
          Equipments item = Equipments(
            id: dropdownMapperData[element[0]["value"]]?.id,
            available_qty:
                dropdownMapperData[element[0]["value"]]?.available_qty,
            issued_qty: dropdownMapperData[element[0]["value"]]?.issued_qty,
            asset_code: dropdownMapperData[element[0]["value"]]?.asset_code,
            equipmentID: dropdownMapperData[element[0]["value"]]?.asset_ID,
            asset_type_ID:
                dropdownMapperData[element[0]["value"]]?.asset_type_ID,
            requested_qty: int.tryParse(element[3]["value"] ?? '0'),
          );
          items.add(item);
        });
        CreateMrsModel editMrs = CreateMrsModel(
            ID: mrsId.value,
            isEditMode: 1,
            facility_ID: facilityId,
            setAsTemplate: _setTemp,
            activity: _activity,
            whereUsedType: whereUsedTypeName.value == "PMTASK" ? 27 : 4,
            whereUsedTypeId: int.tryParse(_wheredused),
            to_actor_id: int.tryParse(_wheredused),
            to_actor_type_id: to_actor_type_id.value,
            from_actor_id: facilityId,
            from_actor_type_id: fromActorTypeId.value,
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
  }
}
