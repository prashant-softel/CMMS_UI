import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/menu_item.dart';

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
  String categoryIds = '';

  /// SIDE MENU WEB
  Rx<int> selectedIndex = 0.obs;
  Rx<NavigationRailLabelType> labelType = NavigationRailLabelType.all.obs;
  Rx<bool> showLeading = true.obs;
  Rx<bool> showTrailing = true.obs;
  Rx<double> groupAligment = 0.0.obs;
  RxList<MenuItem> menuItems = [
    MenuItem(
      title: "Inventory",
      icon: Icons.wysiwyg_outlined,
    ),
    MenuItem(
      title: "Job List",
      icon: Icons.warehouse,
    ),
    MenuItem(
      title: "Warranty",
      icon: Icons.wysiwyg_outlined,
    ),
  ].obs;

  ///

  @override
  void onInit() async {
    await homePresenter.generateToken();

    getInventoryList();
    super.onInit();
  }

  void getInventoryList() async {
    final list = await homePresenter.getInventoryList(
      isLoading: false,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
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
}
