import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/equipment_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/inventory_model.dart';
import '../home/home_controller.dart';
import 'caliobration_detail_presenter.dart';

class CalibrationDetailController extends GetxController {
  ///
  CalibrationDetailController(
    this.calibrationDetailPresenter,
  );
  CalibrationDetailPresenter calibrationDetailPresenter;
  final HomeController homecontroller = Get.find();

  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  int selectedEquipmentId = 0;

  RxList<EquipmentModel?> equipmentModelList = <EquipmentModel>[].obs;
  RxList<int> selectedEquipmentList = <int>[].obs;
  Rx<bool> isInventorySelected = true.obs;
  RxList<InventoryModel?> inventoryNameList = <InventoryModel>[].obs;
  Rx<String> selectedInventory = ''.obs;
  TextEditingController lastCalibrationDateController =
      TextEditingController(text: "");
  TextEditingController calibrationDaneDateController =
      TextEditingController(text: "");
  TextEditingController recievedDateController =
      TextEditingController(text: "");
  var isToggleOn = false.obs;

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getequipmentNameList();

    super.onInit();
  }

  Future<void> getInventoryCategoryList() async {
    final list = await calibrationDetailPresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }

  // void getequipmentNameList() async {
  //   inventoryNameList.value = <InventoryModel>[];
  //   final _inventoryList =
  //       await calibrationDetailPresenter.getequipmentNameList(
  //     isLoading: true,
  //   );
  //   if (_inventoryList != null) {
  //     for (var inventory_list in _inventoryList) {
  //       inventoryNameList.add(inventory_list);
  //     }
  //   }
  // }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }
}
