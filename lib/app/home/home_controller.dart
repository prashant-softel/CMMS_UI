import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
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
  String username = '';

  Rx<String> selectedFacility = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  /// SIDE MENU WEB
  Rx<int> selectedIndex = 0.obs;
  RxList<MenuItem> menuItems = [
    MenuItem(
      title: "DashBoard",
      icon: "assets/files/home.png",
    ),
    MenuItem(
      title: "Inventory",
      icon: "assets/files/warranty.png",
    ),
    MenuItem(
      title: "Job List",
      icon: "assets/files/preventive.png",
    ),
    MenuItem(
      title: "Warranty claim",
      icon: "assets/files/warranty.png",
    ),
    MenuItem(
      title: "Preventive",
      icon: "assets/files/preventive.png",
    ),
    MenuItem(
      title: "Corrective Maint",
      icon: "assets/files/maint.png",
    ),
    MenuItem(
      title: "Module Cleaning",
      icon: "assets/files/maintenance.png",
    ),
    MenuItem(
      title: "Vegetation Control",
      icon: "assets/files/preventive.png",
    ),
    MenuItem(
      title: "Incident Report",
      icon: "assets/files/reportins.png",
    ),
    MenuItem(
      title: "Calibration",
      icon: "assets/files/preventive.png",
    ),
    MenuItem(
      title: "Misc",
      icon: "assets/files/misc.png",
    ),
    MenuItem(
      title: "Settings",
      icon: "assets/files/setting.png",
    ),
    MenuItem(
      title: "Log Out",
      icon: "assets/files/dashboard.png",
    ),
  ].obs;

  ///

  @override
  void onInit() async {
    //await homePresenter.generateToken();

    username = Get.arguments;
    // getFacilityList();

    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
    });
    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await homePresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  void getInventoryList() async {
    final list = await homePresenter.getInventoryList(
      isLoading: true,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
    inventoryList = list;
    paginationController = PaginationController(
      rowCount: inventoryList.length,
      rowsPerPage: 10,
    );
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
