import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class ModuleCleaningPlanningController extends GetxController {
  ///
  ModuleCleaningPlanningController(
    this.moduleCleaningPlanningPresenter,
  );
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  var startDateTc = TextEditingController();
  bool openStartDatePicker = false;
  int facilityId = 0;
  Rx<String> selectedBlock = ''.obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  ModuleCleaningPlanningPresenter moduleCleaningPlanningPresenter;
  final HomeController homecontroller = Get.find();

  ///
  @override
  void onInit() async {
    getFrequencyList();
    super.onInit();
  }

  void switchFacility(String? facilityName) {
    facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
  }

  Future<void> getFrequencyList() async {
    final list = await moduleCleaningPlanningPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await moduleCleaningPlanningPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }
}
