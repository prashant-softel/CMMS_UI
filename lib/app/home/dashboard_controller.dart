import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/models/dashboard_model.dart';
import '../../domain/models/facility_model.dart';

class DashboardController extends GetxController {
  DashboardController(this.homePresenter);
  HomePresenter homePresenter;

  final HomeController homecontroller = Get.find();

  final categoryMapBM = <String, double>{};
  final categoryMapPM = <String, double>{};
  final categoryMapMC = <String, double>{};
  Map<String, double> categoryMapBMDouble = <String, double>{};
  Map<String, double> categoryMapPMDouble = <String, double>{};
  Map<String, double> mcTypeMapMcDouble = <String, double>{};

  Map<String, double> categoryMapSMDouble = <String, double>{};
  Map<String, double> categoryMapIRDouble = <String, double>{};

  Map<String, double> categoryMapSmConsumptionDouble = <String, double>{};
  Map<String, double> categoryMapSmConsumptionSiteDouble = <String, double>{};
  Map<String, double> categoryMapSmAvailableDouble = <String, double>{};
  Map<String, double> categoryMapSmAvailableSiteDouble = <String, double>{};
  Map<String, double> stockOverviewmap = <String, double>{};
  Map<String, double> waterUsedDouble = <String, double>{};

  var selectedSection = 0.obs;

  RxList<DashboardModel?> dashboardList = <DashboardModel?>[].obs;
  Rx<DashboardModel?> dashboardBmList = DashboardModel().obs;
  Rx<DashboardModel?> dashboardPmList = DashboardModel().obs;
  Rx<DashboardModel?> dashboardIrList = DashboardModel().obs;
  Rx<DashboardModel?> dashboardSmList = DashboardModel().obs;
  Rx<DashboardModel?> dashboardMcList = DashboardModel().obs;
  RxList<Itemlist?> allItems = <Itemlist?>[].obs;

  RxList<DashboardModel?> filteredData = <DashboardModel>[].obs;
  List<DashboardModel?>? BufferdashboardList = <DashboardModel?>[].obs;

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
      Color.fromARGB(255, 61, 149, 114),
      Colors.purpleAccent,
    ];
  }

  List<Color> getColorIrList() {
    return [
      Colors.blue,
      Colors.blue,
      Colors.blue,
      Colors.blue,
      Colors.blue,
      Colors.blue,
    ];
  }

  var index = 0;
  List<Color> colorList() {
    return [
      const Color.fromARGB(255, 2, 63, 114),
      Colors.green,
      Color.fromARGB(255, 147, 42, 42),
      Color.fromARGB(255, 96, 154, 98),
    ];
  }

  List<Color> getWoColorList() {
    return [
      Colors.blue,
      Colors.green,
      Colors.orange,
    ];
  }

  // void toggleExpansion() {
  //   isExpanded.toggle();
  // }

  var isToggleOn = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) getdashboardList();
    });

    super.onInit();
  }

  Future<void> getdashboardList() async {
    dashboardList.value = <DashboardModel>[];
    allItems.value = <Itemlist>[];

    String lststrFacilityIds = homecontroller.selectedFacilityIdList.join(',');

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
        final categoryMapBM = <String, int>{};

        for (var item
            in dashboardBmList.value!.cmDashboadDetails!.item_list ?? []) {
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
        final otherCategoriesCount = sortedCategories.skip(5).fold<int>(
              0,
              (sum, entry) => sum + entry.value,
            );

        categoryMapBM.clear();
        for (var entry in top5Categories) {
          categoryMapBM[entry.key] = entry.value;
        }
        if (otherCategoriesCount > 0) {
          categoryMapBM['Other'] = otherCategoriesCount;
        }

        categoryMapBMDouble = categoryMapBM
            .map((key, value) => MapEntry(key, (value.toDouble())));
      }
      if (dashboardPmList.value != null) {
        final categoryMapPm = <String, int>{};

        for (var item
            in dashboardPmList.value!.cmDashboadDetails!.item_list ?? []) {
          final categories = item.asset_category?.split(', ') ?? [];
          for (var category in categories) {
            if (categoryMapPm.containsKey(category)) {
              categoryMapPm[category] = categoryMapPm[category]! + 1;
            } else {
              categoryMapPm[category] = 1;
            }
          }
        }

        final sortedCategories = categoryMapPm.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final top5Categories = sortedCategories.take(5).toList();
        final otherCategoriesCount = sortedCategories.skip(5).fold<int>(
              0,
              (sum, entry) => sum + entry.value,
            );

        categoryMapPm.clear();
        for (var entry in top5Categories) {
          categoryMapPm[entry.key] = entry.value;
        }
        if (otherCategoriesCount > 0) {
          categoryMapPm['Other'] = otherCategoriesCount;
        }

        categoryMapPMDouble = categoryMapPm
            .map((key, value) => MapEntry(key, (value.toDouble())));
      }
      if (dashboardMcList.value != null) {
        final typeMapMc = <String, int>{};
        final totalWater = <String, double>{};

        // Null check for item_list before processing types
        for (var item
            in dashboardMcList.value!.cmDashboadDetails!.item_list ?? []) {
          final types = item.mC_Type?.split(', ') ?? [];
          for (var type in types) {
            if (typeMapMc.containsKey(type)) {
              typeMapMc[type] = typeMapMc[type]! + 1;
            } else {
              typeMapMc[type] = 1;
            }
          }
        }

        final sortedTypes = typeMapMc.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final top5Types = sortedTypes.take(5).toList();
        final otherTypesCount = sortedTypes.skip(5).fold<int>(
              0,
              (sum, entry) => sum + entry.value,
            );

        typeMapMc.clear();
        for (var entry in top5Types) {
          typeMapMc[entry.key] = entry.value;
        }
        if (otherTypesCount > 0) {
          typeMapMc['Other'] = otherTypesCount;
        }

        mcTypeMapMcDouble =
            typeMapMc.map((key, value) => MapEntry(key, (value.toDouble())));

        if (dashboardMcList.value?.cmDashboadDetails?.waterUsedTotal != null) {
          for (var item
              in dashboardMcList.value!.cmDashboadDetails!.waterUsedTotal!) {
            if (item.site_name != null && item.totalWaterUsed != null) {
              if (totalWater.containsKey(item.site_name)) {
                totalWater[item.site_name!] =
                    totalWater[item.site_name!]! + item.totalWaterUsed!;
              } else {
                totalWater[item.site_name!] = item.totalWaterUsed!.toDouble();
              }
            }
          }

          final sortedUsedWaters = totalWater.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value));
          final top5sortedUsedWaters = sortedUsedWaters.take(5).toList();
          final otherCategoriesCountConsumptionSites =
              sortedUsedWaters.skip(5).fold<double>(
                    0.0,
                    (sum, entry) => sum + entry.value,
                  );

          final top5mapededUsedWaters = <String, double>{};
          for (var entry in top5sortedUsedWaters) {
            top5mapededUsedWaters[entry.key] = entry.value;
          }
          if (otherCategoriesCountConsumptionSites > 0) {
            top5mapededUsedWaters['Other'] =
                otherCategoriesCountConsumptionSites;
          }

          waterUsedDouble = top5mapededUsedWaters;
        }
      }

      if (dashboardIrList.value != null) {
        final categoryMapIr = <String, int>{};

        for (var item
            in dashboardIrList.value!.cmDashboadDetails!.item_list ?? []) {
          final categories = item.type_of_incident?.split(', ') ?? [];
          for (var category in categories) {
            if (categoryMapIr.containsKey(category)) {
              categoryMapIr[category] = categoryMapIr[category]! + 1;
            } else {
              categoryMapIr[category] = 1;
            }
          }
        }

        final sortedCategories = categoryMapIr.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final topCategories = sortedCategories.toList();

        categoryMapIr.clear();
        for (var entry in topCategories) {
          categoryMapIr[entry.key] = entry.value;
        }

        categoryMapIRDouble = categoryMapIr
            .map((key, value) => MapEntry(key, (value.toDouble())));
      }

      if (dashboardSmList.value != null) {
        final categoryMapSmConsumption = <String, double>{};
        final categoryMapSmConsumptionSites = <String, double>{};
        final categoryMapSmAvailable = <String, double>{};
        final categoryMapSmAvailableSites = <String, double>{};

        if (dashboardSmList.value?.cmDashboadDetails?.stockConsumptionByGoods !=
            null) {
          for (var item
              in dashboardSmList.value?.cmDashboadDetails?.stockOverview ??
                  []) {
            if (stockOverviewmap.containsKey(item.key)) {
              stockOverviewmap[item.key!] =
                  stockOverviewmap[item.key!]! + item.value!;
            } else {
              stockOverviewmap[item.key!] = item.value!.toDouble();
            }
          }
          for (var item in dashboardSmList
                  .value?.cmDashboadDetails?.stockConsumptionByGoods ??
              []) {
            if (categoryMapSmConsumption.containsKey(item.key)) {
              categoryMapSmConsumption[item.key!] =
                  categoryMapSmConsumption[item.key!]! + item.value!;
            } else {
              categoryMapSmConsumption[item.key!] = item.value!.toDouble();
            }
          }
          for (var item in dashboardSmList
                  .value?.cmDashboadDetails?.stockConsumptionBySites ??
              []) {
            if (categoryMapSmConsumptionSites.containsKey(item.key)) {
              categoryMapSmConsumptionSites[item.key!] =
                  categoryMapSmConsumptionSites[item.key!]! + item.value!;
            } else {
              categoryMapSmConsumptionSites[item.key!] = item.value!.toDouble();
            }
          }
          for (var item in dashboardSmList
                  .value?.cmDashboadDetails?.stockAvailbleByGoods ??
              []) {
            if (categoryMapSmAvailable.containsKey(item.key)) {
              categoryMapSmAvailable[item.key!] =
                  categoryMapSmAvailable[item.key!]! + item.value!;
            } else {
              categoryMapSmAvailable[item.key!] = item.value!.toDouble();
            }
          }
          for (var item in dashboardSmList
                  .value?.cmDashboadDetails?.stockAvailbleBySites ??
              []) {
            if (categoryMapSmAvailableSites.containsKey(item.key)) {
              categoryMapSmAvailableSites[item.key!] =
                  categoryMapSmAvailableSites[item.key!]! + item.value!;
            } else {
              categoryMapSmAvailableSites[item.key!] = item.value!.toDouble();
            }
          }
        }
////stock overview
        // final sortedCategoriesstock = stockOverviewmap.entries.toList()
        //   ..sort((a, b) => b.value.compareTo(a.value));
        // final top5CategoriesStock = sortedCategoriesstock.take(5).toList();
        // final otherStockCount = sortedCategoriesstock.skip(5).fold<double>(
        //       0.0,
        //       (sum, entry) => sum + entry.value,
        //     );

        // final top5StockOverview = <String, double>{};
        // for (var entry in top5CategoriesStock) {
        //   top5StockOverview[entry.key] = entry.value;
        // }
        // if (otherStockCount > 0) {
        //   top5StockOverview['Other'] = otherStockCount;
        // }

        // stockOverviewDouble = top5StockOverview;

        ///good consumption
        final sortedCategories = categoryMapSmConsumption.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final top5Categories = sortedCategories.take(5).toList();
        final otherCategoriesCount = sortedCategories.skip(5).fold<double>(
              0.0,
              (sum, entry) => sum + entry.value,
            );

        final top5CategoryMapSmConsumption = <String, double>{};
        for (var entry in top5Categories) {
          top5CategoryMapSmConsumption[entry.key] = entry.value;
        }
        if (otherCategoriesCount > 0) {
          top5CategoryMapSmConsumption['Other'] = otherCategoriesCount;
        }

        categoryMapSmConsumptionDouble = top5CategoryMapSmConsumption;

        ///sites consumption
        final sortedCategoriesConsumptionSites =
            categoryMapSmConsumptionSites.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value));
        final top5CategoriesConsumptionSites =
            sortedCategoriesConsumptionSites.take(5).toList();
        final otherCategoriesCountConsumptionSites =
            sortedCategoriesConsumptionSites.skip(5).fold<double>(
                  0.0,
                  (sum, entry) => sum + entry.value,
                );

        final top5CategoryMapSmConsumptionSites = <String, double>{};
        for (var entry in top5CategoriesConsumptionSites) {
          top5CategoryMapSmConsumptionSites[entry.key] = entry.value;
        }
        if (otherCategoriesCountConsumptionSites > 0) {
          top5CategoryMapSmConsumptionSites['Other'] =
              otherCategoriesCountConsumptionSites;
        }

        categoryMapSmConsumptionSiteDouble = top5CategoryMapSmConsumptionSites;
        ////Available good
        final sortedCategoriesAvailable = categoryMapSmAvailable.entries
            .toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final top5CategoriesAvailable =
            sortedCategoriesAvailable.take(5).toList();
        final otherCategoriesCountAvailable =
            sortedCategoriesAvailable.skip(5).fold<double>(
                  0.0,
                  (sum, entry) => sum + entry.value,
                );

        final top5CategoryMapAvailable = <String, double>{};
        for (var entry in top5CategoriesAvailable) {
          top5CategoryMapAvailable[entry.key] = entry.value;
        }
        if (otherCategoriesCountAvailable > 0) {
          top5CategoryMapAvailable['Other'] = otherCategoriesCountAvailable;
        }

        categoryMapSmAvailableDouble = top5CategoryMapAvailable;
        ////Available Site
        final sortedCategoriesAvailableSites =
            categoryMapSmAvailableSites.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value));
        final top5CategoriesAvailableSites =
            sortedCategoriesAvailableSites.take(5).toList();
        final otherCategoriesCountAvailableSites =
            sortedCategoriesAvailableSites.skip(5).fold<double>(
                  0.0,
                  (sum, entry) => sum + entry.value,
                );

        final top5CategoryMapAvailableSites = <String, double>{};
        for (var entry in top5CategoriesAvailableSites) {
          top5CategoryMapAvailableSites[entry.key] = entry.value;
        }
        if (otherCategoriesCountAvailableSites > 0) {
          top5CategoryMapAvailableSites['Other'] =
              otherCategoriesCountAvailableSites;
        }

        categoryMapSmAvailableSiteDouble = top5CategoryMapAvailableSites;
      }

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

  void clearStoreSmData() {
    homePresenter.smclearValue();
  }

  void clearStoreDatatype() {
    homePresenter.clearTypeValue();
  }

  void onChartTapped(int index) {
    selectedSection.value = index;
  }

  void getDashBordListByDate() {
    getdashboardList();
  }

  void selectedMultiFacility(List<int> _selectedFacilityIds) {
    homecontroller.selectedFacilityIdList.clear(); // Clear the existing list
    homecontroller.selectedFacilityIdList
        .addAll(_selectedFacilityIds); // Add the new selections
    print('Selected facility IDs: ${homecontroller.selectedFacilityIdList}');
    getdashboardList();
  }
}
