import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);
  HomePresenter homePresenter;

  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;

  //Permit Type list
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<BlockModel?> blocksList = <BlockModel>[].obs;
  Rx<bool> isBlocksSelected = true.obs;
  Rx<String> selectedBlocks = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;

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

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  Rx<int> selectedIndex = 0.obs;

  ///

  @override
  void onInit() async {
    // facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
    //   facilityId = event;

    //   Future.delayed(Duration(seconds: 1), () {
    //     getBlocksList(facilityId);
    //   });
    // });

    Future.delayed(Duration(seconds: 1), () async {
      await getuserAccessData();
    });
    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    // await getTypePermitList();

    super.onInit();
  }

  Future<void> getBlocksList(int _facilityId) async {
    blocksList.value = <BlockModel>[];
    final _blockList =
        await homePresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blocksList.add(block);
      }
      update(["blockList"]);
    }
  }

  Future<void> getFacilityList() async {
    final _facilityList = await homePresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList = await homePresenter.getTypePermitList();

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList = await homePresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
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
      case RxList<InventoryModel>:
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
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
