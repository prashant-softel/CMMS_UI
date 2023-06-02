import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/add_inventory/add_inventory_presenter.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/add_inventory_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_status_list_model.dart';
import 'package:cmms/domain/models/inventory_type_list_model.dart';
import 'package:cmms/domain/models/manufacturer_model.dart';
import 'package:cmms/domain/models/supplier_name_model.dart';
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

  //currancy
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<String> selectedUnitCurrency = ''.obs;
  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;

  //Inventory Type list
  RxList<TypePermitModel?> InventoryTypeList = <TypePermitModel>[].obs;
  Rx<bool> isInventoryTypeSelected = true.obs;
  Rx<String> selectedInventoryType = ''.obs;
  Rx<String> selectedInventoryOfType = ''.obs;
  Rx<bool> isInventoryType = true.obs;
  //add invntory
  var serialNoCtrlr = TextEditingController();
  var assetsNameCtrlr = TextEditingController();
  var assesDiscriptionCtrlr = TextEditingController();
  var certificateNoCtrlr = TextEditingController();
  var discriptionCtrlr = TextEditingController();
  var calibrationRemaingCtrlr = TextEditingController();
  var modelNoCtrlr = TextEditingController();
  var parentEquipmentNoCtrlr = TextEditingController();
  var costCtrlr = TextEditingController();
  var warrentyDescriptionCtrlr = TextEditingController();

  int selectedEquipmentId = 0;

//CategoryModel
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedEquipmentCategoryName = ''.obs;
  Rx<bool> isEquipmentCategoryNameSelected = true.obs;
  int selectedEquipmentCategoryNameId = 0;

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

  /// manufacturer name
  RxList<ManufacturerModel?> manufacturerModelNameList =
      <ManufacturerModel>[].obs;
  Rx<String> selectedmanufacturerName = ''.obs;
  Rx<bool> iswarrantymanufacturerSelected = true.obs;
  int selectedmanufacturerNameId = 0;

  ///
  RxList<SupplierNameModel?> supplierNameModelNameList =
      <SupplierNameModel>[].obs;
  Rx<String> selectedsupplierrName = ''.obs;
  Rx<bool> iswarrantysupplierSelected = true.obs;
  int selectedsupplierrNameId = 0;

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
  int selectedBlockListId = 0;

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
    Future.delayed(Duration(seconds: 1), () {
      getUnitCurrencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getmanufacturerList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getSupplierList();
    });

    await getTypePermitList();
    await getInventoryCategoryList();
    await getInventoryTypeList(isLoading: true, facilityId: facilityId);
    await getInventoryCategoryList();
    super.onInit();
  }

  //
  void getUnitCurrencyList() async {
    unitCurrencyList.value = <CurrencyListModel>[];
    final _unitCUrrencyList = await addInventoryPresenter.getUnitCurrencyList(
      isLoading: true,
      facilityId: facilityId,
    );
    print('Unit Currency List:$unitCurrencyList');
    for (var unit_currency_list in _unitCUrrencyList) {
      unitCurrencyList.add(unit_currency_list);
    }

    update(['unit_currency_list']);
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

//add inventory
  Future<bool> AddInventory() async {
    // if (addInventoryCtrlr.text.trim() == '' ||
    //     selectedEquipmentId == 0 ||
    //     selectedfrequencyId == 0) {
    //   Fluttertoast.showToast(
    //       msg: "Please enter required field", fontSize: 16.0);
    // } else {
    String _serialNoCtrlr = serialNoCtrlr.text.trim();
    String _assetsNameCtrlr = assetsNameCtrlr.text.trim();
    String _assesDiscriptionCtrlr = assesDiscriptionCtrlr.text.trim();
    String _certificateNoCtrlr = certificateNoCtrlr.text.trim();
    String _discriptionCtrlr = discriptionCtrlr.text.trim();
    String _modelNoCtrlr = modelNoCtrlr.text.trim();
    String _parentEquipmentNoCtrlr = parentEquipmentNoCtrlr.text.trim();
    String _costCtrlr = costCtrlr.text.trim();
    String _calibrationRemainderInTc = calibrationRemainderInTc.text.trim();
    String _lastCalibrationDateTc = lastCalibrationDateTc.text.trim();
    String _expireDateTc = expireDateTc.text.trim();
    String _warrentyDescriptionCtrlr = warrentyDescriptionCtrlr.text.trim();

    LstWarrantyDetail lstWarrantyDetail = LstWarrantyDetail(
        warrantyDescription: _warrentyDescriptionCtrlr,
        warrantyProviderId: selectedmanufacturerNameId,
        warrantyStatus: 1,
        warrantyType: selectedWarrentyNameId,
        warrrantyTermType: selectedwarrantyUsageTermNameId,
        // meterLimit: 1,
        // meterUnit: 1,
        certificateNumber: int.tryParse(_certificateNoCtrlr),
        expiryDate: _expireDateTc,
        // startDate///  is missing
        warrantyDiscription: _warrentyDescriptionCtrlr);

    AddInventoryRequestModel addInventoryRequestModel =
        AddInventoryRequestModel(
            name: _assetsNameCtrlr,
            description: "need description", //_discriptionCtrlr,
            typeId: selectedTypeNameId,
            statusId: selectedStatusNameId,
            facilityId: facilityId,
            supplierId: selectedsupplierrNameId,
            manufacturerId: selectedmanufacturerNameId,
            blockId: selectedBlockListId,
            categoryId: selectedEquipmentCategoryNameId,
            currency: selectedUnitCurrency.value,
            cost: 30, //int.tryParse(_costCtrlr),
            model: _modelNoCtrlr,
            serialNumber: _serialNoCtrlr,
            parentId: selectedEquipmentnameId,
            calibrationFrequency: selectedfrequencyId,
            calibrationReminderDays: 10, //int.tryParse("2023-03-10"),
            calibrationLastDate: _lastCalibrationDateTc,
            calibrationFirstDueDate: "2023-03-10",
            calibrationFrequencyType: 2,
            acCapacity: 2000,
            dcCapacity: 3000,
            multiplier: 3,
            customerId: 1,
            operatorId: 3,
            ownerId: 2,
            stockCount: 50,
            moduleQuantity: 15,
            attachments: null

            ///please check
            // lstWarrantyDetail: [] //[lstWarrantyDetail],
            );
    var addInventoryJsonString = [
      {
        "name": _assetsNameCtrlr, //"NOOR_TOOLS_SMB_1new12",
        "description": _assesDiscriptionCtrlr, // "NOOR_TOOLS SMB 1",
        "typeId": 1,
        "statusId": 1,
        "facilityId": 46,
        "blockId": 76,
        "parentId": 122918,
        "categoryId": 5,
        "acCapacity": 2000,
        "dcCapacity": 5000,
        "serialNumber": "A123456",
        "multiplier": 3,
        "calibrationFrequency": 2,
        "calibrationReminderDays": 10,
        "calibrationFirstDueDate": "2023-03-10",
        "calibrationLastDate": "2023-01-10",
        "customerId": 1,
        "ownerId": 2,
        "operatorId": 3,
        "manufacturerId": 8,
        "supplierId": 5,
        "model": "ModelString",
        "stockCount": 50,
        "moduleQuantity": 15,
        "cost": 123456,
        "currency": "USD",
        "attachments": null,
        "lstWarrantyDetail": [
          {
            "warranty_type": 0,
            "warranty_description": null,
            "warrranty_term_type": 0,
            "expiry_date": "2030-12-31",
            "warranty_provider_Id": 0,
            "certificate_number": null,
            "warranty_status": 1
          }
        ]
      }
    ];
    // [
    //   addInventoryRequestModel.toJson()
    // ]; //createCheckListToJson([createChecklist]);

    print({"checklistJsonString", addInventoryJsonString});
    await addInventoryPresenter.AddInventory(
      addInventoryJsonString: addInventoryJsonString,
      isLoading: true,
    );
    return true;
    // }
    // return true;
  }

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

  Future<void> getmanufacturerList() async {
    manufacturerModelNameList.value = <ManufacturerModel>[];
    final _manufacturerList = await addInventoryPresenter.getmanufacturerList(
      isLoading: true,
      BusinessType: 8,
    );
    for (var manufacturerName in _manufacturerList) {
      manufacturerModelNameList.add(manufacturerName);
    }
  }

  Future<void> getSupplierList() async {
    supplierNameModelNameList.value = <SupplierNameModel>[];
    final _supplierList = await addInventoryPresenter.getSupplierList(
      isLoading: true,
      BusinessType: 5,
    );
    for (var manuSupplierName in _supplierList) {
      supplierNameModelNameList.add(manuSupplierName);
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
    }
  }

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

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      case RxList<WarrantyUsageTermListModel>:
        {
          int warrantyUsageIndex =
              warrantyUsageTermNameList.indexWhere((x) => x?.name == value);

          selectedwarrantyUsageTermNameId =
              warrantyUsageTermNameList[warrantyUsageIndex]?.id ?? 0;
        }
        break;
      case RxList<BlockModel>:
        {
          int blockIndex = blocksList.indexWhere((x) => x?.name == value);

          selectedBlockListId = frequencyList[blockIndex]?.id ?? 0;
        }
        break;

      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      case RxList<ManufacturerModel>:
        {
          int manufacturerIndex =
              manufacturerModelNameList.indexWhere((x) => x?.name == value);
          selectedmanufacturerNameId =
              manufacturerModelNameList[manufacturerIndex]?.id ?? 0;
        }
        break;
      case RxList<WarrantyTypeModel>:
        {
          int warrantyIndex =
              warrantyNameList.indexWhere((x) => x?.name == value);
          selectedWarrentyNameId = warrantyNameList[warrantyIndex]?.id ?? 0;
        }
        break;
      case RxList<SupplierNameModel>:
        {
          int supplierIndex =
              supplierNameModelNameList.indexWhere((x) => x?.name == value);
          selectedsupplierrNameId =
              supplierNameModelNameList[supplierIndex]?.id ?? 0;
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
