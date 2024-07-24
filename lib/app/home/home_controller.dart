import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);
  HomePresenter homePresenter;

  // RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  // RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  // RxList<int?> selectedWorkAreaIdList = <int>[].obs;

  //Permit Type list
  // RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  // Rx<bool> isTypePermitSelected = true.obs;
  // Rx<String> selectedTypePermit = ''.obs;
  // Rx<String> selectedTypeOfPermit = ''.obs;
  // Rx<bool> isTypePermit = true.obs;
  // Rx<String> selectedFacilityName = ''.obs;

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  // RxList<BlockModel?> blocksList = <BlockModel>[].obs;
  // Rx<bool> isBlocksSelected = true.obs;
  // Rx<String> selectedBlocks = ''.obs;
  // Rx<bool> isstartdateFieldSelected = true.obs;
  RxList<int> selectedFacilityIdList = <int>[].obs;

  // var inventoryList = <InventoryModel>[];
  // var blockList = <BlockModel>[];
  // var equipmentList = <EquipmentModel>[];
  // final blockTextController = TextEditingController();
  // final parentEquipmentTextController = TextEditingController();
  // final typeTextController = TextEditingController();
  // final categoryTextController = TextEditingController();
  // final serialNoTextController = TextEditingController();
  // final statusTextController = TextEditingController();
  // final assetNameTextController = TextEditingController();
  // final enterMultiplierTextController = TextEditingController();
  // final assetDescpTextController = TextEditingController();
  // var selectedBlock = BlockModel();
  // var selectedEquipment = EquipmentModel();
  // final categoryMapBM = <String, double>{};
  // final categoryMapPM = <String, double>{};
  // final categoryMapMC = <String, double>{};
  // Map<String, double> categoryMapBMDouble = <String, double>{};
  // Map<String, double> categoryMapPMDouble = <String, double>{};
  // Map<String, double> categoryMapSMDouble = <String, double>{};
  // Map<String, double> categoryMapIRDouble = <String, double>{};

  // Map<String, double> categoryMapSmConsumptionDouble = <String, double>{};
  // Map<String, double> categoryMapSmConsumptionSiteDouble = <String, double>{};
  // Map<String, double> categoryMapSmAvailableDouble = <String, double>{};
  // Map<String, double> categoryMapSmAvailableSiteDouble = <String, double>{};
  // Map<String, double> stockOverviewmap = <String, double>{};

  //int facilityId = 45;
  String categoryIds = '';

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  // RxList<EquipmentModel?> equipmentModelList = <EquipmentModel>[].obs;
  // RxList<int> selectedEquipmentList = <int>[].obs;
  // Rx<bool> isInventorySelected = true.obs;
  // RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  // Rx<String> selectedInventory = ''.obs;
  // var selectedSection = 0.obs;

  ////
  // RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  // RxList<InventoryCategoryModel?> equipmentCategoryList =
  //     <InventoryCategoryModel>[].obs;
  // var challanDateTc = TextEditingController();

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  // PaginationController paginationController = PaginationController(
  //   rowCount: 0,
  //   rowsPerPage: 10,
  // );
  // RxList<DashboardModel?> dashboardList = <DashboardModel?>[].obs;
  // Rx<DashboardModel?> dashboardBmList = DashboardModel().obs;
  // Rx<DashboardModel?> dashboardPmList = DashboardModel().obs;
  // Rx<DashboardModel?> dashboardIrList = DashboardModel().obs;
  // Rx<DashboardModel?> dashboardSmList = DashboardModel().obs;
  // Rx<DashboardModel?> dashboardMcList = DashboardModel().obs;
  // RxList<Itemlist?> allItems = <Itemlist?>[].obs;

  // RxList<DashboardModel?> filteredData = <DashboardModel>[].obs;
  // List<DashboardModel?>? BufferdashboardList = <DashboardModel?>[].obs;
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
  // bool openFromDateToStartDatePicker = false;
  // Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  // Rx<DateTime> toDate = DateTime.now().obs;

  // String get formattedFromdate =>
  //     DateFormat('dd/MM/yyyy').format(fromDate.value);
  // String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  // String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  // String get formattedFromdate1 =>
  //     DateFormat('yyyy-MM-dd').format(fromDate.value);
  // RxMap<String, double> getDataMap = <String, double>{}.obs;
  // RxMap<String, double> getWoDataMap = <String, double>{}.obs;

  // Map<String, double> getDataMap // = {};
  //     () {
  //   return {
  //     "BM": 5,
  //     "PM": 3,
  //     "MC": 2,
  //     // "PTW": 7,
  //   };
  // }
  // List<Map<String, String>> categoryList = [];

  // RxInt totalSumMcCount = 0.obs;
  // RxInt totalSumBmCount = 0.obs;
  // RxInt totalSumPmCount = 0.obs;
  // RxInt totalSumCount = 0.obs;

  // RxInt totalSum = 0.obs;
  // RxInt completedSum = 0.obs;
  // RxInt pendingSum = 0.obs;
  // RxInt scheduleComplianceTotalSum = 0.obs;
  // RxInt scheduleComplianceCompletedSum = 0.obs;
  // RxInt scheduleCompliancePendingSum = 0.obs;
  // RxInt woOnTimeSum = 0.obs;
  // RxInt woDelaySum = 0.obs;
  // RxInt woBacklogSum = 0.obs;
  // RxInt lowStockItemsSum = 0.obs;
  // RxInt poItemsAwaitedSum = 0.obs;
  // List<Color> getColorList() {
  //   return [
  //     Colors.blue,
  //     Colors.green,
  //     Colors.orange,
  //     Colors.yellowAccent,
  //     Color.fromARGB(255, 61, 149, 114),
  //     Colors.purpleAccent,
  //   ];
  // }

  // List<Color> getColorIrList() {
  //   return [
  //     Colors.blue,
  //     Colors.blue,
  //     Colors.blue,
  //     Colors.blue,
  //     Colors.blue,
  //     Colors.blue,
  //   ];
  // }

  // var index = 0;
  // List<Color> colorList() {
  //   return [
  //     const Color.fromARGB(255, 2, 63, 114),
  //     Colors.green,
  //     Color.fromARGB(255, 147, 42, 42),
  //     Color.fromARGB(255, 96, 154, 98),
  //   ];
  // }

  // List<Color> getWoColorList() {
  //   return [
  //     Colors.blue,
  //     Colors.green,
  //     Colors.orange,
  //   ];
  // }

  void toggleExpansion() {
    isExpanded.toggle();
  }

  // var isToggleOn = false.obs;

  // void toggle() {
  //   isToggleOn.value = !isToggleOn.value;
  // }

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

//   Future<void> getdashboardList() async {
//     dashboardList.value = <DashboardModel>[];
//     allItems.value = <Itemlist>[];

//     String lststrFacilityIds = selectedFacilityIdList.join(',');

//     print({"facilityData1": lststrFacilityIds});

//     final _dashboardList = await homePresenter.getdashboardList(
//         facilityId: lststrFacilityIds,
//         endDate: formattedTodate1,
//         startDate: formattedFromdate1,
//         isLoading: true);

//     if (_dashboardList != null) {
//       dashboardList.value = _dashboardList;
//       int totalSumMcCountTemp = 0;
//       int totalSumPmCountTemp = 0;
//       int totalSumBmcCountTemp = 0;
//       int totalSumCountTemp = 0;

//       int totalSumTemp = 0;
//       int completedSumTemp = 0;
//       int pendingSumTemp = 0;
//       int scheduleComplianceTotalSumTemp = 0;
//       int scheduleComplianceCompletedSumTemp = 0;
//       int scheduleCompliancePendingSumTemp = 0;
//       int woOnTimeSumTemp = 0;
//       int woDelaySumTemp = 0;
//       int woBacklogSumTemp = 0;
//       int lowStockItemsSumTemp = 0;
//       int poItemsAwaitedSumTemp = 0;

//       for (var module in dashboardList) {
//         if (module?.module_name == 'Breakdown Maintenance' ||
//             module?.module_name == 'Preventive Maintenance' ||
//             module?.module_name == 'Module Cleaning') {
//           totalSumMcCountTemp += module?.category_mc_count ?? 0;
//           totalSumBmcCountTemp += module?.category_bm_count ?? 0;
//           totalSumPmCountTemp += module?.category_pm_count ?? 0;
//           totalSumCountTemp += module?.category_total_count ?? 0;

//           var details = module?.cmDashboadDetails;
//           totalSumTemp += details?.total ?? 0;
//           completedSumTemp += details?.completed ?? 0;
//           pendingSumTemp += details?.pending ?? 0;
//           scheduleComplianceTotalSumTemp +=
//               details?.schedule_compliance_total ?? 0;
//           scheduleComplianceCompletedSumTemp +=
//               details?.schedule_compliance_completed ?? 0;
//           scheduleCompliancePendingSumTemp +=
//               details?.schedule_compliance_pending ?? 0;
//           woOnTimeSumTemp += details?.wo_on_time ?? 0;
//           woDelaySumTemp += details?.wo_delay ?? 0;
//           woBacklogSumTemp += details?.wo_backlog ?? 0;
//           allItems.addAll(details?.item_list ?? []);
//         }
//       }

//       totalSumMcCount.value = totalSumMcCountTemp;
//       totalSumPmCount.value = totalSumPmCountTemp;
//       totalSumBmCount.value = totalSumBmcCountTemp;
//       totalSumCount.value = totalSumCountTemp;
//       totalSum.value = totalSumTemp;

//       completedSum.value = completedSumTemp;
//       pendingSum.value = pendingSumTemp;
//       scheduleComplianceTotalSum.value = scheduleComplianceTotalSumTemp;
//       scheduleComplianceCompletedSum.value = scheduleComplianceCompletedSumTemp;
//       scheduleCompliancePendingSum.value = scheduleCompliancePendingSumTemp;
//       woOnTimeSum.value = woOnTimeSumTemp;
//       woDelaySum.value = woDelaySumTemp;
//       woBacklogSum.value = woBacklogSumTemp;
//       lowStockItemsSum.value = lowStockItemsSumTemp;
//       poItemsAwaitedSum.value = poItemsAwaitedSumTemp;

//       Map<String, double> dataMap() {
//         return {
//           "BM": double.tryParse(totalSumBmcCountTemp.toString()) ?? 0.0,
//           "PM": double.tryParse(totalSumPmCountTemp.toString()) ?? 0.0,
//           "MC": double.tryParse(totalSumMcCountTemp.toString()) ?? 0.0,
//         };
//       }

//       getDataMap.value = dataMap();
//       dashboardBmList.value = _dashboardList[0];
//       dashboardPmList.value = _dashboardList[1];
//       dashboardMcList.value = _dashboardList[2];
//       dashboardIrList.value = _dashboardList[3];
//       dashboardSmList.value = _dashboardList[4];
//       if (dashboardBmList.value != null) {
//         final categoryMapBM = <String, int>{};

//         for (var item
//             in dashboardBmList.value!.cmDashboadDetails!.item_list ?? []) {
//           final categories = item.asset_category?.split(', ') ?? [];
//           for (var category in categories) {
//             if (categoryMapBM.containsKey(category)) {
//               categoryMapBM[category] = categoryMapBM[category]! + 1;
//             } else {
//               categoryMapBM[category] = 1;
//             }
//           }
//         }

//         final sortedCategories = categoryMapBM.entries.toList()
//           ..sort((a, b) => b.value.compareTo(a.value));
//         final top5Categories = sortedCategories.take(5).toList();
//         final otherCategoriesCount = sortedCategories.skip(5).fold<int>(
//               0,
//               (sum, entry) => sum + entry.value,
//             );

//         categoryMapBM.clear();
//         for (var entry in top5Categories) {
//           categoryMapBM[entry.key] = entry.value;
//         }
//         if (otherCategoriesCount > 0) {
//           categoryMapBM['Other'] = otherCategoriesCount;
//         }

//         categoryMapBMDouble = categoryMapBM
//             .map((key, value) => MapEntry(key, (value.toDouble())));
//       }
//       if (dashboardPmList.value != null) {
//         final categoryMapPm = <String, int>{};

//         for (var item
//             in dashboardPmList.value!.cmDashboadDetails!.item_list ?? []) {
//           final categories = item.asset_category?.split(', ') ?? [];
//           for (var category in categories) {
//             if (categoryMapPm.containsKey(category)) {
//               categoryMapPm[category] = categoryMapPm[category]! + 1;
//             } else {
//               categoryMapPm[category] = 1;
//             }
//           }
//         }

//         final sortedCategories = categoryMapPm.entries.toList()
//           ..sort((a, b) => b.value.compareTo(a.value));
//         final top5Categories = sortedCategories.take(5).toList();
//         final otherCategoriesCount = sortedCategories.skip(5).fold<int>(
//               0,
//               (sum, entry) => sum + entry.value,
//             );

//         categoryMapPm.clear();
//         for (var entry in top5Categories) {
//           categoryMapPm[entry.key] = entry.value;
//         }
//         if (otherCategoriesCount > 0) {
//           categoryMapPm['Other'] = otherCategoriesCount;
//         }

//         categoryMapPMDouble = categoryMapPm
//             .map((key, value) => MapEntry(key, (value.toDouble())));
//       }
//       if (dashboardIrList.value != null) {
//         final categoryMapIr = <String, int>{};

//         for (var item
//             in dashboardIrList.value!.cmDashboadDetails!.item_list ?? []) {
//           final categories = item.type_of_incident?.split(', ') ?? [];
//           for (var category in categories) {
//             if (categoryMapIr.containsKey(category)) {
//               categoryMapIr[category] = categoryMapIr[category]! + 1;
//             } else {
//               categoryMapIr[category] = 1;
//             }
//           }
//         }

//         final sortedCategories = categoryMapIr.entries.toList()
//           ..sort((a, b) => b.value.compareTo(a.value));
//         final topCategories = sortedCategories.toList();

//         categoryMapIr.clear();
//         for (var entry in topCategories) {
//           categoryMapIr[entry.key] = entry.value;
//         }

//         categoryMapIRDouble = categoryMapIr
//             .map((key, value) => MapEntry(key, (value.toDouble())));
//       }

//       if (dashboardSmList.value != null) {
//         final categoryMapSmConsumption = <String, double>{};
//         final categoryMapSmConsumptionSites = <String, double>{};
//         final categoryMapSmAvailable = <String, double>{};
//         final categoryMapSmAvailableSites = <String, double>{};

//         if (dashboardSmList.value?.cmDashboadDetails?.stockConsumptionByGoods !=
//             null) {
//           for (var item
//               in dashboardSmList.value?.cmDashboadDetails?.stockOverview ??
//                   []) {
//             if (stockOverviewmap.containsKey(item.key)) {
//               stockOverviewmap[item.key!] =
//                   stockOverviewmap[item.key!]! + item.value!;
//             } else {
//               stockOverviewmap[item.key!] = item.value!.toDouble();
//             }
//           }
//           for (var item in dashboardSmList
//                   .value?.cmDashboadDetails?.stockConsumptionByGoods ??
//               []) {
//             if (categoryMapSmConsumption.containsKey(item.key)) {
//               categoryMapSmConsumption[item.key!] =
//                   categoryMapSmConsumption[item.key!]! + item.value!;
//             } else {
//               categoryMapSmConsumption[item.key!] = item.value!.toDouble();
//             }
//           }
//           for (var item in dashboardSmList
//                   .value?.cmDashboadDetails?.stockConsumptionBySites ??
//               []) {
//             if (categoryMapSmConsumptionSites.containsKey(item.key)) {
//               categoryMapSmConsumptionSites[item.key!] =
//                   categoryMapSmConsumptionSites[item.key!]! + item.value!;
//             } else {
//               categoryMapSmConsumptionSites[item.key!] = item.value!.toDouble();
//             }
//           }
//           for (var item in dashboardSmList
//                   .value?.cmDashboadDetails?.stockAvailbleByGoods ??
//               []) {
//             if (categoryMapSmAvailable.containsKey(item.key)) {
//               categoryMapSmAvailable[item.key!] =
//                   categoryMapSmAvailable[item.key!]! + item.value!;
//             } else {
//               categoryMapSmAvailable[item.key!] = item.value!.toDouble();
//             }
//           }
//           for (var item in dashboardSmList
//                   .value?.cmDashboadDetails?.stockAvailbleBySites ??
//               []) {
//             if (categoryMapSmAvailableSites.containsKey(item.key)) {
//               categoryMapSmAvailableSites[item.key!] =
//                   categoryMapSmAvailableSites[item.key!]! + item.value!;
//             } else {
//               categoryMapSmAvailableSites[item.key!] = item.value!.toDouble();
//             }
//           }
//         }
// ////stock overview
//         // final sortedCategoriesstock = stockOverviewmap.entries.toList()
//         //   ..sort((a, b) => b.value.compareTo(a.value));
//         // final top5CategoriesStock = sortedCategoriesstock.take(5).toList();
//         // final otherStockCount = sortedCategoriesstock.skip(5).fold<double>(
//         //       0.0,
//         //       (sum, entry) => sum + entry.value,
//         //     );

//         // final top5StockOverview = <String, double>{};
//         // for (var entry in top5CategoriesStock) {
//         //   top5StockOverview[entry.key] = entry.value;
//         // }
//         // if (otherStockCount > 0) {
//         //   top5StockOverview['Other'] = otherStockCount;
//         // }

//         // stockOverviewDouble = top5StockOverview;

//         ///good consumption
//         final sortedCategories = categoryMapSmConsumption.entries.toList()
//           ..sort((a, b) => b.value.compareTo(a.value));
//         final top5Categories = sortedCategories.take(5).toList();
//         final otherCategoriesCount = sortedCategories.skip(5).fold<double>(
//               0.0,
//               (sum, entry) => sum + entry.value,
//             );

//         final top5CategoryMapSmConsumption = <String, double>{};
//         for (var entry in top5Categories) {
//           top5CategoryMapSmConsumption[entry.key] = entry.value;
//         }
//         if (otherCategoriesCount > 0) {
//           top5CategoryMapSmConsumption['Other'] = otherCategoriesCount;
//         }

//         categoryMapSmConsumptionDouble = top5CategoryMapSmConsumption;

//         ///sites consumption
//         final sortedCategoriesConsumptionSites =
//             categoryMapSmConsumptionSites.entries.toList()
//               ..sort((a, b) => b.value.compareTo(a.value));
//         final top5CategoriesConsumptionSites =
//             sortedCategoriesConsumptionSites.take(5).toList();
//         final otherCategoriesCountConsumptionSites =
//             sortedCategoriesConsumptionSites.skip(5).fold<double>(
//                   0.0,
//                   (sum, entry) => sum + entry.value,
//                 );

//         final top5CategoryMapSmConsumptionSites = <String, double>{};
//         for (var entry in top5CategoriesConsumptionSites) {
//           top5CategoryMapSmConsumptionSites[entry.key] = entry.value;
//         }
//         if (otherCategoriesCountConsumptionSites > 0) {
//           top5CategoryMapSmConsumptionSites['Other'] =
//               otherCategoriesCountConsumptionSites;
//         }

//         categoryMapSmConsumptionSiteDouble = top5CategoryMapSmConsumptionSites;
//         ////Available good
//         final sortedCategoriesAvailable = categoryMapSmAvailable.entries
//             .toList()
//           ..sort((a, b) => b.value.compareTo(a.value));
//         final top5CategoriesAvailable =
//             sortedCategoriesAvailable.take(5).toList();
//         final otherCategoriesCountAvailable =
//             sortedCategoriesAvailable.skip(5).fold<double>(
//                   0.0,
//                   (sum, entry) => sum + entry.value,
//                 );

//         final top5CategoryMapAvailable = <String, double>{};
//         for (var entry in top5CategoriesAvailable) {
//           top5CategoryMapAvailable[entry.key] = entry.value;
//         }
//         if (otherCategoriesCountAvailable > 0) {
//           top5CategoryMapAvailable['Other'] = otherCategoriesCountAvailable;
//         }

//         categoryMapSmAvailableDouble = top5CategoryMapAvailable;
//         ////Available Site
//         final sortedCategoriesAvailableSites =
//             categoryMapSmAvailableSites.entries.toList()
//               ..sort((a, b) => b.value.compareTo(a.value));
//         final top5CategoriesAvailableSites =
//             sortedCategoriesAvailableSites.take(5).toList();
//         final otherCategoriesCountAvailableSites =
//             sortedCategoriesAvailableSites.skip(5).fold<double>(
//                   0.0,
//                   (sum, entry) => sum + entry.value,
//                 );

//         final top5CategoryMapAvailableSites = <String, double>{};
//         for (var entry in top5CategoriesAvailableSites) {
//           top5CategoryMapAvailableSites[entry.key] = entry.value;
//         }
//         if (otherCategoriesCountAvailableSites > 0) {
//           top5CategoryMapAvailableSites['Other'] =
//               otherCategoriesCountAvailableSites;
//         }

//         categoryMapSmAvailableSiteDouble = top5CategoryMapAvailableSites;
//       }

//       update(['dashboard']);
//     }
//   }

  void clearStoreData() {
    homePresenter.clearValue();
  }

  // void clearStoreJobData() {
  //   homePresenter.jobclearValue();
  // }

  // void clearStorePmData() {
  //   homePresenter.pmclearValue();
  // }

  // void clearStoreIrData() {
  //   homePresenter.iRclearValue();
  // }

  // void onChartTapped(int index) {
  //   selectedSection.value = index;
  // }

  // Future<void> getBlocksList(int _facilityId) async {
  //   blocksList.value = <BlockModel>[];
  //   final _blockList =
  //       await homePresenter.getBlocksList(facilityId: _facilityId);

  //   if (_blockList != null) {
  //     for (var block in _blockList) {
  //       blocksList.add(block);
  //     }
  //     update(["blockList"]);
  //   }
  // }
  // void selectedMultiFacility(List<int> _selectedFacilityIds) {
  //   selectedFacilityIdList.clear(); // Clear the existing list
  //   selectedFacilityIdList
  //       .addAll(_selectedFacilityIds); // Add the new selections
  //   print('Selected facility IDs: ${selectedFacilityIdList}');
  //   // getdashboardList();
  // }

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

      // await getdashboardList();
    }
  }

  // Future<void> getInventoryCategoryList({String? facilityId}) async {
  //   equipmentCategoryList.value = <InventoryCategoryModel>[];
  //   final _equipmentCategoryList = await homePresenter.getInventoryCategoryList(
  //     isLoading: true,
  //   );

  //   if (_equipmentCategoryList != null) {
  //     for (var equimentCategory in _equipmentCategoryList) {
  //       equipmentCategoryList.add(equimentCategory);
  //     }
  //   }
  // }

  // void getInventoryList() async {
  //   eqipmentNameList.value = <InventoryModel>[];
  //   final _inventoryList = await homePresenter.getInventoryList(
  //     isLoading: true,
  //     categoryIds: categoryIds,
  //     facilityId: facilityId,
  //   );
  //   //  print('equipment Name List:$inventoryNameList');
  //   for (var inventory_list in _inventoryList) {
  //     eqipmentNameList.add(inventory_list);
  //   }
  //   inventoryList = _inventoryList;
  //   paginationController = PaginationController(
  //     rowCount: eqipmentNameList.length,
  //     rowsPerPage: 10,
  //   );
  //   update(['inventory_list']);
  // }

  // void getDashBordListByDate() {
  //   // getdashboardList();
  // }

  // Future<void> getTypePermitList() async {
  //   final _permitTypeList =
  //       await homePresenter.getTypePermitList(facility_id: facilityId);

  //   if (_permitTypeList != null) {
  //     for (var permitType in _permitTypeList) {
  //       typePermitList.add(permitType);
  //     }
  //     // selectedTypePermit.value = typePermitList[0]?.name ?? '';
  //   }
  // }

  Future<void> getuserAccessData() async {
    final _userAccessList = await homePresenter.getUserAcessValue();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

  // void getBlockList(String facilityId) async {
  //   final list = await homePresenter.getBlockList(
  //       isLoading: false, facilityId: facilityId);
  //   blockList = list;
  //   update(['block_list']);
  // }

  // void getEquipmentList({
  //   required String facilityId,
  // }) async {
  //   final list = await homePresenter.getEquipmentList(
  //     isLoading: false,
  //     facilityId: facilityId,
  //   );
  //   equipmentList = list;
  //   update(['equipment_list']);
  // }

  // void onSelectEquipment(EquipmentModel equipment) {
  //   selectedEquipment = equipment;
  //   parentEquipmentTextController.text = selectedEquipment.name ?? '';

  //   update(['equipment_list']);
  // }

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

      default:
        {
          //statements;
        }
        break;
    }
  }
}
