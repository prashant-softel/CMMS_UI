import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';

import 'package:cmms/app/training_report/training_summary_presenter.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_presenter.dart';

import 'package:cmms/domain/models/permit_issue_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/training_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/block_model.dart';

class TrainingSummaryController extends GetxController {
  ///
  TrainingSummaryController(
    this.trainingSummaryPresenter,
  );
  TrainingSummaryPresenter trainingSummaryPresenter;

  final HomeController controller = Get.find();

  ///
  // var newPermitLists = <NewPermitListModel>[];

  ///Column Visibility
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Permit Id": true,
    "Title": true,
    "Permit Type Name": true,
    "Equipment Category": true,
    "Working Area": true,
    "Requested By": true,
    "Approved By": true,
    "Status": true,
    // "Status code": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Permit Id": 153,
    "Title": 150,
    "Permit Type Name": 200,
    "Equipment Category": 200,
    "Working Area": 153,
    "Requested By": 130,
    "Approved By": 150,
    "Status": 100,
    // "Status code": 120,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  ///Checkbox
  RxBool isChecked = false.obs;

  ///Date Range
  bool openFromDateToStartDatePicker = false;
  // RxString PermitIdFilterText = ''.obs;
  // RxString DescriptionFilterText = ''.obs;
  // RxString PermitTypeNameFilterText = ''.obs;
  // RxString EquipmentCategoriesFilterText = ''.obs;
  // RxString WorkingAreaNameFilterText = ''.obs;
  // RxString RequestByNameFilterText = ''.obs;
  // RxString ApprovedByNameFilterText = ''.obs;
  // RxString CurrentStatusShortFilterText = ''.obs;
  // RxString PtwStatusFilterText = ''.obs;
  // Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  // Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;

  RxString ActionFilterText = ''.obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 20)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  RxList<TrainingSummaryModel?> trainingSummaryList =
      <TrainingSummaryModel?>[].obs;
  RxList<TrainingSummaryModel?> filteredData = <TrainingSummaryModel>[].obs;

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  int facilityId = 0;

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

  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  ///
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    facilityIdStreamSubscription = controller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getTrainingSummary(facilityId, formattedFromdate, formattedTodate);
      });
    });
    super.onInit();
  }

  Future<void> getTrainingSummary(
      int facilityId, String fromDate, String toDate) async {
    trainingSummaryList.value = <TrainingSummaryModel>[];
    final _trainingSummaryList =
        await trainingSummaryPresenter.trainingSummaryData(
      facilityId: facilityId,
      isLoading: isLoading.value,
      fromDate: fromDate, //// "2020-01-01",
      toDate: toDate,
    );

    if (_trainingSummaryList != null) {
      trainingSummaryList.value = _trainingSummaryList;
      isLoading.value = false;
    }

    update(['training_summary_list']);
  }

  void getTrainingSummaryByDate() {
    getTrainingSummary(facilityId, formattedFromdate1, formattedTodate1);
  }
}
