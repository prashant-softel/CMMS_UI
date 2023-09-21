import 'dart:async';

import 'package:cmms/app/create_pm_plan/create_pm_plan_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
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

  var planTittleCtrlr = TextEditingController();
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

    // print({"selectedfrequency": selectedfrequency});
  }

  Future<void> createPmPlan() async {
    String _startDate = startDateDateTc.text.trim();
    String _plantitle = planTittleCtrlr.text.trim();
    // List<Equipments> items = [];
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
    // CreatePmPlanModel createPmPlan = CreatePmPlanModel(
    //     ID: 0,
    //     isEditMode: 0,
    //     facility_ID: facilityId,
    //     setAsTemplate: _setTemp, //isSetTemplate == true ? 1 : 0,
    //     activity: _activity,
    //     //1 is job,2 is pm
    //     whereUsedType: whereUsed.value,
    //     whereUsedTypeId: whereUsedTypeId.value,
    //     remarks: _remark,
    //     equipments: items);
    var createPmPlanJsonString = //createPmPlan.toJson();
        {
      "plan_name": _plantitle, //"Risen Wind SCB PM Plan",
      "plan_date": _startDate, //"2023-09-14",
      "facility_id": facilityId,
      "category_id": 2, // selectedEquipmentCategoryIdList,
      "plan_freq_id": selectedfrequencyId,
      "mapAssetChecklist": [
        {"asset_id": 131086, "checklist_id": 2988},
        {"asset_id": 131085, "checklist_id": 2988}
      ]
    };

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
