import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);
  HomePresenter homePresenter;

  ///
  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];
  var equipmentList = <EquipmentModel>[];
  var calibrationFrequencyDropdownList = <DropdownModel>[];
  var warrantyTypeDropdownList = <DropdownModel>[];
  var warrantyUsageDropdownList = <DropdownModel>[];
  var warrantyProviderDropdownList = <DropdownModel>[];
  // var manufacturerDropdownList = <DropdownModel>[];
  // var supplierDropdownList = <DropdownModel>[];
  var currencyDropdownList = <DropdownModel>[];
  var businessList = <BusinessModel>[];

  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();
  final typeTextController = TextEditingController();
  final categoryTextController = TextEditingController();
  final serialNoTextController = TextEditingController();
  final statusTextController = TextEditingController();
  final assetNameTextController = TextEditingController();
  final enterMultiplierTextController = TextEditingController();
  final assetDescpTextController = TextEditingController();

  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();
  int facilityId = 45;
  int categoryId = 5;
  int businessType = 8;

  bool openExpiryDatePicker = false;
  bool openLastCalibrationDatePicker = false;
  String? selectedWarrantyDate;

  ///

  var inventoryColumnVisibility = <ColumnAvailability>[];
  var selectedInventoryColumnVisibility = <ColumnAvailability>[];

  int? blockDropdownValue;
  String? parentEquipmentDropdownValue;
  int? typeDropdownValue;
  int? categoryDropdownValue;
  int? statusDropdownValue;
  int? calibrationDropdownValue;
  int? warrantyTypeDropdownValue;
  int? warrantyUsageDropdownValue;
  int? warrantyProviderDropdownValue;
  int? manufacturerDropdownValue;
  int? supplierDropdownValue;
  int? currencyDropdownValue;

  @override
  void onInit() async {
    print('Onint ');

    await homePresenter.generateToken();
    Future.delayed(Duration(milliseconds: 500), () async {
      getInventoryList();
      getBlockList('45');
      getInventoryTypeList(isLoading: false, facilityId: facilityId);
      getInventoryCategoryList(isLoading: false, facilityId: facilityId);
      getInventoryStatusList(isLoading: false, facilityId: facilityId);
      getBusinessList(isLoading: false, businessType: businessType);
    });

    super.onInit();
  }

  // Add inventory variable
  // - Calibration Tab
  var calibrationFrequencyTc = TextEditingController();
  var calibrationRemainderInTc = TextEditingController();
  var calibrationDaysTc = TextEditingController();
  var lastCalibrationDateTc = TextEditingController();

  // warranty Tab
  var expireDateTc = TextEditingController();
  var descriptionTc = TextEditingController();
  var calibrationNumberTc = TextEditingController();

  // purchasing Tab
  var modelTc = TextEditingController();
  var costTc = TextEditingController();
  var parentEquipmentsTc = TextEditingController();

  // Add inventory
  var assetNameTc = TextEditingController();
  var serialNoTc = TextEditingController();
  var enterMultiplierTc = TextEditingController();
  var assetDescriptionTc = TextEditingController();

  void onInitializeData() {
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'plantName'.tr, value: null));
    inventoryColumnVisibility.add(ColumnAvailability(
        text: 'assetName'.tr, value: null, isSelected: true));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'assetDescription'.tr, value: null));
    inventoryColumnVisibility.add(
        ColumnAvailability(text: 'serialNo'.tr, value: null, isSelected: true));
    inventoryColumnVisibility.add(ColumnAvailability(
        text: 'parentAsset'.tr, value: null, isSelected: true));
    inventoryColumnVisibility.add(
        ColumnAvailability(text: 'category'.tr, value: null, isSelected: true));
    inventoryColumnVisibility.add(ColumnAvailability(
        text: 'assetFacilityName'.tr, value: null, isSelected: true));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'assetType'.tr, value: null));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'assetStatus'.tr, value: null));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'assetCustomerName'.tr, value: null));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'assetOwnerName'.tr, value: null));
    inventoryColumnVisibility
        .add(ColumnAvailability(text: 'assetOperatorName'.tr, value: null));
    inventoryColumnVisibility.add(
        ColumnAvailability(text: 'action'.tr, value: null, isSelected: true));

    buildSelectedInventoryColumnVisibility();

    calibrationFrequencyDropdownList.add(DropdownModel(id: 1, name: 'Days'));
    calibrationFrequencyDropdownList.add(DropdownModel(id: 2, name: 'Months'));
    calibrationFrequencyDropdownList.add(DropdownModel(id: 3, name: 'Years'));
    warrantyTypeDropdownList.add(DropdownModel(id: 1, name: 'Basic'));
    warrantyTypeDropdownList.add(DropdownModel(id: 2, name: 'Comprehensive'));
    warrantyUsageDropdownList.add(DropdownModel(id: 1, name: 'Period'));
    warrantyUsageDropdownList.add(DropdownModel(id: 2, name: 'Usage'));
    warrantyUsageDropdownList
        .add(DropdownModel(id: 3, name: 'Which Ever Is Earlier'));
    // warrantyProviderDropdownList.add(DropdownModel(id: 0, name: 'Default'));
    // manufacturerDropdownList.add(DropdownModel(id: 0, name: 'Manufacturer 1'));
    // supplierDropdownList.add(DropdownModel(id: 0, name: 'Supplier 1'));
    currencyDropdownList.add(DropdownModel(id: 0, name: 'Currency 1'));
  }

  void buildSelectedInventoryColumnVisibility() {
    selectedInventoryColumnVisibility.clear();
    for (var i in inventoryColumnVisibility) {
      if (i.isSelected) {
        selectedInventoryColumnVisibility.add(i);
      }
    }
    update(['inventory_list']);
  }

  bool buildSelectedInventoryList({required String data}) {
    var boolVal = false;
    for (var i in selectedInventoryColumnVisibility) {
      print('parent data $data ${i.text}');
      if (i.text == data) {
        boolVal = true;
      }
    }
    return boolVal;
  }

  var dynamicInventoryList = <InventoryListModel>[];
  var parentEquipmentList = <String>[];

  Future<void> getInventoryList() async {
    final list = await homePresenter.getInventoryList(
      isLoading: false,
      categoryId: categoryId,
      facilityId: facilityId,
    );
    inventoryList = list;

    var someTempList = <String>[];
    for (var i in inventoryList) {
      someTempList.add(i.parentName ?? '');
    }

    parentEquipmentList = someTempList.toSet().toList();

    onInitializeData();
    update(['inventory_list', 'add_inventory']);
  }

  void getBlockList(String facilityId) async {
    final list = await homePresenter.getBlockList(
        isLoading: false, facilityId: facilityId);
    blockList = list;
    update(['add_inventory']);
  }

  void getEquipmentList({
    required String facilityId,
  }) async {
    final list = await homePresenter.getEquipmentList(
      isLoading: false,
      facilityId: facilityId,
    );
    equipmentList = list;
    update(['add_inventory']);
  }

  void onSelectEquipment(EquipmentModel equipment) {
    selectedEquipment = equipment;
    parentEquipmentTextController.text = selectedEquipment.name ?? '';

    update(['add_inventory']);
  }

  void onSelectBlock(BlockModel block) {
    selectedBlock = block;
    blockTextController.text = selectedBlock.name ?? '';

    update(['block_field']);
  }

  bool checkSelectedColumnVisibility({required String columnName}) {
    var boolVal = false;
    for (var i in selectedInventoryColumnVisibility) {
      if (i.text == columnName) {
        boolVal = true;
      }
    }

    return boolVal;
  }

  var inventoryTypeList = <InventoryTypeModel>[];
  var inventoryCategoryList = <InventoryCategoryModel>[];
  var inventoryStatusList = <InventoryTypeModel>[];

  Future<void> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    var response = await homePresenter.getInventoryTypeList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
    inventoryTypeList = response;
    update(['add_inventory']);
  }

  Future<void> getInventoryCategoryList({
    required bool isLoading,
    required int facilityId,
  }) async {
    var response = await homePresenter.getInventoryCategoryList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
    inventoryCategoryList = response;
    update(['add_inventory']);
  }

  Future<void> getInventoryStatusList({
    required bool isLoading,
    required int facilityId,
  }) async {
    var response = await homePresenter.getInventoryStatusList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
    inventoryStatusList = response;
    update(['add_inventory']);
  }

  Future<void> getBusinessList({
    required bool isLoading,
    required int businessType,
  }) async {
    var response = await homePresenter.getBusinessList(
      isLoading: isLoading,
      businessType: businessType,
    );

    businessList = response;
    update(['warranty_tab', 'manufacturer_tab']);
  }

  Future<ResponseModel> addInventory({
    required int blockId,
    required String assetName,
    required int parentEqipId,
    required int typeId,
    required int categoryId,
    required int statusId,
    required String serialNo,
    required String assetDes,
    required int caliFreq,
    required int caliFreqType,
    required int caliRemainderDays,
    required String caliRemainderFirstDate,
    required String lastCaliDate,
    required int warrantyTypeId,
    required int warrantyProviderId,
    required int warrantyUsageId,
    required String expireDate,
  }) async {
    var requestBody = AddInventoryRequestModel(
      blockId: blockId,
      name: assetName,
      description: assetDes,
      typeId: typeId,
      categoryId: categoryId,
      statusId: statusId,
      serialNumber: serialNo,
      parentId: parentEqipId,
      calibrationFrequency: caliFreq,
      calibrationFrequencyType: caliFreqType,
      calibrationReminderDays: caliRemainderDays,
      calibrationFirstDueDate: caliRemainderFirstDate,
      calibrationLastDate: lastCaliDate,
    );

    var response = await homePresenter.addInventory(
      requestBody: requestBody,
      isLoading: true,
    );
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Inventory {
  /// Creates the employee class with required details.
  Inventory({
    required this.asset,
    required this.name,
    required this.serialNo,
    required this.parentAsset,
    required this.category,
  });

  final String name;

  final String serialNo;
  final String parentAsset;
  final String category;
  final AssetName asset;
}

class AssetName {
  final String name;
  final int requirementStatus;

  AssetName(this.name, this.requirementStatus);
}

class ColumnAvailability {
  ColumnAvailability(
      {required this.text, required this.value, this.isSelected = false});

  String text;
  String? value;
  bool isSelected;
}

class InventoryListModel {
  InventoryListModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.categoryName,
    required this.blockName,
    required this.parentName,
    required this.serialNumber,
    required this.customerName,
    required this.ownerName,
    required this.operatorName,
    required this.status,
  });

  int id;
  ColumnAvailability name;
  ColumnAvailability description;
  ColumnAvailability type;
  ColumnAvailability categoryName;
  ColumnAvailability blockName;
  ColumnAvailability parentName;
  ColumnAvailability serialNumber;
  ColumnAvailability customerName;
  ColumnAvailability ownerName;
  ColumnAvailability operatorName;
  ColumnAvailability status;
}

class DropdownModel {
  DropdownModel({required this.id, required this.name});
  int? id;
  String? name;
}
