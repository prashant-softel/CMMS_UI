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

  Future<void> jobCardList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport) async {
    jobList.value = <JobCardModel>[];
    final _jobList = await jobCardPresenter.jobCardList(
        facilityId: facilityId, isLoading: isLoading.value, isExport: isExport);

    if (_jobList != null) {
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

  void export() {
    jobCardList(facilityId, formattedTodate1, formattedFromdate1, true);
  }
}
