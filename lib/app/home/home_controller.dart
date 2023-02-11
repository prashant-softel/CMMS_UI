import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);
  HomePresenter homePresenter;

  ///
  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];
  var equipmentList = <EquipmentModel>[];

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

  ///

  var inventoryColumnVisibility = <ColumnAvailability>[];
  var selectedInventoryColumnVisibility = <ColumnAvailability>[];


  @override
  void onInit() async {
    print('Onint ');

    await homePresenter.generateToken();
    Future.delayed(Duration(milliseconds: 500), () async {
      getInventoryList();
    });

    super.onInit();
  }

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

  Future<void> getInventoryList() async {
    final list = await homePresenter.getInventoryList(
      isLoading: false,
      categoryId: categoryId,
      facilityId: facilityId,
    );
    inventoryList = list;

    // for (var i in list) {
    //   dynamicInventoryList.add(
    //     InventoryListModel(
    //       id: i.id,
    //       blockName: ColumnAvailability(
    //         value: i.blockName ?? '',
    //         text: 'blockName'.tr,
    //       ),
    //       categoryName: ColumnAvailability(
    //         value: i.categoryName ?? '',
    //         text: 'category'.tr,
    //       ),
    //       customerName: ColumnAvailability(
    //         value: i.customerName ?? '',
    //         text: 'assetCustomerName'.tr,
    //       ),
    //       description: ColumnAvailability(
    //         value: i.description ?? '',
    //         text: 'assetDescription'.tr,
    //       ),
    //       name: ColumnAvailability(
    //         value: i.name ?? '',
    //         text: 'assetName'.tr,
    //       ),
    //       operatorName: ColumnAvailability(
    //         value: i.operatorName ?? '',
    //         text: 'assetOperatorName'.tr,
    //       ),
    //       ownerName: ColumnAvailability(
    //         value: i.ownerName ?? '',
    //         text: 'assetOwnerName'.tr,
    //       ),
    //       parentName: ColumnAvailability(
    //         value: i.parentName ?? '',
    //         text: 'parentAsset'.tr,
    //       ),
    //       serialNumber: ColumnAvailability(
    //         value: i.serialNumber ?? '',
    //         text: 'serialNo'.tr,
    //       ),
    //       status: ColumnAvailability(
    //         value: i.status ?? '',
    //         text: 'assetStatus'.tr,
    //       ),
    //       type: ColumnAvailability(
    //         value: i.type ?? '',
    //         text: 'assetType'.tr,
    //       ),
    //     ),
    //   );
    // }

    onInitializeData();
    update(['inventory_list']);
  }

  void getBlockList(String facilityId) async {
    final list = await homePresenter.getBlockList(
        isLoading: false, facilityId: facilityId);
    blockList = list;
    update(['block_list']);
  }

  void getEquipmentList({
    required String facilityId,
  }) async {
    final list = await homePresenter.getEquipmentList(
      isLoading: false,
      facilityId: facilityId,
    );
    equipmentList = list;
    update(['equipment_list']);
  }

  void onSelectEquipment(EquipmentModel equipment) {
    selectedEquipment = equipment;
    parentEquipmentTextController.text = selectedEquipment.name ?? '';

    update(['equipment_list']);
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
