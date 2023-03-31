import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/menu_item.dart';
import '../../domain/models/user_access_model.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);
  HomePresenter homePresenter;

  ///
  var startDateTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;


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
  String categoryIds = '';
  Rx<String> selectedFacility = ''.obs;
  String username = '';
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId => _facilityId.value;

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
      title: "Breakdown Maintenance",
      icon: "assets/files/preventive.png",
    ),
    MenuItem(
      title: "Warranty claim",
      icon: "assets/files/warranty.png",
    ),
    MenuItem(
      title: "Preventive Maintenance",
      icon: "assets/files/preventive.png",
    ),
    MenuItem(
      title: "Corrective Maintenance",
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
    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getuserAccessData();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
      getFacilityList();
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
      _facilityId.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList = await homePresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      username = userAccess.user_name ?? "";
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

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }

        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
