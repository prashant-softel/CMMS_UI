import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);
  HomePresenter homePresenter;

  var inventoryList = <InventoryList>[];
  var blockList = <Block>[];
  var equipmentList = <Equipment>[];

  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();
  final typeTextController = TextEditingController();
  final categoryTextController = TextEditingController();
  final serialNoTextController = TextEditingController();
  final statusTextController = TextEditingController();
  final assetNameTextController = TextEditingController();
  final enterMultiplierTextController = TextEditingController();
  final assetDescpTextController = TextEditingController();

  var selectedBlock = Block();
  var selectedEquipment = Equipment();

  var inventoryColumnVisibility = <String>[];

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
    inventoryColumnVisibility.add('plantName'.tr);
    inventoryColumnVisibility.add('assetName'.tr);
    inventoryColumnVisibility.add('assetDescription'.tr);
    inventoryColumnVisibility.add('serialNo'.tr);
    inventoryColumnVisibility.add('parentAsset'.tr);
    inventoryColumnVisibility.add('catergory'.tr);
    inventoryColumnVisibility.add('assetFacilityName'.tr);
    inventoryColumnVisibility.add('assetType'.tr);
    inventoryColumnVisibility.add('assetStatus'.tr);
    inventoryColumnVisibility.add('assetCustomerName'.tr);
    inventoryColumnVisibility.add('assetOwnerName'.tr);
    inventoryColumnVisibility.add('assetOperatorName'.tr);
    inventoryColumnVisibility.add('action'.tr);
  }

  Future<void> getInventoryList() async {
    final list = await homePresenter.getInventoryList(isLoading: false);
    inventoryList = list;
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

  void onSelectEquipment(Equipment equipment) {
    selectedEquipment = equipment;
    parentEquipmentTextController.text = selectedEquipment.name ?? '';

    update(['equipment_list']);
  }

  void onSelectBlock(Block block) {
    selectedBlock = block;
    blockTextController.text = selectedBlock.name ?? '';

    update(['block_field']);
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
