import 'dart:async';

import 'package:cmms/app/create_mrs_return/create_mrs_return_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/employe_stock_model.dart';
import '../home/home_controller.dart';

class CreateMrsReturnController extends GetxController {
  ///
  CreateMrsReturnController(
    this.createmrsReturnPresenter,
  );
  CreateMrsReturnPresenter createmrsReturnPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  // Rx<EmployeeStockListModel?> employeeStockList = EmployeeStockListModel().obs;
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
    final _assetList =
        await createmrsReturnPresenter.getCmmsItemList(facilityId: facilityId);
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

  // Future<void> createMrs() async {
  //   String _activity = activityCtrlr.text.trim();
  //   String _remark = remarkCtrlr.text.trim();

  //   Rx<DateTime> requestd_date = DateTime.now().obs;
  //   String formattedFromdate =
  //       DateFormat('yyyy-MM-dd').format(requestd_date.value);

  //   List<Equipments> items = [];
  //   rowItem.value.forEach((element) {
  //     Equipments item = Equipments(
  //       id: dropdownMapperData[element[0]["value"]]?.id,
  //       issued_qty: dropdownMapperData[element[0]["value"]]?.available_qty,
  //       asset_code: dropdownMapperData[element[0]["value"]]?.asset_code,
  //       equipmentID: dropdownMapperData[element[0]["value"]]?.asset_ID,
  //       asset_type_ID: dropdownMapperData[element[0]["value"]]?.asset_type_ID,
  //       approval_required: 1,
  //       requested_qty: int.tryParse(element[4]["value"] ?? '0'),
  //     );
  //     items.add(item);
  //   });
  //   CreateMrsModel createMrs = CreateMrsModel(
  //       ID: 0,
  //       isEditMode: 0,
  //       facility_ID: facilityId,
  //       setAsTemplate: "", //isSetTemplate == true ? 1 : 0,
  //       activity: _activity,
  //       //1 is job,2 is pm
  //       whereUsedType: 2,
  //       whereUsedTypeId: whereUsedTypeId,
  //       remarks: _remark,
  //       equipments: items);
  //   var createMrsJsonString = createMrs.toJson();

  //   print({"createMrsJsonString", createMrsJsonString});
  //   Map<String, dynamic>? responseCreateMrs =
  //       await createmrsReturnPresenter.createMrs(
  //     createMrsJsonString: createMrsJsonString,
  //     isLoading: true,
  //   );
  //   if (responseCreateMrs == null) {
  //   } else {
  //     Get.offAllNamed(
  //       Routes.mrsListScreen,
  //     );
  //   }
  // }
}
