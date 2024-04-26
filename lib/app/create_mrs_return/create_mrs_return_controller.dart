import 'dart:async';

import 'package:cmms/app/create_mrs_return/create_mrs_return_presenter.dart';
import 'package:cmms/domain/models/create_return_mrs_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/transaction_report_list_model.dart';
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
  RxList<PlantStockListModel?> assetItemList = <PlantStockListModel?>[].obs;
  RxList<StockDetails?> StockDetailsList = <StockDetails?>[].obs;

  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;

  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  var activityCtrlr = TextEditingController();
  var remarkCtrlr = TextEditingController();
  var whereUsedCtrlr = TextEditingController();
  var setTemlateCtrlr = TextEditingController();

  Rx<int> whereUsedTypeId = 0.obs;
  Rx<String> activity = ''.obs;
  Rx<int> whereUsed = 0.obs;
  Rx<int> fromActorTypeId = 0.obs;
  Rx<int> to_actor_type_id = 0.obs;
  Rx<int> mrsId = 0.obs;
  var isToggleOn = false.obs;

  var isSetTemplate = false.obs;

  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    await setId();
    //   whereUsedTypeId = Get.arguments;
    if (whereUsedTypeId.value != 0) {
      whereUsedCtrlr.text = whereUsedTypeId.value.toString();
      activityCtrlr.text = activity.value;
    }
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (mrsId > 0) {
        Future.delayed(Duration(seconds: 1), () {
          getCmmsItemList(
            facilityId,
          );
        });
      }
    });
    super.onInit();
  }

  Future<void> setId() async {
    try {
      // final _whereUsedTypeId = await createmrsReturnPresenter.getValue();
      // final _activity = await createmrsReturnPresenter.getactivityValue();

      // if (_whereUsedTypeId == null ||
      //     _whereUsedTypeId == '' ||
      //     _whereUsedTypeId == "null") {
      var dataFromPreviousScreen = Get.arguments;

      activity.value = dataFromPreviousScreen['activity'];
      whereUsedTypeId.value = dataFromPreviousScreen['pmTaskId'];
      whereUsed.value = dataFromPreviousScreen['whereUsed'];
      fromActorTypeId.value = dataFromPreviousScreen['fromActorTypeId'];
      to_actor_type_id.value = dataFromPreviousScreen['to_actor_type_id'];
      mrsId.value = dataFromPreviousScreen['mrsId'];

      createmrsReturnPresenter.saveValue(
          whereUsedTypeId: whereUsedTypeId.value.toString());
      createmrsReturnPresenter.saveactivityValue(
          activity: activity.value.toString());
      // } else {
      //   whereUsedTypeId.value = int.tryParse(_whereUsedTypeId) ?? 0;
      //   activity.value = _activity ?? "";
      // }
    } catch (e) {
      print(e.toString() + 'goId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getCmmsItemList(int _facilityId) async {
    int userId = varUserAccessModel.value.user_id ?? 0;

    final _assetList = await createmrsReturnPresenter.getCmmsItemList(
        facilityId: facilityId,
        actorType: fromActorTypeId.value,
        actorID: whereUsedTypeId.value,
        isLoading: false,
        mrsId: mrsId.value);
    if (_assetList != null) {
      for (var facility in _assetList) {
        for (var stockDetail in facility!.stockDetails) {
          StockDetailsList.add(stockDetail);
          //  StockDetailsList.value = facility?.stockDetails ?? [];
        }
      }

      // assetItemList.value = _assetList.s ?? [];
      //

      update(["AssetList"]);
    }

    addRowItem();
  }

  void addRowItem() {
    rowItem.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Issue_Qty", "value": ''},
      {'key': "Used_Qty", "value": ''},
      {'key': "Return_Qty", "value": ''},
      {'key': "is_faulty", "value": ''},
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
    rowItem.forEach((element) {
      CmmsItem item = CmmsItem(
        asset_item_ID:
            dropdownMapperData.value[element[0]["value"]]?.assetItemID,
        issued_qty: dropdownMapperData.value[element[0]["value"]].issued_qty,
        returned_qty: int.tryParse(element[3]["value"] ?? '0'),
        requested_qty: 0,
        approval_required: 0,
        is_faulty: element[4]["value"] == "" || element[4]["value"] == null
            ? 0
            : int.tryParse(element[4]["value"] ?? "0"),
        return_remarks: element[5]["value"] ?? '0',
      );
      items.add(item);
    });
    CreateReturnMrsModel createMrs = CreateReturnMrsModel(
        ID: 0,
        facility_ID: facilityId,
        setAsTemplate: "", //isSetTemplate == true ? 1 : 0,
        activity: _activity,
        //1 is job,2 is pm
        whereUsedType: whereUsed.value,
        whereUsedTypeId: whereUsedTypeId.value,
        to_actor_id: whereUsedTypeId.value,
        to_actor_type_id: to_actor_type_id.value,
        from_actor_type_id: fromActorTypeId.value,
        from_actor_id: facilityId,
        remarks: _remark,
        cmmrsItems: items);
    var createReturnMrsJsonString = createMrs.toJson();

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

  void toggle(bool value) {
    isToggleOn.value = value;
  }
}
