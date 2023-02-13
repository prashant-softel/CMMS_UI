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

  @override
  void onInit() async {
    await homePresenter.generateToken();

    super.onInit();
  }

  void getInventoryList() async {
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
