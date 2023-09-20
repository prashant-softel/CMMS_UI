import 'dart:async';

import 'package:cmms/app/create_pm_plan/create_pm_plan_presenter.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
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
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  int selectedInventoryCategoryId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        Future.delayed(Duration(seconds: 1), () {
          getAssetList(facilityId);
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

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList = await createPmPlanPresenter.getAssetList(
        facilityId: facilityId, isLoading: true);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
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

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex =
                equipmentCategoryList.indexWhere((x) => x?.name == value);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
            // selectedInventoryCategoryId = equipmentCategoryList[equipCatIndex]?.id ?? 0;
            print('First Category Id:$selectedInventoryCategoryId');
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

    print({"selectedfrequency": selectedfrequency});
  }
}
