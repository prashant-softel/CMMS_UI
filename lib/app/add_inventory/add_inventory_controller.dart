import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/add_inventory/add_inventory_presenter.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_status_list_model.dart';
import 'package:cmms/domain/models/inventory_type_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/warranty_type_model.dart';
import 'package:cmms/domain/models/warranty_usage_term_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class AddInventoryController extends GetxController {
  AddInventoryController(this.addInventoryPresenter);
  AddInventoryPresenter addInventoryPresenter;

  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;
  final HomeController homeController = Get.find();
  bool openLastCalibrationDatePicker = false;
  var lastCalibrationDateTc = TextEditingController();
  var calibrationRemainderInTc = TextEditingController();
  bool openExpiryDatePicker = false;
  bool openStartDatePicker = false;
  var expireDateTc = TextEditingController();
  var startDateTc = TextEditingController();

  //Permit Type list
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  //FrequencyModel
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;

  //Inventory Type list
  RxList<TypePermitModel?> InventoryTypeList = <TypePermitModel>[].obs;
  Rx<bool> isInventoryTypeSelected = true.obs;
  Rx<String> selectedInventoryType = ''.obs;
  Rx<String> selectedInventoryOfType = ''.obs;
  Rx<bool> isInventoryType = true.obs;

//CategoryModel
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedEquipmentCategoryName = ''.obs;
  Rx<bool> isEquipmentCategoryNameSelected = true.obs;

  ///Equipment name List
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedEquipmentName = ''.obs;
  Rx<bool> isEquipmentNameSelected = true.obs;
  int selectedEquipmentnameId = 0;

  ///status list
  RxList<InventoryStatusListModel?> statusNameList =
      <InventoryStatusListModel>[].obs;
  Rx<String> selectedStatusName = ''.obs;
  Rx<bool> isStatusNameSelected = true.obs;
  int selectedStatusNameId = 0;

  ///type of inventroy
  RxList<InventoryTypeListModel?> typeNameList = <InventoryTypeListModel>[].obs;
  Rx<String> selectedTypeName = ''.obs;
  Rx<bool> isTypeNameSelected = true.obs;
  int selectedTypeNameId = 0;

  ///warrany
  ///
  RxList<WarrantyTypeModel?> warrantyNameList = <WarrantyTypeModel>[].obs;
  Rx<String> selectedWarrantyName = ''.obs;
  Rx<bool> isWarrentyNameSelected = true.obs;
  int selectedWarrentyNameId = 0;

  ///WarrantyUsageTermList
  RxList<WarrantyUsageTermListModel?> warrantyUsageTermNameList =
      <WarrantyUsageTermListModel>[].obs;
  Rx<String> selectedwarrantyUsageTermListName = ''.obs;
  Rx<bool> iswarrantyUsageTermNameSelected = true.obs;
  int selectedwarrantyUsageTermNameId = 0;

  ///Parent Equipment
  var parentEquipmentList = <DropdownModel>[];
  DropdownModel? parentEquipmentDropdownValue;

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<BlockModel?> blocksList = <BlockModel>[].obs;
  Rx<bool> isBlocksSelected = true.obs;
  Rx<String> selectedBlocks = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;

  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];

  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();

  //int facilityId = 45;
  String categoryIds = '';

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  int categoryId = 5;

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  Rx<int> selectedIndex = 0.obs;

  ///

  @override
  void onInit() async {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;

      Future.delayed(Duration(seconds: 1), () {
        getBlocksList(facilityId);
      });
      Future.delayed(Duration(seconds: 1), () {
        getInventoryStatusList(isLoading: true, facilityId: facilityId);
      });
    });

    Future.delayed(Duration(seconds: 1), () async {
      await getuserAccessData();
    });
    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getFrequencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getWarrantyTypeList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getWarrantyUsageTermList();
    });

    await getTypePermitList();
    await getInventoryCategoryList();
    await getInventoryTypeList(isLoading: true, facilityId: facilityId);
    await getInventoryCategoryList();
    super.onInit();
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await addInventoryPresenter.getInventoryList(
      isLoading: true,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
    //  print('equipment Name List:$inventoryNameList');
    for (var inventory_list in _inventoryList) {
      eqipmentNameList.add(inventory_list);
    }
    inventoryList = _inventoryList;
    paginationController = PaginationController(
      rowCount: eqipmentNameList.length,
      rowsPerPage: 10,
    );
    update(['inventory_list']);
  }

  //
  Future<void> getFrequencyList() async {
    final list = await addInventoryPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  //
  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await addInventoryPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  ///fInventory/GetWarrantyTypeList
  Future<void> getWarrantyTypeList() async {
    warrantyNameList.value = <WarrantyTypeModel>[];
    final _warrantyNameList = await addInventoryPresenter.getWarrantyTypeList(
      isLoading: true,
    );
    if (_warrantyNameList != null) {
      for (var warrantyName in _warrantyNameList) {
        warrantyNameList.add(warrantyName);
      }
    }
  }

  ///
  Future<void> getWarrantyUsageTermList() async {
    warrantyUsageTermNameList.value = <WarrantyUsageTermListModel>[];
    final _warrantyUsageTermNameList =
        await addInventoryPresenter.getWarrantyUsageTermList(
      isLoading: true,
    );
    if (_warrantyUsageTermNameList != null) {
      for (var warrantyUsageTermListName in _warrantyUsageTermNameList) {
        warrantyUsageTermNameList.add(warrantyUsageTermListName);
      }
    }
  }

  Future<void> getInventoryStatusList({
    required bool isLoading,
    required int facilityId,
  }) async {
    final _statusList = await addInventoryPresenter.getInventoryStatusList(
        facilityId: 45, isLoading: true);

    if (_statusList != null) {
      for (var status in _statusList) {
        statusNameList.add(status);
      }

      selectedStatusName.value = statusNameList[0]?.name ?? '';
      selectedStatusNameId = statusNameList[0]?.id ?? 0;
    }
  }

  Future<void> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    final _typeList = await addInventoryPresenter.getInventoryTypeList(
        facilityId: 45, isLoading: true);

    if (_typeList != null) {
      for (var type in _typeList) {
        typeNameList.add(type);
      }

      selectedStatusName.value = statusNameList[0]?.name ?? '';
      selectedStatusNameId = statusNameList[0]?.id ?? 0;
    }
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList = await addInventoryPresenter.getTypePermitList();

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  ///
  ///inventory type list
  // Future<void> getInventoryTypeList() async {
  //   final _inventoryTypeList =
  //       await addInventoryPresenter.getInventoryTypeList();

  //   if (_inventoryTypeList != null) {
  //     for (var inventoryTypeList in _inventoryTypeList) {
  //       InventoryTypeList.add(inventoryTypeList);
  //     }
  //     // selectedTypePermit.value = typePermitList[0]?.name ?? '';
  //   }
  // }

  Future<void> getBlocksList(int _facilityId) async {
    blocksList.value = <BlockModel>[];
    final _blockList =
        await addInventoryPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blocksList.add(block);
      }
      update(["blockList"]);
    }
  }
  //   Future<void> getInventoryList() async {
  //   // selectedInventoryColumnVisibility.clear();
  //   inventoryList.clear();
  //   // parentEquipmentList.clear();
  //   final list = await addInventoryPresenter.getInventoryList(
  //     isLoading: false,
  //     categoryId: categoryId,
  //     facilityId: facilityId,
  //   );
  //   inventoryList = list;

  //   var someTempList = <DropdownModel>[];
  //   for (var i in inventoryList) {
  //     someTempList.add(DropdownModel(id: i.id, name: i.parentName ?? ''));
  //   }

  //   parentEquipmentList = someTempList.toSet().toList();

  //   // onInitializeData();
  //   update(['inventory_list', 'add_inventory']);
  // }

  Future<void> getFacilityList() async {
    final _facilityList = await addInventoryPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList = await addInventoryPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

  // void getBlockList(String facilityId) async {
  //   final list = await homePresenter.getBlockList(
  //       isLoading: false, facilityId: facilityId);
  //   blockList = list;
  //   update(['block_list']);
  // }

  // void getEquipmentList({
  // //   required String facilityId,
  // // }) async {
  // //   final list = await homePresenter.getEquipmentList(
  // //     isLoading: false,
  // //     facilityId: facilityId,
  // //   );
  // //   equipmentList = list;
  // //   update(['equipment_list']);
  // // }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      case RxList<WarrantyTypeModel>:
        {
          int warrantyIndex =
              warrantyNameList.indexWhere((x) => x?.name == value);
          selectedWarrentyNameId = warrantyNameList[warrantyIndex]?.id ?? 0;
        }
        break;
      case RxList<WarrantyUsageTermListModel>:
        {
          int warrantyUsageTermIndex =
              warrantyUsageTermNameList.indexWhere((x) => x?.name == value);
          selectedWarrentyNameId =
              warrantyNameList[warrantyUsageTermIndex]?.id ?? 0;
        }
        break;
      case RxList<InventoryModel>:
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex =
                equipmentCategoryList.indexWhere((x) => x?.name == value);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
            // selectedInventoryCategoryId = equipmentCategoryList[equipCatIndex]?.id ?? 0;
            print('First Category Id:$selectedEquipmentCategoryList');
          }
        }
        break;
      case RxList<InventoryStatusListModel>:
        {
          for (var statusName in statusNameList) {
            int statusIndex =
                statusNameList.indexWhere((x) => x?.name == statusName);
            selectedWorkAreaIdList.add(statusIndex);
          }
        }
        break;
      case RxList<InventoryTypeListModel>:
        {
          for (var typeName in typeNameList) {
            int typeNameIndex =
                typeNameList.indexWhere((x) => x?.name == typeName);
            selectedWorkAreaIdList.add(typeNameIndex);
          }
        }
        break;

      default:
        {}
        break;
    }
  }
}

class DropdownModel {
  DropdownModel({required this.id, required this.name});
  int? id;
  String? name;
}
