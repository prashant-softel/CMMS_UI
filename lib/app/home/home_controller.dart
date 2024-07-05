import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/dashboard_model.dart';
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
  Rx<String> selectedFacilityName = ''.obs;

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<BlockModel?> blocksList = <BlockModel>[].obs;
  Rx<bool> isBlocksSelected = true.obs;
  Rx<String> selectedBlocks = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;
  RxList<int> selectedFacilityIdList = <int>[].obs;

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
  final categoryMapBM = <String, double>{};
  final categoryMapPM = <String, double>{};
  final categoryMapMC = <String, double>{};

  //int facilityId = 45;
  String categoryIds = '';

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  RxList<EquipmentModel?> equipmentModelList = <EquipmentModel>[].obs;
  RxList<int> selectedEquipmentList = <int>[].obs;
  Rx<bool> isInventorySelected = true.obs;
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedInventory = ''.obs;
  var selectedSection = 0.obs;

  ////
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  var challanDateTc = TextEditingController();

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<DashboardModel?> dashboardList = <DashboardModel?>[].obs;
  Rx<DashboardModel?> dashboardBmList = DashboardModel().obs;
  Rx<DashboardModel?> dashboardPmList = DashboardModel().obs;
  Rx<DashboardModel?> dashboardIrList = DashboardModel().obs;
  Rx<DashboardModel?> dashboardSmList = DashboardModel().obs;
  Rx<DashboardModel?> dashboardMcList = DashboardModel().obs;
  RxList<Itemlist?> allItems = <Itemlist?>[].obs;

  RxList<DashboardModel?> filteredData = <DashboardModel>[].obs;
  List<DashboardModel?>? BufferdashboardList = <DashboardModel?>[].obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;
  BehaviorSubject<String> _facilityName = BehaviorSubject.seeded('');
  Stream<String> get facilityName$ => _facilityName.stream;
  String get facilityName1 => _facilityName.value;
  Rx<int> selectedIndex = 0.obs;
  var isExpanded = false.obs;
  RxBool menuButton = false.obs;
  RxList<FacilityModel?> selectedFacilityNameList = <FacilityModel>[].obs;
  bool openFromDateToStartDatePicker = false;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  RxMap<String, double> getDataMap = <String, double>{}.obs;
  RxMap<String, double> getWoDataMap = <String, double>{}.obs;

  // Map<String, double> getDataMap // = {};
  //     () {
  //   return {
  //     "BM": 5,
  //     "PM": 3,
  //     "MC": 2,
  //     // "PTW": 7,
  //   };
  // }
  List<Map<String, String>> categoryList = [];

  RxInt totalSumMcCount = 0.obs;
  RxInt totalSumBmCount = 0.obs;
  RxInt totalSumPmCount = 0.obs;
  RxInt totalSumCount = 0.obs;

  RxInt totalSum = 0.obs;
  RxInt completedSum = 0.obs;
  RxInt pendingSum = 0.obs;
  RxInt scheduleComplianceTotalSum = 0.obs;
  RxInt scheduleComplianceCompletedSum = 0.obs;
  RxInt scheduleCompliancePendingSum = 0.obs;
  RxInt woOnTimeSum = 0.obs;
  RxInt woDelaySum = 0.obs;
  RxInt woBacklogSum = 0.obs;
  RxInt lowStockItemsSum = 0.obs;
  RxInt poItemsAwaitedSum = 0.obs;
  List<Color> getColorList() {
    return [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.yellowAccent,
      Colors.purpleAccent,
    ];
  }

  List<Color> getWoColorList() {
    return [
      Colors.blue,
      Colors.green,
      Colors.orange,
    ];
  }

  void toggleExpansion() {
    isExpanded.toggle();
  }

  ///

  @override
  void onInit() async {
    // facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
    //   facilityId = event;
    //   if (facilityId > 0) {
    //Future.delayed(Duration(seconds: 2), () async {

    // }
    // });

    Future.delayed(Duration(seconds: 1), () {
      getFacilityListByUserId();
    });
    //  Future.delayed(Duration(seconds: 1), () {
    //   getInventoryCategoryList();
    // });
    // await getTypePermitList();

    super.onInit();
  }

  Future<void> getdashboardList() async {
    dashboardList.value = <DashboardModel>[];
    allItems.value = <Itemlist>[];

    String lststrFacilityIds = selectedFacilityIdList.join(',');

    print({"facilityData1": lststrFacilityIds});

    final _dashboardList = await homePresenter.getdashboardList(
        facilityId: lststrFacilityIds,
        endDate: formattedTodate1,
        startDate: formattedFromdate1,
        isLoading: true);
    if (_dashboardList != null) {
      dashboardList.value = _dashboardList;
      int totalSumMcCountTemp = 0;
      int totalSumPmCountTemp = 0;
      int totalSumBmcCountTemp = 0;
      int totalSumCountTemp = 0;

      int totalSumTemp = 0;
      int completedSumTemp = 0;
      int pendingSumTemp = 0;
      int scheduleComplianceTotalSumTemp = 0;
      int scheduleComplianceCompletedSumTemp = 0;
      int scheduleCompliancePendingSumTemp = 0;
      int woOnTimeSumTemp = 0;
      int woDelaySumTemp = 0;
      int woBacklogSumTemp = 0;
      int lowStockItemsSumTemp = 0;
      int poItemsAwaitedSumTemp = 0;

      for (var module in dashboardList) {
        if (module?.module_name == 'Breakdown Maintenance' ||
            module?.module_name == 'Preventive Maintenance' ||
            module?.module_name == 'Module Cleaning') {
          totalSumMcCountTemp += module?.category_mc_count ?? 0;
          totalSumBmcCountTemp += module?.category_bm_count ?? 0;
          totalSumPmCountTemp += module?.category_pm_count ?? 0;
          totalSumCountTemp += module?.category_total_count ?? 0;

          var details = module?.cmDashboadDetails;
          totalSumTemp += details?.total ?? 0;
          completedSumTemp += details?.completed ?? 0;
          pendingSumTemp += details?.pending ?? 0;
          scheduleComplianceTotalSumTemp +=
              details?.schedule_compliance_total ?? 0;
          scheduleComplianceCompletedSumTemp +=
              details?.schedule_compliance_completed ?? 0;
          scheduleCompliancePendingSumTemp +=
              details?.schedule_compliance_pending ?? 0;
          woOnTimeSumTemp += details?.wo_on_time ?? 0;
          woDelaySumTemp += details?.wo_delay ?? 0;
          woBacklogSumTemp += details?.wo_backlog ?? 0;

          allItems.addAll(details?.item_list ?? []);
        }
      }

      totalSumMcCount.value = totalSumMcCountTemp;
      totalSumPmCount.value = totalSumPmCountTemp;
      totalSumBmCount.value = totalSumBmcCountTemp;
      totalSumCount.value = totalSumCountTemp;
      totalSum.value = totalSumTemp;

      completedSum.value = completedSumTemp;
      pendingSum.value = pendingSumTemp;
      scheduleComplianceTotalSum.value = scheduleComplianceTotalSumTemp;
      scheduleComplianceCompletedSum.value = scheduleComplianceCompletedSumTemp;
      scheduleCompliancePendingSum.value = scheduleCompliancePendingSumTemp;
      woOnTimeSum.value = woOnTimeSumTemp;
      woDelaySum.value = woDelaySumTemp;
      woBacklogSum.value = woBacklogSumTemp;
      lowStockItemsSum.value = lowStockItemsSumTemp;
      poItemsAwaitedSum.value = poItemsAwaitedSumTemp;
      Map<String, double> dataMap() {
        return {
          "BM": double.tryParse(totalSumBmcCountTemp.toString()) ?? 0.0,
          "PM": double.tryParse(totalSumPmCountTemp.toString()) ?? 0.0,
          "MC": double.tryParse(totalSumMcCountTemp.toString()) ?? 0.0,
        };
      }

      getDataMap.value = dataMap();
      dashboardBmList.value = _dashboardList[0];
      dashboardPmList.value = _dashboardList[1];
      dashboardMcList.value = _dashboardList[2];
      dashboardIrList.value = _dashboardList[3];
      dashboardSmList.value = _dashboardList[4];

      if (dashboardBmList.value != null) {
        for (var item
            in dashboardBmList?.value!.cmDashboadDetails!.item_list ?? []) {
          final categories = item.asset_category?.split(', ') ?? [];
          for (var category in categories) {
            if (categoryMapBM.containsKey(category)) {
              categoryMapBM[category] = categoryMapBM[category]! + 1;
            } else {
              categoryMapBM[category] = 1;
            }
          }
        }
        final sortedCategories = categoryMapBM.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final top5Categories = sortedCategories.take(5).toList();
        categoryMapBM.clear();
        for (var entry in top5Categories) {
          categoryMapBM[entry.key] = entry.value.toDouble();
        }
      }

      if (dashboardPmList.value != null) {
        for (var item
            in dashboardPmList?.value!.cmDashboadDetails!.item_list ?? []) {
          final categories = item.asset_category?.split(', ') ?? [];
          for (var category in categories) {
            if (categoryMapPM.containsKey(category)) {
              categoryMapPM[category] = categoryMapPM[category]! + 1;
            } else {
              categoryMapPM[category] = 1;
            }
          }
        }
        final sortedCategories = categoryMapPM.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final top5Categories = sortedCategories.take(5).toList();
        categoryMapPM.clear();
        for (var entry in top5Categories) {
          categoryMapPM[entry.key] = entry.value.toDouble();
        }
      }
      // if (dashboardMcList.value != null) {
      //   for (var item
      //       in dashboardMcList?.value!.cmDashboadDetails!.item_list ?? []) {
      //     final categories = item.asset_category?.split(', ') ?? [];
      //     for (var category in categories) {
      //       if (categoryMapMC.containsKey(category)) {
      //         categoryMapMC[category] = categoryMapMC[category]! + 1;
      //       } else {
      //         categoryMapMC[category] = 1;
      //       }
      //     }
      //   }
      //   final sortedCategories = categoryMapMC.entries.toList()
      //     ..sort((a, b) => b.value.compareTo(a.value));
      //   final top5Categories = sortedCategories.take(5).toList();
      //   categoryMapMC.clear();
      //   for (var entry in top5Categories) {
      //     categoryMapMC[entry.key] = entry.value.toDouble();
      //   }
      // }

      update(['dashboard']);
    }
  }

  void clearStoreData() {
    homePresenter.clearValue();
  }

  void clearStoreJobData() {
    homePresenter.jobclearValue();
  }

  void clearStorePmData() {
    homePresenter.pmclearValue();
  }

  void clearStoreIrData() {
    homePresenter.iRclearValue();
  }

  void onChartTapped(int index) {
    selectedSection.value = index;
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

  void selectedMultiFacility(List<int> _selectedFacilityIds) {
    selectedFacilityIdList.clear(); // Clear the existing list
    selectedFacilityIdList
        .addAll(_selectedFacilityIds); // Add the new selections
    print('Selected facility IDs: ${selectedFacilityIdList}');
    getdashboardList();
  }

  Future<void> getFacilityListByUserId() async {
    final _facilityList = await homePresenter.getFacilityListByUserId();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
        selectedFacilityIdList.add(facility?.id ?? 0);
      }
      getuserAccessData();

      final facilityData = await homePresenter.getValue();
      print({"facilityData": selectedFacilityIdList});
      Map<String, dynamic> savaData =
          facilityData != '' ? jsonDecode(facilityData ?? '{}') : {};
      selectedFacility.value = savaData['name'] ?? facilityList[0]?.name ?? '';
      print({"selected facality": selectedFacility});
      _facilityId.sink.add(savaData['id'] ?? facilityList[0]?.id ?? 0);
      _facilityName.sink.add(savaData['name'] ?? facilityList[0]?.name ?? '');

      await getdashboardList();
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList = await homePresenter.getInventoryCategoryList(
      isLoading: true,
    );

    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await homePresenter.getInventoryList(
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

  void getDashBordListByDate() {
    getdashboardList();
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList =
        await homePresenter.getTypePermitList(facility_id: facilityId);

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList = await homePresenter.getUserAcessValue();

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
      case const (RxList<FacilityModel>):
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacility.value = facilityList[facilityIndex]?.name ?? '';

          print({"selected facality11": selectedFacility});
          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          _facilityName.add(facilityList[facilityIndex]?.name ?? '');
          String facilitydata = jsonEncode({
            "id": facilityList[facilityIndex]?.id,
            "name": facilityList[facilityIndex]?.name
          });
          homePresenter.saveValue(facilitydata: facilitydata);
        }
        break;
      case const (RxList<InventoryModel>):
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
