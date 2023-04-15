import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

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
  RxList<JobModel?>? jobList = <JobModel?>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  int facilityId = 0;
  int userId = 0;
  Rx<int> jobId = 0.obs;
  var breakdownTime;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  JobModel? jobModel;
  RxList<String> jobListTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        userId = varUserAccessModel.value.user_id ?? 0;
        getJobList(facilityId, userId);
      });
    });
    Future.delayed(Duration(seconds: 1), () {});

    super.onInit();
  }

  void switchFacility(String? facilityName) {
    facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
    getJobList(facilityId, userId);
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await jobListPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getJobList(int facilityId, int userId) async {
    jobList?.value = <JobModel>[];
    final _jobList = await jobListPresenter.getJobList(
      facilityId: facilityId,
      userId: userId,
      isLoading: false,
    );

    if (_jobList != null && _jobList.isNotEmpty) {
      jobList!.value = _jobList;
      update(["jobList"]);
      paginationController = PaginationController(
        rowCount: jobList!.length,
        rowsPerPage: 10,
      );

      jobModel = jobList![0];
      var jobJson = jobModel?.toJson();
      jobListTableColumns.value = <String>[];
      for (var key in jobJson?.keys.toList() ?? []) {
        jobListTableColumns.add(key);
      }
    }
  }

  Future<void> addJob() async {
    Get.toNamed(Routes.addJob, arguments: facilityId);
  }

  void goToJobCardScreen(int? jobId) {
    Get.toNamed(Routes.jobCard, arguments: jobId);
  }

  void showJobDetails(int _jobId) {
    Get.toNamed(Routes.jobDetails, arguments: _jobId);
  }

  ///
}
