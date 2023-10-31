import 'dart:async';

import 'package:cmms/app/create_pm_plan/create_pm_plan_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/create_pm_plan_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
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
  Rx<String> selectedChecklist = ''.obs;
  Rx<bool> isSelectedChecklist = true.obs;
  int selectedChecklistId = 0;
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
  Map<String, PreventiveCheckListModel> checkdropdownMapperData = {};

  var planTittleCtrlr = TextEditingController();
  RxList<PreventiveCheckListModel?> preventiveCheckList =
      <PreventiveCheckListModel?>[].obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;
  Rx<int> pmPlanId = 0.obs;
  Rx<PMPlanDetail?> pmPlanDetailsModel = PMPlanDetail().obs;

  @override
  void onInit() async {
    try {
      await setPmPlanId();
      if (pmPlanId.value != 0) {
        await getPmPlanDetails(pmPlanId: pmPlanId.value, isloading: true);
      }
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        //   Future.delayed(Duration(seconds: 1), () {

        Future.delayed(Duration(seconds: 1), () {
          getInventoryCategoryList();
        });
        Future.delayed(Duration(seconds: 1), () {
          getFrequencyList();
        });
        Future.delayed(Duration(seconds: 1), () {
          getAssignedToList();
        });
        //   });
      });
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> setPmPlanId() async {
    try {
      final _pmPlanId = await createPmPlanPresenter.getValue();

      if (_pmPlanId == null || _pmPlanId == '' || _pmPlanId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        pmPlanId.value = dataFromPreviousScreen['pmPlanId'];
        createPmPlanPresenter.saveValue(pmPlanId: pmPlanId.value.toString());
      } else {
        pmPlanId.value = int.tryParse(_pmPlanId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString() + 'pmPlanId');
    }
  }

  Future<void> getPmPlanDetails({int? pmPlanId, bool? isloading}) async {
    final _pmPlanDetailsModel = await createPmPlanPresenter.getPmPlanDetails(
        pmPlanId: pmPlanId, isLoading: isloading);

    if (_pmPlanDetailsModel != null) {
      planTittleCtrlr.text = _pmPlanDetailsModel.plan_name ?? "";
      startDateDateTc.text = _pmPlanDetailsModel.plan_date ?? "";
      selectedAssignedTo.value = _pmPlanDetailsModel.assign_to_name ?? "";
      selectedAssignedToId = _pmPlanDetailsModel.assign_to_id ?? 0;
      selectedfrequency.value = _pmPlanDetailsModel.plan_freq_name ?? "";
      selectedfrequencyId = _pmPlanDetailsModel.plan_freq_id ?? 0;
      selectedInventoryCategoryId = _pmPlanDetailsModel.category_id ?? 0;
      selectedInventory.value = _pmPlanDetailsModel.category_name ?? "";
      //filteredInventoryNameList.value = _pmPlanDetailsModel.mapAssetChecklist;
      _pmPlanDetailsModel.mapAssetChecklist?.forEach((element) {
        rowItem.value.add([
          {"key": "srNo", "value": ''},
          {"key": "assetName", "value": '${element.asset_name}'},
          {'key': "assetsId", "value": '${element.asset_id}'},
          {'key': "parentAsset", "value": '${element.parent_name}'},
          {'key': "qty", "value": '${element.module_qty}'},
          {
            'key': "checklist",
            "value": '${element.checklist_name}',
            "checkListId": '${element.checklist_id}'
          },
        ]);
      });
      //  pmPlanDetailsModel.value = _pmPlanDetailsModel;
    }
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList = await createPmPlanPresenter.getAssignedToList(
      facilityId: facilityId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
      // selectedAssignedTo.value =
      //     getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
    }
  }

  Future<void> inventoryList({int? facilityId, int? categoryId}) async {
    inventoryNameList.value = <InventoryModel>[];
    filteredInventoryNameList.value = <InventoryModel>[];
    // inventoryNameList.value = <InventoryModel>[];
    // selectedInventoryNameIdList.value = [];
    rowItem.value = [];
    preventiveCheckList.value = <PreventiveCheckListModel>[];
    final _equipmentNameList = await createPmPlanPresenter.inventoryList(
        isLoading: true, facilityId: facilityId, categoryId: categoryId);
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

  void addRowItem() {
    rowItem.value.add([
      {"key": "srNo", "value": ''},
      {"key": "assetName", "value": ''},
      {'key': "assetsId", "value": ''},
      {'key': "parentAsset", "value": ''},
      {'key': "qty", "value": ''},
      {'key': "checklist", "value": '', "checkListId": ''},
    ]);
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
    if (filteredInventoryNameList.length > 0) {
      filteredInventoryNameList.forEach((element) {
        rowItem.value.add([
          {
            "key": "srNo",
            "value": '',
          },
          {
            "key": "assetName",
            "value": '${element?.name}',
          },
          {
            'key': "assetsId",
            "value": '${element?.id}',
          },
          {
            'key': "parentAsset",
            "value": '${element?.parentName}',
          },
          {'key': "qty", "value": ''},
          {
            'key': "checklist",
            "value": '',
            "checkListId": '${selectedChecklistId}'
          },
        ]);
      });
    }
    // inventory_map[emp_id] = selectedInventoryNameIdList;
  }

  Future<void> getPreventiveCheckList(int facilityId, int type, bool isLoading,
      int frequencyid, int categoryId) async {
    preventiveCheckList.value = <PreventiveCheckListModel>[];
    final _preventiveCheckList =
        await createPmPlanPresenter.getPreventiveCheckListForPm(
            facilityId: facilityId,
            type: type,
            isLoading: isLoading,
            frequencyid: frequencyid,
            categoryId: categoryId);

    if (_preventiveCheckList != null) {
      for (var _frequencyList in _preventiveCheckList) {
        preventiveCheckList.add(_frequencyList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipCatIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedInventoryCategoryId =
              equipmentCategoryList[equipCatIndex]?.id ?? 0;

          // selectedInventory.value = value;
          // filteredInventoryNameList.value = <InventoryModel>[];
          // inventoryNameList.value = <InventoryModel>[];
          // selectedInventoryNameIdList.value = [];
          // rowItem.value = [];
          preventiveCheckList.value = <PreventiveCheckListModel>[];
          selectedInventoryNameList.value = <InventoryModel>[];
          Future.delayed(Duration(seconds: 1), () {
            inventoryList(
                facilityId: facilityId,
                categoryId: selectedInventoryCategoryId);
          });
        }
        break;
      case RxList<InventoryModel>:
        {
          // filteredInventoryNameList.value = <InventoryModel>[];
          // inventoryNameList.value = <InventoryModel>[];
          // selectedInventoryNameIdList.value = [];
          rowItem.value = [];
          preventiveCheckList.value = <PreventiveCheckListModel>[];
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
            filteredInventoryNameList.value = <InventoryModel>[];

            facilityNameSelected(selectedInventoryNameIdList);
          }
          Future.delayed(Duration(seconds: 2), () {
            if (selectedInventoryCategoryId > 0 && selectedfrequencyId > 0) {
              getPreventiveCheckList(facilityId, 1, true, selectedfrequencyId,
                  selectedInventoryCategoryId);
            }
          });
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
      case RxList<PreventiveCheckListModel>:
        {
          int checklistIndex =
              preventiveCheckList.indexWhere((x) => x?.name == value);
          selectedChecklistId = preventiveCheckList[checklistIndex]?.id ?? 0;
          selectedChecklist.value =
              preventiveCheckList[checklistIndex]?.name ?? "";
        }
        break;
      case RxList<EmployeeModel>:
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId > 0) {
            isAssignedToSelected.value = true;
          }
          selectedAssignedTo.value = value;
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
    rowItem.value.forEach((element) {
      AssetChecklist item = AssetChecklist(
          asset_name: "",
          checklist_name: "",
          module_qty: 0,
          parent_id: 0,
          parent_name: "",
          asset_id: int.tryParse(element[2]["value"] ?? '0'),
          checklist_id: checkdropdownMapperData[element[5]["value"]]?.id);
      mapAssetChecklist.add(item);
    });
    CreatePmPlanModel createPmPlan = CreatePmPlanModel(
        plan_name: _plantitle,
        plan_date: _startDate,
        facility_id: facilityId,
        assigned_to_id: selectedAssignedToId,
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
