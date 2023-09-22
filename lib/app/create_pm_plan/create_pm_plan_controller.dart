import 'dart:async';

import 'package:cmms/app/create_pm_plan/create_pm_plan_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/create_pm_plan_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../home/home_controller.dart';

class CreatePmPlanController extends GetxController {
  ///
  CreatePmPlanController(
    this.createPmPlanPresenter,
  );
  CreatePmPlanPresenter createPmPlanPresenter;
  final HomeController homecontroller = Get.find();

  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  int selectedPurchaseID = 0;
  bool openStartDatePicker = false;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  var startDateDateTc = TextEditingController();
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedInventory = ''.obs;
  Rx<bool> isSelectedInventory = true.obs;
  RxList<InventoryModel?> selectedInventoryNameList = <InventoryModel>[].obs;
  int selectedInventoryCategoryId = 0;
  RxList<InventoryModel?> filteredInventoryNameList = <InventoryModel>[].obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  //Equipment Name List
  RxList<InventoryModel?> inventoryNameList = <InventoryModel>[].obs;
  // RxList<InventoryModel?> filteredNameList = <InventoryModel>[].obs;
  RxList<int> selectedInventoryNameIdList = <int>[].obs;
  Map<dynamic, dynamic> inventory_map = {};

  var planTittleCtrlr = TextEditingController();
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        Future.delayed(Duration(seconds: 1), () {
          inventoryList(facilityId);
        });
        Future.delayed(Duration(seconds: 1), () {
          getInventoryCategoryList();
        });
        Future.delayed(Duration(seconds: 1), () {
          getFrequencyList();
        });
      });
    });

    super.onInit();
  }

  Future<void> inventoryList(int facilityId) async {
    inventoryNameList.value = <InventoryModel>[];
    final _equipmentNameList = await createPmPlanPresenter.inventoryList(
      isLoading: true,
      facilityId: facilityId,
    );
    if (_equipmentNameList != null) {
      for (var equipmentName in _equipmentNameList) {
        inventoryNameList.add(equipmentName);
      }
    }
  }

  Future<void> getFrequencyList() async {
    final list = await createPmPlanPresenter.getFrequencyList(isLoading: true);

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await createPmPlanPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  void facilityNameSelected(_selectedfacilityNameIds) {
    filteredInventoryNameList.value = <InventoryModel>[];
    // late int emp_id = 0;
    for (var _selectedfacilityNameId in _selectedfacilityNameIds) {
      selectedInventoryNameIdList.value = <int>[];

      selectedInventoryNameIdList.add(_selectedfacilityNameId);
      InventoryModel? e = inventoryNameList.firstWhere((element) {
        return element?.id == _selectedfacilityNameId;
      });
      filteredInventoryNameList.add(e);
    }
    print({"filteredInventoryNameList": filteredInventoryNameList});

    // inventory_map[emp_id] = selectedInventoryNameIdList;
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          //   for (var equipCat in selectedEquipmentCategoryList) {
          int equipCatIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          //  selectedEquipmentCategoryIdList.add(equipCatIndex);
          selectedInventoryCategoryId =
              equipmentCategoryList[equipCatIndex]?.id ?? 0;

          selectedInventory.value = value;

          // print('First Category Id:$selectedInventoryCategoryId');
          //  }
        }
        break;
      case RxList<InventoryModel>:
        {
          if (value != null) {
            for (var selectedItem in value) {
              int equipCatIndex =
                  inventoryNameList.indexWhere((x) => x?.name == selectedItem);
              if (equipCatIndex >= 0) {
                selectedInventoryNameIdList
                    .add(inventoryNameList[equipCatIndex]?.id ?? 0);
              }
            }
          }

          print('First Category Id:$selectedInventoryNameIdList');
          if (selectedInventoryNameIdList.length > 0) {
            facilityNameSelected(selectedInventoryNameIdList);
          }
        }
        break;
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
          selectedfrequency.value = value;
        }
        break;

      default:
        {}
        break;
    }

    // print({"selectedfrequency": selectedfrequency});
  }

  Future<void> createPmPlan() async {
    String _startDate = startDateDateTc.text.trim();
    String _plantitle = planTittleCtrlr.text.trim();

    List<AssetChecklist> mapAssetChecklist = [];
    // mapAssetChecklist = AssetChecklist(asset_id: 131086, checklist_id: 2988);

    CreatePmPlanModel createPmPlan = CreatePmPlanModel(
        plan_name: _plantitle,
        plan_date: _startDate,
        facility_id: facilityId,
        category_id:
            selectedInventoryCategoryId, // selectedEquipmentCategoryIdList,
        plan_freq_id: selectedfrequencyId,
        mapAssetChecklist: mapAssetChecklist);
    var createPmPlanJsonString = createPmPlan.toJson();

    print({"createPmPlanJsonString", createPmPlanJsonString});
    Map<String, dynamic>? responseCreatePmPlan =
        await createPmPlanPresenter.createPmPlan(
      createPmPlanJsonString: createPmPlanJsonString,
      isLoading: true,
    );
    if (responseCreatePmPlan == null) {
    } else {
      Get.offAllNamed(
        Routes.pmPlanList,
      );
    }
  }
}
