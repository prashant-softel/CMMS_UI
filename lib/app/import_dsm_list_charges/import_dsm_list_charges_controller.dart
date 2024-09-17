import 'package:cmms/app/app.dart';
import 'package:cmms/app/import_dsm_list_charges/import_dsm_list_charges_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/SPV_list_model.dart';
import 'package:cmms/domain/models/dsm_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/state_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ImportDsmListChargesListController extends GetxController {
  ImportDsmListChargesListController(
    this.importDsmListDsmChargesListPresenter,
  );

  ImportDsmListChargesListPresenter importDsmListDsmChargesListPresenter;

  RxList<FacilityModel?> facilityNameList = <FacilityModel>[].obs;
  RxList<StateModel?> stateList = <StateModel>[].obs;
  RxList<SPVListModel?> spvList = <SPVListModel>[].obs;
  List<String> financialYears = [];
  final HomeController homecontroller = Get.find();
  RxBool isLoading = false.obs;
  RxList<String> selectedYears = <String>[].obs;
  RxList<String> selectedMonths = <String>[].obs;
  RxList<int> selectedFacilities = <int>[].obs;
  RxList<int> selectedSpv = <int>[].obs;
  RxList<int> selectedState = <int>[].obs;
  RxList<int> selectedDSMType = <int>[].obs;
  RxList<DSMData?> dsmDataList = <DSMData?>[].obs;
  RxList<DSMData?>? filteredDSMList = <DSMData?>[].obs;
  DSMData? filteredDSM = DSMData();
  RxBool isChecked = false.obs;
  RxString ActionFilterText = ''.obs;
  RxList<StatusModel?> dsmTypes = <StatusModel>[].obs;
  RxBool isExpanded = false.obs;
    // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  RxList<GenderModel> month = <GenderModel>[
    GenderModel(name: 'Jan', id: 1),
    GenderModel(name: 'Feb', id: 2),
    GenderModel(name: 'Mar', id: 3),
    GenderModel(name: 'Apr', id: 4),
    GenderModel(name: 'May', id: 5),
    GenderModel(name: 'Jun', id: 6),
    GenderModel(name: 'Jul', id: 7),
    GenderModel(name: 'Aug', id: 8),
    GenderModel(name: 'Sep', id: 9),
    GenderModel(name: 'Oct', id: 10),
    GenderModel(name: 'Nov', id: 11),
    GenderModel(name: 'Dec', id: 12),
  ].obs;
  RxList<GenderModel> year = <GenderModel>[].obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Financial Year": true,
    "Month": true,
    "State": true,
    "SPV": true,
    "Site": true,
    "DSM Type": true,
    "ForeCasterName": true,
    // "Category": true,
    "DSM Penalty": true,
    "Actual KWH": true,
    "Schedule KWH": true,
    "DSM Percentage": true,
  });

  final Map<String, double> columnwidth = {
    "Financial Year": 190,
    "Month": 150,
    "State": 200,
    "SPV": 150,
    "Site": 130,
    "DSM Type": 180,
    "ForeCasterName": 240,
    // "Category": 150,
    "DSM Penalty": 195,
    "Actual KWH": 200,
    "Schedule KWH": 220,
    "DSM Percentage": 200,
  };

  RxString fy = ''.obs;
  RxString months = ''.obs;
  RxString state = ''.obs;
  RxString spv = ''.obs;
  RxString site = ''.obs;
  RxString dsmType = ''.obs;
  RxString forcasterName = ''.obs;
  RxString category = ''.obs;
  RxString dsmPenalty = ''.obs;
  RxString scheduleKwh = ''.obs;
  RxString actualKwh = ''.obs;
  RxString dsmPer = ''.obs;

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  @override
  void onInit() async {
    this.filterText = {
      "Financial Year": fy,
      "Month": months,
      "State": state,
      "SPV": spv,
      "Site": site,
      "DSM Type": dsmType,
      "ForeCasterName": forcasterName,
      // "Category": category,
      "DSM Penalty": dsmPenalty,
      "Actual KWH": actualKwh,
      "Schedule KWH": scheduleKwh,
      "DSM Percentage": dsmPer,
    };
    try {
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
        getSpvList();
        getStateList(101);
        generateFinancialYears(20);
        getdsmType();
        getDSMDataList(false);
      });
    } catch (e) {
      print("DSM Error: $e");
    }
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      dsmDataList.value = filteredDSMList!;
      return;
    }
    List<DSMData?> filteredList = filteredDSMList!
        .where((item) =>
            (item?.fy?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.month?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.state?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.spv?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.site?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.dsmtype?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.forcasterName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.category?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.dsmPenalty?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.scheduleKwh
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.actualKwh?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.dsmPer?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false))
        .toList();
    dsmDataList.value = filteredList;
  }

  Future<void> getFacilityList() async {
    facilityNameList.value = <FacilityModel>[];
    final _facilityNameList =
        await importDsmListDsmChargesListPresenter.getFacilityList(
      isLoading: true,
      // categoryIds: categoryIds,
    );
    for (var facility_list in _facilityNameList!) {
      facilityNameList.add(facility_list);
    }
    update(['facility-list']);
  }

  void toggleContainer() {
    isExpanded.value = !isExpanded.value;
  }

  Future<void> getStateList(int selectedCountryId) async {
    final list = await importDsmListDsmChargesListPresenter.getStateList(
        selectedCountryId: selectedCountryId);

    if (list != null) {
      for (var _stateList in list) {
        stateList.add(_stateList);
      }
    }
  }

  Future<void> getSpvList() async {
    spvList.clear();
    final list = await importDsmListDsmChargesListPresenter.getSpvList(
      isLoading: isLoading.value,
    );
    if (list != null) {
      isLoading.value = false;
      for (var _spvList in list) {
        spvList.add(_spvList);
      }
    }
  }

  Future<void> getdsmType() async {
    dsmTypes?.clear();
    final dsmType = await importDsmListDsmChargesListPresenter.getdsmType(
      isLoading: isLoading.value,
    );
    if (dsmType != null) {
      isLoading.value = false;
      for (var _spvList in dsmType) {
        dsmTypes?.add(_spvList);
      }
    }
  }

  List<String> generateFinancialYears(int numberOfYears) {
    int currentYear = DateTime.now().year;
    for (int i = 0; i < numberOfYears; i++) {
      financialYears.add(
          '${currentYear - i}-${(currentYear - i + 1).toString().substring(2)}');
    }
    print("$financialYears");
    for (var financialYear in financialYears) {
      year.add(
        GenderModel(
          name: financialYear,
          id: int.tryParse(financialYear),
        ),
      );
    }
    return financialYears;
  }

  void yearsSelected(_years) {
    selectedYears.value = <String>[];
    for (var _selectedYear in _years) {
      selectedYears.add(_selectedYear);
    }
    print("${selectedYears}");
  }

  void monthsSelected(_months) {
    selectedMonths.value = <String>[];
    for (var _selectedMonth in _months) {
      selectedMonths.add(_selectedMonth);
    }
    print("${selectedMonths}");
  }

  void facilitySelected(_facilities) {
    selectedFacilities.value = <int>[];
    for (var _selectedFacility in _facilities) {
      selectedFacilities.add(_selectedFacility);
    }
    print("${selectedFacilities}");
  }

  void spvSelected(_spv) {
    selectedSpv.value = <int>[];
    for (var _seletedSpv in _spv) {
      selectedSpv.add(_seletedSpv);
    }
    print("${selectedSpv}");
  }

  void stateSelected(_states) {
    selectedState.value = <int>[];
    for (var _selectedState in _states) {
      selectedState.add(_selectedState);
    }
    print("${selectedState}");
  }

  void selectedDSMTypes(dsmType) {
    selectedDSMType.value = <int>[];
    for (var _selectedDSMType in dsmType) {
      selectedDSMType.add(_selectedDSMType);
    }
    print("${selectedState}");
  }

  PaginationController dsmPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<String> dsmListTableColumns = <String>[].obs;

  void export() {
    getDSMDataList(true, isExportOnly: true);
  }

  Future<void> getDSMDataList(bool? isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      dsmDataList.clear();
      filteredDSMList?.clear();
    }

    final dsmList = await importDsmListDsmChargesListPresenter.getDSMData(
        selectedYear: selectedYears,
        selectedMonth: selectedMonths,
        selectedSite: selectedFacilities,
        selectedSpv: selectedSpv,
        selectedState: selectedState,
        selectedDSMType: selectedDSMType,
        isLoading: isLoading.value,
        isExport: isExport);

    if (dsmList != null && !isExportOnly) {
      isLoading.value = false;
      dsmDataList.value = dsmList;
      filteredDSMList?.value = dsmDataList.value;

      dsmPaginationController = PaginationController(
        rowCount: dsmDataList.length,
        rowsPerPage: 10,
      );

      filteredDSM = dsmDataList[0];
    }

    update(["dsm-list"]);
    print("${dsmDataList.length}");
  }

  Future<void> goToImportDsmChargesScreen() async {
    clearStoreData();
    Get.toNamed(
      Routes.importInventory,
      arguments: {'importType': AppConstants.kImportDSMReport},
    );
  }

  void clearStoreData() {
    importDsmListDsmChargesListPresenter.clearValue();
  }
  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }
    switch (columnName) {
      case 'Financial Year':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.fy ?? '').compareTo(b?.fy ?? '')
            : (b?.fy ?? '').compareTo(a?.fy ?? ''));
        break;
      case 'Month':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.month ?? '').compareTo(b?.month ?? '')
            : (b?.month ?? '').compareTo(a?.month ?? ''));
        break;
      case 'State':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.state ?? '').compareTo(b?.state ?? '')
            : (b?.state ?? '').compareTo(a?.state ?? ''));
        break;
      case 'SPV':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.spv ?? '')
                .compareTo(b?.spv ?? '')
            : (b?.spv ?? '')
                .compareTo(a?.spv ?? ''));
        break;
      case 'Site':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.site ?? '').compareTo(b?.site ?? '')
            : (b?.site ?? '').compareTo(a?.site ?? ''));
        break;

      case 'DSM Type':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.dsmtype ?? '').compareTo(b?.dsmtype ?? '')
            : (b?.dsmtype ?? '').compareTo(a?.dsmtype ?? ''));
        break;
      case 'ForeCasterName':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.forcasterName ?? '').compareTo(b?.forcasterName ?? '')
            : (b?.forcasterName ?? '').compareTo(a?.forcasterName ?? ''));
        break;
      case 'DSM Penalty':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.dsmPenalty ?? 0).compareTo(b?.dsmPenalty ?? 0)
            : (b?.dsmPenalty ?? 0).compareTo(a?.dsmPenalty ?? 0));
        break;
      case 'Actual KWH':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.actualKwh ?? 0).compareTo(b?.actualKwh ?? 0)
            : (b?.actualKwh ?? 0).compareTo(a?.actualKwh ?? 0));
        break;
      case 'Schedule KWH':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.scheduleKwh ?? 0).compareTo(b?.scheduleKwh ?? 0)
            : (b?.scheduleKwh ?? 0).compareTo(a?.scheduleKwh ?? 0));
        break;
      case 'DSM Percentage':
        dsmDataList.sort((a, b) => isAscending.value
            ? (a?.dsmPer ?? 0).compareTo(b?.dsmPer ?? 0)
            : (b?.dsmPer ?? 0).compareTo(a?.dsmPer ?? 0));
        break;
      default:
        break;
    }
    update();
  }
}
