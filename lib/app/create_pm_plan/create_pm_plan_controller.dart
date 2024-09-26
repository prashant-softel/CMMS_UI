import 'dart:async';

import 'package:cmms/app/create_pm_plan/create_pm_plan_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/create_pm_plan_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  Rx<List<List<Map<String, String>>>> bufferRowItem =
      Rx<List<List<Map<String, String>>>>([]);

  Rx<bool> isPMTitleInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  int selectedPurchaseID = 0;
  bool openStartDatePicker = false;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  var startDateDateTc = TextEditingController();
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  Rx<bool> isStartdateInvalid = false.obs;

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
  RxList<InventoryModel> selectedInventoryNameList = <InventoryModel>[].obs;
  int selectedInventoryCategoryId = 0;
  RxList<InventoryModel> filteredInventoryNameList = <InventoryModel>[].obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  //Equipment Name List
  RxList<InventoryModel> inventoryNameList = <InventoryModel>[].obs;
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

      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        if (pmPlanId.value != 0) {
          Future.delayed(Duration(seconds: 1), () {
            getPmPlanDetails(
                pmPlanId: pmPlanId.value,
                isloading: true,
                facilityId: facilityId);
          });
        }

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
      // Utility.showDialog(e.toString() + 'pmPlanId');
    }
  }

  void clearStoreData() {
    createPmPlanPresenter.clearValue();
  }

  Future<void> getPmPlanDetails(
      {int? pmPlanId, bool? isloading, required int facilityId}) async {
    final _pmPlanDetailsModel = await createPmPlanPresenter.getPmPlanDetails(
        facilityId: facilityId, pmPlanId: pmPlanId, isLoading: isloading);

    if (_pmPlanDetailsModel != null) {
      selectedInventoryNameIdList.value = [];
      planTittleCtrlr.text = _pmPlanDetailsModel.plan_name ?? "";
      startDateDateTc.text = _pmPlanDetailsModel.plan_date ?? "";
      selectedAssignedTo.value = _pmPlanDetailsModel.assign_to_name ?? "";
      selectedAssignedToId = _pmPlanDetailsModel.assign_to_id ?? 0;
      selectedfrequency.value = _pmPlanDetailsModel.plan_freq_name ?? "";
      selectedfrequencyId = _pmPlanDetailsModel.plan_freq_id ?? 0;
      selectedInventoryCategoryId = _pmPlanDetailsModel.category_id ?? 0;
      selectedInventory.value = _pmPlanDetailsModel.category_name ?? "";
      if (selectedInventoryCategoryId > 0) {
        await inventoryList(
            facilityId: _pmPlanDetailsModel.facility_id,
            categoryId: selectedInventoryCategoryId);
        await getPreventiveCheckList(_pmPlanDetailsModel.facility_id ?? 0, 1,
            true, selectedfrequencyId, selectedInventoryCategoryId);
        // selectedInventoryNameList

        selectedInventoryNameList.value = [];
        rowItem.value = [];

        _pmPlanDetailsModel.mapAssetChecklist?.forEach((element) {
          InventoryModel? inventoryModel = inventoryNameList.firstWhere(
            (e) => e.id == element.id,
            // orElse: () => null,
          );
          print("hsdfbhjgfhsbgfhdsbshj");
          if (preventiveCheckList != null) {
            selectedInventoryNameList.value.add(inventoryModel);
            rowItem.value.add([
              {"key": "assetName", "value": '${element.name}'},
              {'key': "assetsId", "value": '${element.id}'},
              {'key': "parentAsset", "value": '${element.parentName}'},
              {'key': "qty", "value": '${element.module_qty}'},
              {
                'key': "checklist",
                "value": '${element.checklist_name}',
                "id": '${element.checklist_id}'
              },
            ]);
            checkdropdownMapperData[element.checklist_name ?? ""] =
                preventiveCheckList.firstWhere(
                    (e) => e?.name == element.checklist_name,
                    orElse: null)!;
          }
        });
      }

      //  pmPlanDetailsModel.value = _pmPlanDetailsModel;
    }
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList =
        await createPmPlanPresenter.getAssignedToListWOAttend(
            facilityId: facilityId,
            featureId: UserAccessConstants.kPmTaskFeatureId,
            isattendanceneeded: 0);

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
      // selectedAssignedTo.value =
      //     getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
    }
  }

  Future<void> inventoryList({int? facilityId, int? categoryId}) async {
    inventoryNameList.value = []; //<InventoryModel?>[];
    filteredInventoryNameList.value = []; //<InventoryModel>[];
    // inventoryNameList.value = <InventoryModel>[];
    // selectedInventoryNameIdList.value = [];
    rowItem.value = [];
    preventiveCheckList.value = <PreventiveCheckListModel?>[];
    final _equipmentNameList = await createPmPlanPresenter.inventoryList(
        isLoading: true, facilityId: facilityId, categoryId: categoryId);
    if (_equipmentNameList != null) {
      for (var equipmentName in _equipmentNameList) {
        inventoryNameList.add(equipmentName!);
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
    // filteredInventoryNameList.value = <InventoryModel>[];
    // late int emp_id = 0;
    for (var _selectedfacilityNameId in _selectedfacilityNameIds) {
      InventoryModel? e = inventoryNameList.firstWhere(
        (element) {
          return element.id == _selectedfacilityNameId;
        },
        // orElse: () => null,
      );
      filteredInventoryNameList.add(e);
    }
    print({"filteredInventoryNameList": filteredInventoryNameList});
    if (filteredInventoryNameList.length > 0) {
      filteredInventoryNameList.forEach((element) {
        var aa = bufferRowItem.value
                .firstWhereOrNull((i) => i[1]["value"] == '${element.id}') ??
            [];

        rowItem.value.add([
          {
            "key": "assetName",
            "value": '${element.name}',
          },
          {
            'key': "assetsId",
            "value": '${element.id}',
          },
          {
            'key': "parentAsset",
            "value": '${element.parentName}',
          },
          {'key': "qty", "value": ''},
          {
            'key': "checklist",
            "value": (aa.length > 0 ? '${aa[4]["value"]}' : ''),
            "id": (aa.length > 0 ? '${aa[4]["id"]}' : '')
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
      case const (RxList<InventoryCategoryModel>):
        {
          if (value != "Please Select") {
            int equipCatIndex =
                equipmentCategoryList.indexWhere((x) => x?.name == value);
            selectedInventoryCategoryId =
                equipmentCategoryList[equipCatIndex]?.id ?? 0;
            isSelectedInventory.value = true;
            selectedInventory.value = value;
            filteredInventoryNameList.value = <InventoryModel>[];
            // inventoryNameList.value = <InventoryModel>[];
            // selectedInventoryNameIdList.value = [];
            rowItem.value = [];
            preventiveCheckList.value = <PreventiveCheckListModel>[];
            selectedInventoryNameIdList.value = [];

            if (pmPlanId == 0) {
              selectedInventoryNameList.value = [];
            }
            Future.delayed(Duration(seconds: 1), () {
              inventoryList(
                  facilityId: facilityId,
                  categoryId: selectedInventoryCategoryId);
            });
            Future.delayed(Duration(seconds: 2), () {
              if (selectedInventoryCategoryId > 0 && selectedfrequencyId > 0) {
                getPreventiveCheckList(facilityId, 1, true, selectedfrequencyId,
                    selectedInventoryCategoryId);
              }
            });
          } else {
            selectedInventoryCategoryId = 0;
          }
        }
        break;
      case const (RxList<InventoryModel>):
        {
          if (value != "Please Select") {
            filteredInventoryNameList.value = <InventoryModel>[];
            // inventoryNameList.value = <InventoryModel>[];
            // selectedInventoryNameIdList.value = [];
            bufferRowItem.value = rowItem.value;
            rowItem.value = [];
            // preventiveCheckList.value = <PreventiveCheckListModel>[];
            selectedInventoryNameIdList.value = [];

            if (value != null) {
              for (var selectedItem in value) {
                int equipCatIndex =
                    inventoryNameList.indexWhere((x) => x.name == selectedItem);
                if (equipCatIndex >= 0) {
                  selectedInventoryNameIdList
                      .add(inventoryNameList[equipCatIndex].id ?? 0);
                }
              }
            }

            print('First Category Id:$selectedInventoryNameIdList');
            if (selectedInventoryNameIdList.length > 0) {
              //  filteredInventoryNameList.value = <InventoryModel>[];

              facilityNameSelected(selectedInventoryNameIdList);
            }
          } else {
            // selectedInventoryNameIdList=0;
          }
        }
        break;
      case const (RxList<FrequencyModel>):
        {
          if (value != "Please Select") {
            int frequencyIndex =
                frequencyList.indexWhere((x) => x?.name == value);
            selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
            selectedfrequency.value = value;
            isSelectedfrequency.value = true;
            Future.delayed(Duration(seconds: 2), () {
              if (selectedInventoryCategoryId > 0 && selectedfrequencyId > 0) {
                getPreventiveCheckList(facilityId, 1, true, selectedfrequencyId,
                    selectedInventoryCategoryId);
              }
            });
          } else {
            selectedInventoryCategoryId = 0;
          }
        }
        break;
      case const (RxList<PreventiveCheckListModel>):
        {
          if (value != "Please Select") {
            int checklistIndex =
                preventiveCheckList.indexWhere((x) => x?.name == value);
            selectedChecklistId = preventiveCheckList[checklistIndex]?.id ?? 0;
            selectedChecklist.value =
                preventiveCheckList[checklistIndex]?.name ?? "";
            isSelectedChecklist.value = true;
          } else {
            selectedChecklistId = 0;
          }
        }
        break;
      case const (RxList<EmployeeModel>):
        {
          if (value != "Please Select") {
            int assignedToIndex =
                assignedToList.indexWhere((x) => x?.name == value);
            selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
            if (selectedAssignedToId > 0) {
              isAssignedToSelected.value = true;
            }
            selectedAssignedTo.value = value;
          } else {
            selectedAssignedToId = 0;
          }
        }
        break;
      default:
        {}
        break;
    }

    // print({"selectedfrequency": selectedfrequency});
  }

  Future<void> createPmPlan() async {
    checkForm();
    if (isFormInvalid.value) {
      return;
    }
    String _startDate = startDateDateTc.text.trim();
    String _plantitle = planTittleCtrlr.text.trim();

    List<AssetChecklist> mapAssetChecklist = [];
    // mapAssetChecklist = AssetChecklist(asset_id: 131086, checklist_id: 2988);
    rowItem.value.forEach((element) {
      AssetChecklist item = AssetChecklist(
          name: "",
          checklist_name: "",
          module_qty: 0,
          parent_id: 0,
          parent_name: "",
          asset_id: int.tryParse(element[1]["value"] ?? '0'),
          checklist_id: checkdropdownMapperData[element[4]["value"]]?.id);
      mapAssetChecklist.add(item);
    });
    CreatePmPlanModel createPmPlan = CreatePmPlanModel(
        plan_id: 0,
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

  Future<void> updatePmPlan() async {
    checkForm();
    if (isFormInvalid.value) {
      return;
    }
    String _startDate = startDateDateTc.text.trim();
    String _plantitle = planTittleCtrlr.text.trim();

    List<AssetChecklist> mapAssetChecklist = [];
    // mapAssetChecklist = AssetChecklist(asset_id: 131086, checklist_id: 2988);
    rowItem.value.forEach((element) {
      print({"object34534", element[4]["id"]});
      AssetChecklist item = AssetChecklist(
          name: "",
          checklist_name: "",
          module_qty: 0,
          parent_id: 0,
          parent_name: "",
          asset_id: int.tryParse(element[1]["value"] ?? '0'),
          checklist_id: checkdropdownMapperData[element[4]["value"]]?.id ?? 0);
      mapAssetChecklist.add(item);
    });
    CreatePmPlanModel createPmPlan = CreatePmPlanModel(
        plan_id: pmPlanId.value,
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
        await createPmPlanPresenter.updatePmPlan(
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

  void checkForm() {
    if (selectedInventory == '') {
      isSelectedInventory.value = false;
      isFormInvalid.value = true;
    }
    if (selectedInventoryNameList == []) {
      Fluttertoast.showToast(msg: "Please select the Equipments!");
      inventoryNameList == false.obs;
      isFormInvalid.value = true;
    }
    if (selectedfrequency == '') {
      isSelectedfrequency.value = false;
      isFormInvalid.value = true;
    }
    if (selectedAssignedTo == '') {
      isAssignedToSelected.value = false;
      isFormInvalid.value = true;
    }
    if (startDateDateTc.text.trim().length < 3) {
      isStartdateInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (planTittleCtrlr.text.trim().length < 3) {
      isPMTitleInvalid.value = true;
      isFormInvalid.value = true;
    }
  }
}
