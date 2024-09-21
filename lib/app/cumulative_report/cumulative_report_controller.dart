// ignore_for_file: invalid_use_of_protected_member

import 'package:cmms/app/cumulative_report/cumulative_report_presenter.dart';
import 'package:cmms/domain/models/cumulative_report_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CumulativeReportController extends GetxController {
  ///
  CumulativeReportController(
    this.cumulativeReportPresenter,
  );
  CumulativeReportPresenter cumulativeReportPresenter;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<int> selectedFacilityIdList = <int>[].obs;
  bool openFromDateToStartDatePicker = false;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  RxList<ModuleModel?> moduleList = <ModuleModel>[].obs;

  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  RxInt module_id = 0.obs;
  RxList<Cumulativereport?> cumulativereport = <Cumulativereport>[].obs;
  Rx<int> type = 0.obs;

  @override
  void onInit() async {
    await setReportType();

    await getFacilityList();
    await getModuleList();
    super.onInit();
  }

  Future<void> setReportType() async {
    final String? _type = Get.parameters['type'];
    type.value = int.tryParse(_type ?? "") ?? 0;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await cumulativeReportPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
    }
  }

  void facilitySelected(_selectedFacilityIds) {
    selectedFacilityIdList.value = <int>[];
    for (var _selectedId in _selectedFacilityIds) {
      selectedFacilityIdList.add(_selectedId);
    }
  }

  Future<void> getModuleList() async {
    moduleList.value = <ModuleModel>[];

    // Fetch the complete module list
    final _moduleList =
        await cumulativeReportPresenter.getModuleList(isLoading: true);

    // Check if the list is not null
    if (_moduleList != null) {
      // Filter the modules to include only the specified items
      final filteredModules = _moduleList.where((module) {
        return module?.id == 2 ||
            module?.id == 39 ||
            module?.id == 43 ||
            module?.id == 44;
      }).toList();

      moduleList.value = filteredModules;
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<ModuleModel>):
        {
          if (value != "Please Select") {
            cumulativereport.value = <Cumulativereport>[];

            int moduleListIndex =
                moduleList.indexWhere((x) => x?.name == value);
            module_id.value = moduleList[moduleListIndex]?.id ?? 0;
          } else {
            module_id.value = 0;
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

  Future<void> getCumulativeReportList() async {
    cumulativereport.value = <Cumulativereport>[];

    String lststrFacilityIds = selectedFacilityIdList.join(',');

    final list = await cumulativeReportPresenter.getCumulativeReportList(
        selectedFacilityIdList: lststrFacilityIds,
        module_id: module_id.value,
        endDate: formattedTodate1,
        startDate: formattedFromdate1);

    if (list != null) {
      for (var _cumulativereport in list) {
        cumulativereport.add(_cumulativereport);
      }
    }
  }
}
