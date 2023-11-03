import 'dart:async';
import 'package:cmms/app/job_card_list/job_card_presenter.dart';
import 'package:cmms/domain/models/job_card_model.dart';
import 'package:get/get.dart';
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
  RxString PermitNoFilterText = ''.obs;

  RxString ActionFilterText = ''.obs;

  Rx<int> jobId = 0.obs;

  void search(String keyword) {
    if (keyword.isEmpty) {
      jobList.value = filteredData;
      return;
    }

    jobList.value = filteredData
        .where((item) =>
            item!.id!.toString().toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    update(['job_list']);
  }

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        jobCardList(facilityId, true);
      });
    });

    super.onInit();
  }

  Future<void> jobCardList(int facilityId, bool isLoading) async {
    jobList.value = <JobCardModel>[];
    final _jobList = await jobCardPresenter.jobCardList(
        facilityId: facilityId, isLoading: isLoading);

    if (_jobList != null) {
      jobList.value = _jobList;
      filteredData.value = jobList.value;
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
}
