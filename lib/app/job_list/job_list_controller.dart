import 'dart:async';

import 'dart:io';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:share/share.dart';
import '../../domain/models/block_model.dart';
import '../constant/constant.dart';
import '../navigators/app_pages.dart';
import 'job_list_presenter.dart';

class JobListController extends GetxController {
  ///
  JobListController(
    this.jobListPresenter,
  );
  JobListPresenter jobListPresenter;
  HomeController homeController = Get.find();

  ///
  RxList<JobModel?> jobList = <JobModel?>[].obs;
  RxList<JobModel?> filteredData = <JobModel?>[].obs;
  bool openFromDateToStartDatePicker = false;

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  RxList<String> jobListTableColumns = <String>[].obs;
  Rx<bool> isBlockSelected = false.obs;
  Rx<int> selectedBlockId = 0.obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<int> jobId = 0.obs;
  // Add variables to store filter text for each column
  RxString idFilterText = ''.obs;
  RxString facilityNameFilterText = ''.obs;
  RxString jobDateFilterText = ''.obs;
  RxString equipmentCategoryFilterText = ''.obs;
  RxString workAreaFilterText = ''.obs;
  RxString descriptionFilterText = ''.obs;
  RxString jobDetailsFilterText = ''.obs;
  RxString workTypeFilterText = ''.obs;
  RxString raisedByNameFilterText = ''.obs;
  RxString breakdownTimeFilterText = ''.obs;
  RxString breakdownTypeFilterText = ''.obs;
  RxString permitIdFilterText = ''.obs;
  RxString assignedToNameFilterText = ''.obs;
  RxString statusFilterText = ''.obs;

  ///
  final excel = Excel.createExcel();
  int facilityId = 0;
  int userId = 0;
  String? facilityName;
  JobModel? jobModel;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  ///
  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      // Future.delayed(Duration(seconds: 1), () {
      // userId = varUserAccessModel.value.user_id ?? 0;
      // if (userId != null) {
      getJobList(
          userId, false, formattedTodate1, formattedFromdate1, false, false);
      // }
      // });
    });
    facilityNameStreamSubscription =
        homeController.facilityName$.listen((event) {
      facilityName = event;

      // });
    });
    super.onInit();
  }

  void switchFacility(String? facilityName) {
    facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
    getJobList(
        userId, false, formattedTodate1, formattedFromdate1, false, false);
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await jobListPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      jobList.value = filteredData;
      return;
    }
    List<JobModel?> filteredList = filteredData
        .where((item) =>
            (item?.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.assignedToName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.description
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipmentCat
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.breakdownTime
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.workType?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.raisedByName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    jobList.value = filteredList;
  }

  void export() {
    getJobList(userId, true, formattedTodate1, formattedFromdate1, true, true,
        isExportOnly: true);
  }

  Future<void> getJobList(int userId, bool self_view, formattedTodate1,
      formattedFromdate1, bool isLoading, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      jobList.value = <JobModel>[];
      filteredData.value = <JobModel>[];
    }

    if (facilityId > 0) {
      final _jobList = await jobListPresenter.getJobList(
          facilityId: facilityId,
          self_view: varUserAccessModel.value.access_list!
                      .where((e) =>
                          e.feature_id == UserAccessConstants.kJobFeatureId &&
                          e.selfView == UserAccessConstants.kHaveSelfViewAccess)
                      .length >
                  0
              ? true
              : false,
          isLoading: isLoading,
          isExport: isExport);

      if (_jobList != null && _jobList.isNotEmpty && !isExportOnly) {
        filteredData.value = _jobList;

        jobList.value = _jobList;
        update(["jobList"]);
        paginationController = PaginationController(
          rowCount: jobList.length,
          rowsPerPage: 10,
        );

        jobModel = jobList[0];
        var jobJson = jobModel?.toJson();
        jobListTableColumns.value = <String>[];
        for (var key in jobJson?.keys.toList() ?? []) {
          jobListTableColumns.add(key);
        }
      }
    }
    update(['PreventiveMaintenanceTask']);
  }

  void getjobListByDate() {
    getJobList(
        facilityId, false, formattedTodate1, formattedFromdate1, false, false);
  }

  void goToAddJobScreen() {
    Get.toNamed(Routes.addJob, arguments: facilityId);
  }

  void goToJobCardScreen(int? jobId) {
    clearStoreData();
    clearStoreDataType();

    Get.toNamed(Routes.jobCard, arguments: {'jobId': jobId});
  }

  void goToEditJobScreen(int? _jobId) {
    clearStoreData();
    clearStoreDataType();

    Get.toNamed(Routes.editJob, arguments: {'jobId': _jobId, 'typeEdit': 1});
  }

  void goToJobDetailsScreen(int? _jobId) {
    clearStoreData();
    clearStoreDataType();

    Get.toNamed(Routes.jobDetails, arguments: {'jobId': _jobId});
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
  }

  Future<void> exportToExcelWeb() async {
    exportToExcel();
    downloadExcelFileWeb();
  }

  Future<void> exportToExcel() async {
    final sheetName = 'Job Data';
    excel.rename(sheetName, sheetName);

    excel.updateCell(sheetName, CellIndex.indexByString('A1'), 'Id');
    excel.updateCell(sheetName, CellIndex.indexByString('B1'), 'Facility');
    excel.updateCell(sheetName, CellIndex.indexByString('C1'), 'Job Date');
    excel.updateCell(
        sheetName, CellIndex.indexByString('D1'), 'Equipment Category');
    excel.updateCell(
        sheetName, CellIndex.indexByString('E1'), 'Work Area / Equipment');
    excel.updateCell(sheetName, CellIndex.indexByString('F1'), 'Description');
    excel.updateCell(sheetName, CellIndex.indexByString('G1'), 'Job Details');
    excel.updateCell(sheetName, CellIndex.indexByString('H1'), 'Fault');
    excel.updateCell(sheetName, CellIndex.indexByString('I1'), 'Raised By');
    excel.updateCell(
        sheetName, CellIndex.indexByString('J1'), 'Breakdown Time');
    excel.updateCell(
        sheetName, CellIndex.indexByString('K1'), 'Breakdown Type');
    excel.updateCell(sheetName, CellIndex.indexByString('L1'), 'Permit ID');
    excel.updateCell(sheetName, CellIndex.indexByString('M1'), 'Assigned To');
    excel.updateCell(sheetName, CellIndex.indexByString('N1'), 'Status');
    // Add the data to the sheet
    for (var i = 0; i < jobList.length; i++) {
      final job = jobList[i];
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1),
          job?.id ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1),
          job?.facilityName ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1),
          job?.jobDate ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 1),
          job?.equipmentCat ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 1),
          job?.workingArea ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 1),
          job?.description ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: i + 1),
          job?.name ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: i + 1),
          job?.workType ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: i + 1),
          job?.raisedByName ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: i + 1),
          job?.breakdownTime ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: i + 1),
          job?.breakdownType ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 11, rowIndex: i + 1),
          job?.permitId ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 12, rowIndex: i + 1),
          job?.assignedToName ?? '');
      excel.updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 13, rowIndex: i + 1),
          job?.status ?? '');
    }
    // downloadExcelFileWeb();
  }

  void downloadExcelFileWeb() async {
    try {
// Convert the Excel data to bytes
      final excelBytes = excel.encode();

// Write the data to a file (mobile implementation)
      final file = File('Job_Data_Export.xlsx');
      await file.writeAsBytes(excelBytes!);

      // Share the file on mobile
      final filePath = file.path;

      await Share.shareFiles(
        [filePath],
        text: 'Please Check exported data.',
      );
    } catch (e) {
      // Utility.showDialog(e.toString());
    }
  }

  onBlockChanged(dropdownList, selectedValue) {
    int blockIndex = blockList.indexWhere((x) => x?.name == selectedValue);
    selectedBlockId.value = blockList[blockIndex]?.id ?? 0;
    if (selectedBlockId.value > 0) {
      isBlockSelected.value = true;
    }
    selectedBlock.value = selectedValue;
    getJobList(
        userId, false, formattedTodate1, formattedFromdate1, false, false);
  }

  void clearStoreData() {
    jobListPresenter.clearValue();
  }

  void clearStoreDataType() {
    jobListPresenter.clearTypeValue();
  }

  ///
}
