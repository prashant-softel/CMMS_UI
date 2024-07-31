import 'dart:async';

import 'package:cmms/app/create_mrs/create_mrs_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/create_mrs_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      final arguments = Get.arguments;
      if (arguments != null) {
        if (arguments.containsKey('whereUsedId')) {
          whereUsedTypeId.value = arguments['whereUsedId'];
        }
        if (arguments.containsKey('whereUsed')) {
          whereUsed.value = arguments['whereUsed'];
        }
        if (arguments.containsKey('to_actor_type_id')) {
          to_actor_type_id.value = arguments['to_actor_type_id'];
        }
        if (arguments.containsKey('type')) {
          type.value = arguments['type'];
        }
        if (arguments.containsKey('fromActorTypeId')) {
          fromActorTypeId.value = arguments['fromActorTypeId'];
        }
        if (arguments.containsKey('activity')) {
          activityCtrlr.text = arguments['activity'];
        }
        if (whereUsedTypeId != 0) {
          whereUsedCtrlr.text = whereUsedTypeId.toString();
        }
        facilityIdStreamSubscription =
            homecontroller.facilityId$.listen((event) {
          facilityId = event;
          Future.delayed(Duration(seconds: 1), () {
            if (facilityId > 0) {
              getEquipmentList(
                facilityId,
              );
            }
          });
        });
      }
    } catch (e) {
      print('jobModelError: $e');
    }

    super.onInit();
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
      );
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
