// import 'package:cmms/app/home/inventory/inventory_presenter.dart';
// import 'package:cmms/domain/models/models.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class InventoryController extends GetxController {
//   InventoryController({required this.inventoryPresenter});
//   InventoryPresenter inventoryPresenter;

//   var inventoryList = <InventoryModel>[];
//   var blockList = <BlockModel>[];
//   var equipmentList = <EquipmentModel>[];
//   var calibrationFrequencyDropdownList = <DropdownModel>[];
//   var warrantyTypeDropdownList = <DropdownModel>[];
//   var warrantyUsageDropdownList = <DropdownModel>[];
//   var warrantyProviderDropdownList = <DropdownModel>[];
//   var manufacturerDropdownList = <DropdownModel>[];
//   var supplierDropdownList = <DropdownModel>[];
//   var currencyDropdownList = <DropdownModel>[];
//   var businessList = <BusinessModel>[];

//   var blockDropDownList = <DropdownModel>[];

//   final blockTextController = TextEditingController();
//   final parentEquipmentTextController = TextEditingController();
//   final typeTextController = TextEditingController();
//   final categoryTextController = TextEditingController();
//   final serialNoTextController = TextEditingController();
//   final statusTextController = TextEditingController();
//   final assetNameTextController = TextEditingController();
//   final enterMultiplierTextController = TextEditingController();
//   final assetDescpTextController = TextEditingController();

//   var selectedBlock = BlockModel();
//   var selectedEquipment = EquipmentModel();
//   int facilityId = 45;
//   int categoryId = 5;
//   int businessType = 5;

//   bool openExpiryDatePicker = false;
//   bool openLastCalibrationDatePicker = false;
//   String? selectedWarrantyDate;

//   ///

//   var inventoryColumnVisibility = <ColumnAvailability>[];
//   var selectedInventoryColumnVisibility = <ColumnAvailability>[];

//   DropdownModel? blockDropdownValue;
//   DropdownModel? parentEquipmentDropdownValue;
//   DropdownModel? inventoryTypeDropdownValue;
//   DropdownModel? inventoryCategoryDropdownValue;
//   DropdownModel? inventoryStatusDropdownValue;
//   DropdownModel? calibrationFrequencyDropdownValue;
//   DropdownModel? warrantyTypeDropdownValue;
//   DropdownModel? warrantyProviderDropdownValue;
//   DropdownModel? warrantyUsageDropdownValue;
//   DropdownModel? manufacturerDropdownValue;
//   DropdownModel? supplierDropdownValue;
//   DropdownModel? currencyDropdownValue;

//   @override
//   void onInit() {
//     // print('Onint ');

//     Future.delayed(Duration(milliseconds: 500), () async {
//       inventoryPresenter.generateToken();
//     }).whenComplete(() {
//       Future.delayed(Duration(milliseconds: 500), () async {
//         await getInventoryList();
//         await getBlockList('45');
//         await getInventoryTypeList(isLoading: false, facilityId: facilityId);
//         await getInventoryCategoryList(
//             isLoading: false, facilityId: facilityId);
//         await getInventoryStatusList(isLoading: false, facilityId: facilityId);
//         await getBusinessList(isLoading: false, businessType: businessType);
//         await getManufacturerList(isLoading: false, businessType: businessType);
//         await getSupplierList(isLoading: false, businessType: businessType);
//       });
//     });

//     super.onInit();
//   }

//   // Add inventory variable
//   // - Calibration Tab
//   var calibrationFrequencyTc = TextEditingController();
//   var calibrationRemainderInTc = TextEditingController();
//   // var calibrationDaysTc = TextEditingController();
//   var lastCalibrationDateTc = TextEditingController();

//   // warranty Tab
//   var expireDateTc = TextEditingController();
//   var descriptionTc = TextEditingController();
//   var certificationNumberTc = TextEditingController();

//   // purchasing Tab
//   var modelTc = TextEditingController();
//   var costTc = TextEditingController();
//   var parentEquipmentsTc = TextEditingController();

//   // Add inventory
//   var assetNameTc = TextEditingController();
//   var serialNoTc = TextEditingController();
//   var enterMultiplierTc = TextEditingController();
//   var assetDescriptionTc = TextEditingController();

//   void onInitializeData() {
//     inventoryColumnVisibility
//         .add(ColumnAvailability(text: 'id', value: null, isSelected: true));
//     inventoryColumnVisibility
//         .add(ColumnAvailability(text: 'plantName'.tr, value: null));
//     inventoryColumnVisibility.add(ColumnAvailability(
//         text: 'assetName'.tr, value: null, isSelected: true));
//     inventoryColumnVisibility
//         .add(ColumnAvailability(text: 'assetDescription'.tr, value: null));
//     inventoryColumnVisibility.add(
//         ColumnAvailability(text: 'serialNo'.tr, value: null, isSelected: true));
//     inventoryColumnVisibility.add(ColumnAvailability(
//         text: 'parentAsset'.tr, value: null, isSelected: true));
//     inventoryColumnVisibility.add(
//         ColumnAvailability(text: 'category'.tr, value: null, isSelected: true));
//     inventoryColumnVisibility.add(ColumnAvailability(
//         text: 'assetFacilityName'.tr, value: null, isSelected: true));
//     inventoryColumnVisibility
//         .add(ColumnAvailability(text: 'assetType'.tr, value: null));
//     inventoryColumnVisibility
//         .add(ColumnAvailability(text: 'assetStatus'.tr, value: null));
//     inventoryColumnVisibility
//         .add(ColumnAvailability(text: 'assetCustomerName'.tr, value: null));
//     inventoryColumnVisibility
//         .add(ColumnAvailability(text: 'assetOwnerName'.tr, value: null));
//     inventoryColumnVisibility
//         .add(ColumnAvailability(text: 'assetOperatorName'.tr, value: null));
//     inventoryColumnVisibility.add(
//         ColumnAvailability(text: 'action'.tr, value: null, isSelected: true));

//     buildSelectedInventoryColumnVisibility();

//     calibrationFrequencyDropdownList.add(DropdownModel(id: 1, name: 'Days'));
//     calibrationFrequencyDropdownList.add(DropdownModel(id: 2, name: 'Months'));
//     calibrationFrequencyDropdownList.add(DropdownModel(id: 3, name: 'Years'));
//     warrantyTypeDropdownList.add(DropdownModel(id: 1, name: 'Basic'));
//     warrantyTypeDropdownList.add(DropdownModel(id: 2, name: 'Comprehensive'));
//     warrantyUsageDropdownList.add(DropdownModel(id: 1, name: 'Period'));
//     warrantyUsageDropdownList.add(DropdownModel(id: 2, name: 'Usage'));
//     warrantyUsageDropdownList
//         .add(DropdownModel(id: 3, name: 'Which Ever Is Earlier'));
//     // warrantyProviderDropdownList.add(DropdownModel(id: 0, name: 'Default'));
//     // manufacturerDropdownList.add(DropdownModel(id: 0, name: 'Manufacturer 1'));
//     // supplierDropdownList.add(DropdownModel(id: 0, name: 'Supplier 1'));
//     currencyDropdownList.add(DropdownModel(id: 0, name: 'USD'));
//   }

//   void buildSelectedInventoryColumnVisibility() {
//     selectedInventoryColumnVisibility.clear();
//     for (var i in inventoryColumnVisibility) {
//       if (i.isSelected) {
//         selectedInventoryColumnVisibility.add(i);
//       }
//     }
//     update(['inventory_list']);
//   }

//   var changeListCheck = false;

//   bool buildSelectedInventoryList({required String data}) {
//     var boolVal = false;
//     for (var i in selectedInventoryColumnVisibility) {
//       // print('parent data $data ${i.text}');
//       if (i.text == data) {
//         boolVal = true;
//       }
//     }
//     return boolVal;
//   }

//   var dynamicInventoryList = <InventoryListModel>[];
//   var parentEquipmentList = <DropdownModel>[];

//   Future<void> getInventoryList() async {
//     selectedInventoryColumnVisibility.clear();
//     inventoryList.clear();
//     final list = await inventoryPresenter.getInventoryList(
//       isLoading: false,
//       categoryId: categoryId,
//       facilityId: facilityId,
//     );
//     inventoryList = list;

//     var someTempList = <DropdownModel>[];
//     for (var i in inventoryList) {
//       someTempList.add(DropdownModel(id: i.id, name: i.parentName ?? ''));
//     }

//     parentEquipmentList = someTempList.toSet().toList();

//     onInitializeData();
//     update(['inventory_list', 'add_inventory']);
//   }

//   Future<void> getBlockList(String facilityId) async {
//     final list = await inventoryPresenter.getBlockList(
//         isLoading: false, facilityId: facilityId);
//     blockList = list;

//     for (var i in blockList) {
//       blockDropDownList.add(DropdownModel(id: i.id, name: i.name));
//     }

//     update(['add_inventory']);
//   }

//   Future<void> getEquipmentList({
//     required String facilityId,
//   }) async {
//     final list = await inventoryPresenter.getEquipmentList(
//       isLoading: false,
//       facilityId: facilityId,
//     );
//     equipmentList = list;
//     update(['add_inventory']);
//   }

//   void onSelectEquipment(EquipmentModel equipment) {
//     selectedEquipment = equipment;
//     parentEquipmentTextController.text = selectedEquipment.name ?? '';

//     update(['add_inventory']);
//   }

//   void onSelectBlock(BlockModel block) {
//     selectedBlock = block;
//     blockTextController.text = selectedBlock.name ?? '';

//     update(['block_field']);
//   }

//   bool checkSelectedColumnVisibility({required String columnName}) {
//     var boolVal = false;
//     for (var i in selectedInventoryColumnVisibility) {
//       if (i.text == columnName) {
//         boolVal = true;
//       }
//     }

//     return boolVal;
//   }

//   var inventoryTypeDropdownList = <DropdownModel>[];
//   var inventoryCategoryDropdownList = <DropdownModel>[];
//   var inventoryStatusDropdownList = <DropdownModel>[];

//   // var inventoryTypeList = <InventoryTypeModel>[];
//   // var inventoryCategoryList = <InventoryCategoryModel>[];
//   // var inventoryStatusList = <InventoryTypeModel>[];

//   Future<void> getInventoryTypeList({
//     required bool isLoading,
//     required int facilityId,
//   }) async {
//     var response = await inventoryPresenter.getInventoryTypeList(
//       isLoading: isLoading,
//       facilityId: facilityId,
//     );

//     for (var i in response) {
//       inventoryTypeDropdownList.add(DropdownModel(id: i.id, name: i.name));
//     }
//     update(['add_inventory']);
//   }

//   Future<void> getInventoryCategoryList({
//     required bool isLoading,
//     required int facilityId,
//   }) async {
//     var response = await inventoryPresenter.getInventoryCategoryList(
//       isLoading: isLoading,
//       facilityId: 45,
//     );
//     for (var i in response) {
//       inventoryCategoryDropdownList.add(DropdownModel(id: i.id, name: i.name));
//     }
//     update(['add_inventory']);
//   }

//   Future<void> getInventoryStatusList({
//     required bool isLoading,
//     required int facilityId,
//   }) async {
//     var response = await inventoryPresenter.getInventoryStatusList(
//       isLoading: isLoading,
//       facilityId: facilityId,
//     );
//     for (var i in response) {
//       // print('response name ${i.status}');
//       inventoryStatusDropdownList.add(DropdownModel(id: i.id, name: i.name));
//     }
//     update(['add_inventory']);
//   }

//   Future<void> getBusinessList({
//     required bool isLoading,
//     required int businessType,
//   }) async {
//     var response = await inventoryPresenter.getBusinessList(
//       isLoading: isLoading,
//       businessType: businessType,
//     );

//     businessList = response;
//     for (var i in businessList) {
//       warrantyProviderDropdownList.add(DropdownModel(id: i.id, name: i.name));
//       // manufacturerDropdownList.add(DropdownModel(id: i.id, name: i.name));
//       // supplierDropdownList.add(DropdownModel(id: i.id, name: i.name));
//     }
//     update(['warranty_tab', 'manufacturer_tab']);
//   }

//   Future<void> getManufacturerList({
//     required bool isLoading,
//     required int businessType,
//   }) async {
//     var response = await inventoryPresenter.getBusinessList(
//       isLoading: isLoading,
//       businessType: 2,
//     );

//     for (var i in response) {
//       manufacturerDropdownList.add(DropdownModel(id: i.id, name: i.name));
//       update(['manufacturer_tab']);
//     }
//   }

//   Future<void> getSupplierList({
//     required bool isLoading,
//     required int businessType,
//   }) async {
//     var response = await inventoryPresenter.getBusinessList(
//       isLoading: isLoading,
//       businessType: 5,
//     );

//     for (var i in response) {
//       supplierDropdownList.add(DropdownModel(id: i.id, name: i.name));
//       update(['manufacturer_tab']);
//     }
//   }

//   bool isAddOrUpdateInventory = false;

//   Future<void> addInventory({
//     required bool toAddOrUpdate,
//     required int blockId,
//     required String assetName,
//     required int parentEqipId,
//     required int typeId,
//     required int categoryId,
//     required int statusId,
//     required String serialNo,
//     required String assetDes,
//     required int multiplier,
//     required int caliFreq,
//     required int caliFreqType,
//     required int caliRemainderDays,
//     required String caliRemainderFirstDate,
//     required String lastCaliDate,
//     required int warrantyTypeId,
//     required int warrantyProviderId,
//     required int warrantyUsageId,
//     required String expireDate,
//     required String warrantyCertification,
//     required String warrantyDescription,
//     required int manufacturerId,
//     required int supplierId,
//     required String currency,
//     required String manufacturerModel,
//     required int manufacturerCost,
//     required String manufacturerParentEquipmentNo,
//   }) async {
//     // var requestBody2 = <String, dynamic>{
//     //   "name": assetName,
//     //   "description": assetDes,
//     //   "typeId": typeId,
//     //   "statusId": statusId,
//     //   "facilityId": facilityId,
//     //   "blockId": blockId,
//     //   "parentId": parentEqipId,
//     //   "categoryId": categoryId,
//     //   "acCapacity": null,
//     //   "dcCapacity": null,
//     //   "serialNumber": serialNo,
//     //   "multiplier": multiplier,
//     //   "calibrationFrequency": caliFreq,
//     //   "calibrationFrequencyType": caliFreqType,
//     //   "calibrationReminderDays": caliRemainderDays,
//     //   "calibrationFirstDueDate": caliRemainderFirstDate,
//     //   "calibrationLastDate": lastCaliDate,
//     //   "customerId": null,
//     //   "ownerId": null,
//     //   "operatorId": null,
//     //   "manufacturerId": manufacturerId,
//     //   "supplierId": supplierId,
//     //   "model": manufacturerModel,
//     //   "stockCount": null,
//     //   "moduleQuantity": 0,
//     //   "cost": manufacturerCost,
//     //   "currency": currency,
//     //   "attachments": null,
//     //   "lstWarrantyDetail": [
//     //     <String, dynamic>{
//     //       "warranty_type": warrantyTypeId,
//     //       "warranty_description": warrantyDescription,
//     //       "warrranty_term_type": null,
//     //       "expiry_date": expireDate,
//     //       "meter_limit": 0,
//     //       "meter_unit": 0,
//     //       "warranty_provider_Id": warrantyProviderId,
//     //       "certificate_number": warrantyCertification,
//     //       "warranty_status": 1,
//     //     }
//     //   ]
//     //  LstWarrantyDetail(
//     // expiryDate: expireDate,
//     // warrantyDescription: warrantyDescription,
//     // warrantyProviderId: warrantyProviderId,
//     // certificateNumber: warrantyCertification,
//     // warrantyType: warrantyTypeId,
//     // warrrantyTermType: warrantyProviderId,
//     // warrantyStatus: 1,
//     // meterLimit: 0,
//     // meterUnit: 0,
//     // ),
//     // };

//     var requestBody = AddInventoryRequestModel(
//       id: toAddOrUpdate ? null : selectedInventoryId,
//       blockId: blockId,
//       name: assetName,
//       description: assetDes,
//       typeId: typeId,
//       categoryId: categoryId,
//       statusId: statusId,
//       serialNumber: serialNo,
//       parentId: parentEqipId,
//       calibrationFrequency: caliFreq,
//       calibrationFrequencyType: caliFreqType,
//       calibrationReminderDays: caliRemainderDays,
//       calibrationFirstDueDate: caliRemainderFirstDate,
//       calibrationLastDate: lastCaliDate,
//       acCapacity: 2000,
//       cost: manufacturerCost,
//       currency: currency,
//       customerId: 5,
//       dcCapacity: 5000,
//       facilityId: 0,
//       manufacturerId: manufacturerId,
//       model: manufacturerModel,
//       multiplier: multiplier,
//       supplierId: supplierId,
//       moduleQuantity: 0,
//       operatorId: 0,
//       ownerId: 0,
//       stockCount: 0,
//       attachments: null,
//       lstWarrantyDetail: [
//         LstWarrantyDetail(
//           expiryDate: expireDate,
//           warrantyDescription: warrantyDescription,
//           warrantyProviderId: warrantyProviderId,
//           certificateNumber: warrantyCertification,
//           warrantyType: warrantyTypeId,
//           warrrantyTermType: warrantyProviderId,
//           warrantyStatus: 1,
//           meterLimit: 0,
//           meterUnit: 0,
//         ),
//       ],
//     );

//     try {
//       if (toAddOrUpdate) {
//         await inventoryPresenter.addInventory(
//           requestBody: requestBody,
//           isLoading: true,
//         );
//         Utility.showSuccessSnackBar('The inventory added successfully');
//       } else {
//         await inventoryPresenter.updateInventory(
//           requestBody: requestBody,
//           isLoading: true,
//         );
//         Utility.showSuccessSnackBar('The inventory updated successfully');
//       }

//       getInventoryList();
//       Get.to(() => HomeView());
//       // print('Response ');
//     } catch (e) {
//       Utility.showSuccessSnackBar('Failed to add the inventory. Please check.');

//       Utility.printELog(e.toString());
//     }
//   }

//   var inventoryDetailsList = <InventoryDetailsModel>[];
//   bool viewInventory = false;
//   bool editInventory = false;

//   Future<void> inventoryDetails(
//       {required int inventoryId, required bool viewOrEdit}) async {
//     try {
//       var response = await inventoryPresenter.inventoryDetails(
//           inventoryId: inventoryId, isLoading: false);
//       inventoryDetailsList = response;

//       if (viewOrEdit) {
//         viewInventory = true;
//         editInventory = false;
//       } else {
//         editInventory = true;
//       }
//       viewInventoryListData(inventoryDetailsList.first);

//       Get.to(() => AddInventory());

//       update(['add_inventory']);
//     } catch (e) {
//       Utility.printELog(e.toString());
//     }
//   }

//   int? selectedInventoryId;
//   void viewInventoryListData(InventoryDetailsModel inventory) {
//     selectedInventoryId = inventory.id;
//     for (var i in blockDropDownList) {
//       if (i.name == inventory.blockName) {
//         blockDropdownValue = i;
//       }
//     }
//     for (var i in parentEquipmentList) {
//       if (i.name == inventory.parentName) {
//         parentEquipmentDropdownValue = i;
//       }
//     }
//     for (var i in inventoryTypeDropdownList) {
//       if (i.name == inventory.type) {
//         inventoryTypeDropdownValue = i;
//       }
//     }
//     for (var i in inventoryCategoryDropdownList) {
//       if (i.name == inventory.categoryName) {
//         inventoryCategoryDropdownValue = i;
//       }
//     }
//     for (var i in inventoryStatusDropdownList) {
//       if (i.name == inventory.status) {
//         inventoryStatusDropdownValue = i;
//       }
//     }

//     for (var i in calibrationFrequencyDropdownList) {
//       if (i.name == inventory.calibrationFreqType) {
//         calibrationFrequencyDropdownValue = i;
//       }
//     }

//     for (var i in warrantyTypeDropdownList) {
//       if (i.name == inventory.warrantyTypeName) {
//         warrantyTypeDropdownValue = i;
//       }
//     }

//     for (var i in warrantyProviderDropdownList) {
//       if (i.name == inventory.warrantyProviderName) {
//         warrantyProviderDropdownValue = i;
//       }
//     }

//     for (var i in warrantyUsageDropdownList) {
//       if (i.name == inventory.warrrantyTermTypeName) {
//         warrantyUsageDropdownValue = i;
//       }
//     }

//     for (var i in manufacturerDropdownList) {
//       if (i.name == inventory.manufacturerName) {
//         manufacturerDropdownValue = i;
//       }
//     }

//     for (var i in supplierDropdownList) {
//       if (i.name == inventory.supplierName) {
//         supplierDropdownValue = i;
//       }
//     }

//     for (var i in currencyDropdownList) {
//       if (i.name == inventory.currency) {
//         currencyDropdownValue = i;
//       }
//     }

//     assetNameTc.text = inventory.name ?? '';
//     serialNoTc.text = inventory.serialNumber ?? '';
//     enterMultiplierTc.text = inventory.mutliplier?.toString() ?? '0';
//     assetDescriptionTc.text = inventory.description ?? '';
//     calibrationFrequencyTc.text = inventory.calibrationFrequency ?? '';
//     lastCalibrationDateTc.text =
//         inventory.calibrationLastDate?.split('T')[0] ?? '';
//     calibrationRemainderInTc.text =
//         inventory.calibrationReminderDays?.toString() ?? '';
//     expireDateTc.text = ' ';
//     certificationNumberTc.text = ' ';
//     descriptionTc.text = ' ';
//     modelTc.text = inventory.model ?? '';
//     parentEquipmentsTc.text = inventory.parentName ?? '';
//     costTc.text = inventory.cost?.toString() ?? '';

//     update(['add_inventory']);
//   }
// }

// /// Custom business object class which contains properties to hold the detailed
// /// information about the employee which will be rendered in datagrid.
// class Inventory {
//   /// Creates the employee class with required details.
//   Inventory({
//     required this.asset,
//     required this.name,
//     required this.serialNo,
//     required this.parentAsset,
//     required this.category,
//   });

//   final String name;

//   final String serialNo;
//   final String parentAsset;
//   final String category;
//   final AssetName asset;
// }

// class AssetName {
//   final String name;
//   final int requirementStatus;
//   final int id;

//   AssetName(this.name, this.requirementStatus, this.id);
// }

// class ColumnAvailability {
//   ColumnAvailability(
//       {required this.text, required this.value, this.isSelected = false});

//   String text;
//   String? value;
//   bool isSelected;
// }

// class InventoryListModel {
//   InventoryListModel({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.type,
//     required this.categoryName,
//     required this.blockName,
//     required this.parentName,
//     required this.serialNumber,
//     required this.customerName,
//     required this.ownerName,
//     required this.operatorName,
//     required this.status,
//   });

//   int id;
//   ColumnAvailability name;
//   ColumnAvailability description;
//   ColumnAvailability type;
//   ColumnAvailability categoryName;
//   ColumnAvailability blockName;
//   ColumnAvailability parentName;
//   ColumnAvailability serialNumber;
//   ColumnAvailability customerName;
//   ColumnAvailability ownerName;
//   ColumnAvailability operatorName;
//   ColumnAvailability status;
// }

// class DropdownModel {
//   DropdownModel({required this.id, required this.name});
//   int? id;
//   String? name;
// }
