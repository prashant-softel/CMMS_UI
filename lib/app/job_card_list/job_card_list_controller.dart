import 'dart:async';
import 'package:cmms/app/job_card_list/job_card_presenter.dart';
import 'package:cmms/domain/models/job_card_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../home/home_controller.dart';

class JobCardListController extends GetxController {
  ///
  JobCardPresenter jobCardPresenter;
  JobCardListController(
    this.jobCardPresenter,
  );
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<JobCardModel?> jobList = <JobCardModel?>[].obs;
  RxList<JobCardModel?> filteredData = <JobCardModel>[].obs;
  bool openFromDateToStartDatePicker = false;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  JobCardModel? jobListModel;
  RxList<String> jobListTableColumns = <String>[].obs;
  JobCardModel? selectedItem;
   RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  RxString IdFilterText = ''.obs;
  RxString JobCardIdFilterText = ''.obs;
  RxString JobIdFilterText = ''.obs;
  RxString JobAssingedToFilterText = ''.obs;
  RxString DescriptionFilterText = ''.obs;
  RxString StartTimeFilterText = ''.obs;
  RxString EndTimeFilterText = ''.obs;
  RxString PermitIdFilterText = ''.obs;
  RxString PermitStatusFilterText = ''.obs;
  RxString PermitNoFilterText = ''.obs;

  RxString ActionFilterText = ''.obs;

  Rx<int> jobId = 0.obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  void search(String keyword) {
    if (keyword.isEmpty) {
      jobList.value = filteredData;
      return;
    }

    List<JobCardModel?> filteredList = filteredData
        .where((item) =>
            (item?.id?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.jobCardId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.jobId?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.jobId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            // (item?.permit_id?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
            //     false) ||
            (item?.permit_no
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.description
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.start_time
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.end_time
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.statusShort
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.job_assinged_to
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();

    jobList.value = filteredList;
    // jobList.value = filteredData
    //     .where((item) =>
    //         item!.id!.toString().toLowerCase().contains(keyword.toLowerCase()))
    //     .toList();
    // update(['job_list']);
  }

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        if (facilityId > 0) {
          jobCardList(facilityId, formattedTodate1, formattedFromdate1, false);
        }
      });
    });

    super.onInit();
  }

  void getjobcardListByDate() {
    jobCardList(facilityId, formattedTodate1, formattedFromdate1, false);
  }

  void export() {
    jobCardList(facilityId, formattedTodate1, formattedFromdate1, true,
        isExportOnly: true);
  }

  Future<void> jobCardList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      jobList.value = <JobCardModel>[];
    }

    final _jobList = await jobCardPresenter.jobCardList(
        facilityId: facilityId, isLoading: isLoading.value, isExport: isExport);

    if (_jobList != null && !isExportOnly) {
      jobList.value = _jobList;
      filteredData.value = jobList.value;
      isLoading.value = false;

      paginationController = PaginationController(
        rowCount: jobList.length,
        rowsPerPage: 10,
      );

      if (filteredData.isNotEmpty) {
        jobListModel = filteredData[0];
        var jobListJson = jobListModel?.toJson();
        jobListTableColumns.value = <String>[];
        for (var key in jobListJson?.keys.toList() ?? []) {
          jobListTableColumns.add(key);
        }
      }
    }

    update(['job_list']);
  }

  void clearStoreData() {
    jobCardPresenter.clearValue();
  }
  // sort
  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'Job Card Id':
        jobList.sort((a, b) => isAscending.value
            ? (a?.jobCardId ?? 0).compareTo(b?.jobCardId ?? 0)
            : (b?.jobCardId ?? 0).compareTo(a?.jobCardId ?? 0));
        break;
      case 'Job Id':
        jobList.sort((a, b) => isAscending.value
            ? (a?.jobId ?? 0).compareTo(b?.jobId ?? 0)
            : (b?.jobId ?? 0).compareTo(a?.jobId ?? 0));
        break;
case 'Permit No.':
  jobList.sort((a, b) => isAscending.value
      ? ((a?.permit_no as double?) ?? 0.0).compareTo((b?.permit_no as double?) ?? 0.0)
      : ((b?.permit_no as double?) ?? 0.0).compareTo((a?.permit_no as double?) ?? 0.0));
  break;

      case 'Assigned To':
        jobList.sort((a, b) => isAscending.value
            ? (a?.job_assinged_to ?? '').compareTo(b?.job_assinged_to ?? '')
            : (b?.job_assinged_to ?? '').compareTo(a?.job_assinged_to ?? ''));
        break;
      case 'Job Title':
        jobList.sort((a, b) => isAscending.value
            ? (a?.description ?? '').compareTo(b?.description ?? '')
            : (b?.description ?? '').compareTo(a?.description ?? ''));
        break;
      case 'Start Time':
        jobList.sort((a, b) => isAscending.value
            ? (a?.start_time ?? '').compareTo(b?.start_time ?? '')
            : (b?.start_time ?? '').compareTo(a?.start_time ?? ''));
        break;
      case 'End Time':
        jobList.sort((a, b) => isAscending.value
            ? (a?.end_time ?? '').compareTo(b?.end_time ?? '')
            : (b?.end_time ?? '').compareTo(a?.end_time ?? ''));
        break;

      default:
        break;
    }
    update();
  }

}
