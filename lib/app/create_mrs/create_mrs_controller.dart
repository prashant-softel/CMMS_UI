import 'dart:async';

import 'package:cmms/app/create_mrs/create_mrs_presenter.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/create_mrs_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
  Rx<bool> isFormInvalid = false.obs;

  RxList<GetAssetItemsModel?> assetItemList = <GetAssetItemsModel>[].obs;
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;

  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;

  var activityCtrlr = TextEditingController();
  var remarkCtrlr = TextEditingController();
  var whereUsedCtrlr = TextEditingController();
  var setTemlateCtrlr = TextEditingController();
  RxList<String> removedMaterials = <String>[].obs;
  RxMap<String, bool> errorState = <String, bool>{}.obs;
  // int whereUsedTypeId = 0;
  var isSetTemplate = false.obs;
  Rx<int> whereUsedTypeId = 0.obs;
  Rx<int> whereUsed = 0.obs;
  Rx<int> type = 0.obs;
  Rx<int> jobId = 0.obs;

  Rx<int> fromActorTypeId = 0.obs;
  Rx<int> to_actor_type_id = 0.obs;

  // int? jcId = 0;

  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    try {
      await setMrs();

      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 1), () {
          if (facilityId > 0) {
            getEquipmentList(
              facilityId,
            );
          }
        });
      });
    } catch (e) {
      print('jobModelError: $e');
    }

    super.onInit();
  }

  Future<void> setMrs() async {
    final String? _whereUsedTypeId = Get.parameters['whereUsedId'];
    final String? _whereUsed = Get.parameters['whereUsed'];
    final String? _to_actor_type_id = Get.parameters['to_actor_type_id'];
    final String? _type = Get.parameters['type'];
    final String? _fromActorTypeId = Get.parameters['fromActorTypeId'];
    final String? _activityCtrlr = Get.parameters['activity'];
    final String? _jbId = Get.parameters['jobId'];

    whereUsedTypeId.value = int.tryParse(_whereUsedTypeId ?? "") ?? 0;
    whereUsed.value = int.tryParse(_whereUsed ?? "") ?? 0;
    to_actor_type_id.value = int.tryParse(_to_actor_type_id ?? "") ?? 0;
    fromActorTypeId.value = int.tryParse(_fromActorTypeId ?? "") ?? 0;
    activityCtrlr.text = _activityCtrlr ?? "";

    type.value = int.tryParse(_type ?? "") ?? 0;
    jobId.value = int.tryParse(_jbId ?? "") ?? 0;

    whereUsedCtrlr.text = whereUsedTypeId.toString();

    // try {
    //   final _whereUsedTypeId = await createMrsPresenter.getUsedTypeIdValue();
    //   final _whereUsed = await createMrsPresenter.getwhereUsedValue();
    //   final _to_actor_type_id = await createMrsPresenter.getToActortypeValue();
    //   final _type = await createMrsPresenter.getTypeValue();
    //   final _fromActorTypeId = await createMrsPresenter.getFromActorIdValue();
    //   final _activityCtrlr = await createMrsPresenter.getActivityValue();

    //   if (_whereUsedTypeId == null ||
    //       _whereUsedTypeId == '' ||
    //       _whereUsedTypeId == "null") {
    //     var dataFromPreviousScreen = Get.arguments;
    //     if (dataFromPreviousScreen != null) {
    //       if (dataFromPreviousScreen.containsKey('whereUsedId')) {
    //         whereUsedTypeId.value = dataFromPreviousScreen['whereUsedId'];
    //         createMrsPresenter.saveUsedTypeIdValue(
    //             whereUsedTypeId: whereUsedTypeId.value.toString());

    //         whereUsedCtrlr.text = whereUsedTypeId.toString();
    //       }
    //       if (dataFromPreviousScreen.containsKey('whereUsed')) {
    //         whereUsed.value = dataFromPreviousScreen['whereUsed'];
    //         createMrsPresenter.savewhereUsedValue(
    //             whereUsed: whereUsed.value.toString());
    //       }
    //       if (dataFromPreviousScreen.containsKey('to_actor_type_id')) {
    //         to_actor_type_id.value = dataFromPreviousScreen['to_actor_type_id'];
    //         createMrsPresenter.saveToActortypeValue(
    //             to_actor_type_id: to_actor_type_id.value.toString());
    //       }
    //       if (dataFromPreviousScreen.containsKey('type')) {
    //         type.value = dataFromPreviousScreen['type'];
    //         createMrsPresenter.saveTypeValue(type: type.value.toString());
    //       }
    //       if (dataFromPreviousScreen.containsKey('fromActorTypeId')) {
    //         fromActorTypeId.value = dataFromPreviousScreen['fromActorTypeId'];
    //         createMrsPresenter.saveFromActorIdValue(
    //             fromActorTypeId: fromActorTypeId.value.toString());
    //       }
    //       if (dataFromPreviousScreen.containsKey('activity')) {
    //         activityCtrlr.text = dataFromPreviousScreen['activity'];
    //         createMrsPresenter.saveActivityValue(
    //             activityCtrlr: activityCtrlr.text.toString());
    //       }
    //     }
    //   } else {
    //     whereUsedTypeId.value = int.tryParse(_whereUsedTypeId) ?? 0;
    //     whereUsed.value = int.tryParse(_whereUsed ?? "") ?? 0;
    //     to_actor_type_id.value = int.tryParse(_to_actor_type_id ?? "") ?? 0;
    //     type.value = int.tryParse(_type ?? "") ?? 0;
    //     fromActorTypeId.value = int.tryParse(_fromActorTypeId ?? "") ?? 0;
    //     activityCtrlr.text = _activityCtrlr ?? "";
    //     whereUsedCtrlr.text = whereUsedTypeId.toString();
    //   }
    //  await _flutterSecureStorage.delete(key: "scheduleId");
    // } catch (e) {
    //   Utility.showDialog(e.toString(), 'scheduleId');
    // }
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

  Future<void> getEquipmentList(int _facilityId) async {
    assetItemList.value = <GetAssetItemsModel>[];
    final _assetList =
        await createMrsPresenter.getEquipmentList(facilityId: facilityId);
    if (_assetList != null) {
      assetItemList.clear();
      for (var asset in _assetList) {
        assetItemList.add(asset);
      }
      //

      update(["AssetList"]);
    }
    // assetItemList.value = [];
    //addRowItem();
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
    }
    // else {
    //   isFormInvalid.value == false;
    // }
  }

  void clearStoreData() {
    createMrsPresenter.clearValue();
  }

  Future<void> createMrs() async {
    // try {
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

      List<Equipments> items = [];
      rowItem.forEach((element) {
        Equipments item = Equipments(
          id: dropdownMapperData[element[0]["value"]]?.id,
          available_qty: dropdownMapperData[element[0]["value"]]?.available_qty,

          issued_qty:
              0, // dropdownMapperData[element[0]["value"]]?.available_qty,
          asset_code: dropdownMapperData[element[0]["value"]]?.asset_code,
          serial_number: dropdownMapperData[element[0]["value"]]?.serial_number,

          equipmentID: dropdownMapperData[element[0]["value"]]?.asset_ID,
          asset_type_ID: dropdownMapperData[element[0]["value"]]?.asset_type_ID,
          requested_qty: int.tryParse(element[3]["value"] ?? '0'),
        );
        items.add(item);
      });
      CreateMrsModel createMrs = CreateMrsModel(
          ID: 0,
          isEditMode: 0,
          facility_ID: facilityId,
          setAsTemplate: _setTemp, //isSetTemplate == true ? 1 : 0,
          activity: _activity,
          whereUsedType: whereUsed.value,
          whereUsedTypeId: whereUsedTypeId.value,
          to_actor_id: whereUsedTypeId.value,
          to_actor_type_id: to_actor_type_id.value,
          from_actor_id: facilityId,
          //whereUsed.value,
          from_actor_type_id: fromActorTypeId.value,
          remarks: _remark,
          equipments: items);
      var createMrsJsonString = createMrs.toJson();

      print({"createMrsJsonString", createMrsJsonString});
      Map<String, dynamic>? responseCreateMrs =
          await createMrsPresenter.createMrs(
              createMrsJsonString: createMrsJsonString,
              type: type.value,
              isLoading: true,
              route: type.value == 2 ? whereUsedTypeId.value : jobId.value);
      // if (responseCreateMrs == null) {
      // } else {
      //   Get.offAllNamed(
      //     Routes.mrsListScreen,
      //   );
      // }
      // } catch (e) {
      //   print(e);
      // }
    }
  }
}
