// ignore_for_file: invalid_use_of_protected_member

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/cumulative_report/cumulative_report_presenter.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/cumulative_report_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';
import 'package:flutter/material.dart';
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
  RxList<PmTaskListModel?> pmTaskList = <PmTaskListModel?>[].obs;
  RxList<PmTaskListModel?> pmfilteredData = <PmTaskListModel>[].obs;

  RxList<JobModel?> jobList = <JobModel?>[].obs;
  RxList<JobModel?> filteredData = <JobModel?>[].obs;
  RxList<VegTaskListModel?> vegTaskList = <VegTaskListModel?>[].obs;
  RxList<MCTaskListModel?> mcTaskList = <MCTaskListModel?>[].obs;

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

  Future<void> getJobList(
      // {bool isExportOnly = false}
      ) async {
    // if (!isExportOnly) {
    //   jobList.value = <JobModel>[];
    //   filteredData.value = <JobModel>[];
    // }

    // if (facilityId > 0) {
    String lststrFacilityIds = selectedFacilityIdList.join(',');
    pmTaskList.value = <PmTaskListModel>[];
    jobList.value = <JobModel>[];

    final _jobList = await cumulativeReportPresenter.getJobList(
        facilityId: lststrFacilityIds,
        self_view: varUserAccessModel.value.access_list!
                    .where((e) =>
                        e.feature_id == UserAccessConstants.kJobFeatureId &&
                        e.selfView == UserAccessConstants.kHaveSelfViewAccess)
                    .length >
                0
            ? true
            : false,
        isLoading: true,
        isExport: false);

    if (_jobList != null && _jobList.isNotEmpty) {
      filteredData.value = _jobList;

      jobList.value = _jobList;
      update(["jobList"]);
      // paginationController = PaginationController(
      //   rowCount: jobList.length,
      //   rowsPerPage: 10,
      // );

      // jobModel = jobList[0];
      // var jobJson = jobModel?.toJson();
      // jobListTableColumns.value = <String>[];
      // for (var key in jobJson?.keys.toList() ?? []) {
      //   jobListTableColumns.add(key);
      // }
    }
    // }
    // update(['PreventiveMaintenanceTask']);
  }

  String formatDate(String? inputDateTime) {
    ///
    String formattedDateTimeString = '';

    if (inputDateTime != null &&
        inputDateTime.isNotEmpty &&
        inputDateTime != "null")
    // Parse the input DateTime string
    {
      DateFormat inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss.SSS");
      DateTime parsedDateTime = inputFormat.parse(inputDateTime);

      // Format the parsed DateTime to the desired format
      DateFormat outputFormat = DateFormat("yyyy-MM-dd hh:mm");
      formattedDateTimeString = outputFormat.format(parsedDateTime);
    }

    return formattedDateTimeString;
  } // sort

  Future<void> getPmTaskList() async {
    pmTaskList.value = <PmTaskListModel>[];
    jobList.value = <JobModel>[];

    // pmTaskList?.clear();
    String lststrFacilityIds = selectedFacilityIdList.join(',');

    final _pmTaskList = await cumulativeReportPresenter.getPmTaskList(
      facilityId: lststrFacilityIds,
      isLoading: true, //isLoading.value,
      startDate: formattedTodate1,
      endDate: formattedFromdate1,
      isExport: false,
    );
    if (_pmTaskList != null) {
      pmTaskList.value = _pmTaskList;
      pmfilteredData.value = pmTaskList.value;
      // isLoading.value = false;
    }
  }

  Future<void> getVegTaskList() async {
    // if (!isExportOnly) {
    //   vegTaskList.value = <VegTaskListModel>[];
    // }
    String lststrFacilityIds = selectedFacilityIdList.join(',');

    final list = await cumulativeReportPresenter.getVegTaskList(
        isLoading: true,
        startDate: formattedTodate1,
        endDate: formattedFromdate1,
        facility_id: lststrFacilityIds,
        isExport: false);

    // if (!isExportOnly) {
    // for (var veg_task_list in list) {
    //   vegTaskList.add(veg_task_list);
    // }

    vegTaskList.value = list;
    // filteredData.value = vegTaskList.value;
    // isLoading.value = false;

    // paginationController = PaginationController(
    //   rowCount: vegTaskList.length,
    //   rowsPerPage: 10,
    // );

    // if (filteredData.isNotEmpty) {
    //   vegTaskListModel = filteredData[0];
    //   var vegTaskListJson = vegTaskListModel?.toJson();
    //   vegTaskListTableColumns.value = <String>[];
    //   for (var key in vegTaskListJson?.keys.toList() ?? []) {
    //     vegTaskListTableColumns.add(key);
    //   }
    // }
    //  }

    //  isLoading.value = false;
    update(['veg_task_list']);
  }

  Future<void> getMCTaskList() async {
    // if (!isExportOnly) {
    //   mcTaskList.value = <MCTaskListModel>[];
    // }
    String lststrFacilityIds = selectedFacilityIdList.join(',');

    final list = await cumulativeReportPresenter.getMCTaskList(
        isLoading: true,
        isExport: false,
        start_date: formattedTodate1,
        end_date: formattedFromdate1,
        facility_id: lststrFacilityIds);

    // isLoading.value = false;

    // if (!isExportOnly) {
    // for (var mc_task_list in list) {
    //   mcTaskList.add(mc_task_list);
    // }

    mcTaskList.value = list;
    // filteredData.value = mcTaskList.value;

    //   paginationController = PaginationController(
    //     rowCount: mcTaskList.length,
    //     rowsPerPage: 10,
    //   );

    //   if (filteredData.isNotEmpty) {
    //     mcTaskModelList = filteredData[0];
    //     var mcTaskListJson = mcTaskModelList?.toJson();
    //     mcTaskListTableColumns.value = <String>[];
    //     for (var key in mcTaskListJson?.keys.toList() ?? []) {
    //       mcTaskListTableColumns.add(key);
    //     }
    //   }
    // }

    update(['mc_task_list']);
  }

  ///
}
