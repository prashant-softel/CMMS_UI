import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/block_model.dart';
import '../navigators/app_pages.dart';
import 'job_list_presenter.dart';

class JobListController extends GetxController {
  ///
  JobListController(
    this.jobListPresenter,
  );
  JobListPresenter jobListPresenter;

  ///
  RxList<JobModel?>? jobList = <JobModel?>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  int facilityId = 46;
  int userId = 35;
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

  ///
  @override
  void onInit() async {
    //homePresenter.generateToken();
    Future.delayed(Duration(seconds: 1), () {
      getFacilityList(isLoading: true);
      Future.delayed(Duration(milliseconds: 500), () {
        getJobList(facilityId, userId);
      });
    });

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
    );

    if (_jobList != null) {
      jobList!.value = _jobList;
      paginationController = PaginationController(
        rowCount: jobList!.length,
        rowsPerPage: 10,
      );

      if (jobList != null && jobList!.isNotEmpty) {
        jobModel = jobList![0];
        var jobJson = jobModel?.toJson();
        jobListTableColumns.value = <String>[];
        for (var key in jobJson?.keys.toList() ?? []) {
          jobListTableColumns.add(key);
        }
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
