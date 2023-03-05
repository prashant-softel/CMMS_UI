import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/block_model.dart';
import '../home/home_presenter.dart';
import '../navigators/app_pages.dart';

class JobListController extends GetxController {
  ///
  JobListController(
    this.jobListPresenter,
    this.facilityPresenter,
    this.homePresenter,
  );
  JobListPresenter jobListPresenter;
  HomePresenter homePresenter;
  FacilityPresenter facilityPresenter;

  ///
  RxList<JobModel?>? jobList = <JobModel?>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  int facilityId = 45;
  int userId = 35;
  Rx<int> jobId = 0.obs;
  var breakdownTime;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  late PaginationController paginationController;
  RxList<String> jobListTableColumns = <String>[].obs;

  ///
  @override
  void onInit() async {
    paginationController = PaginationController(
      rowCount: jobList?.length ?? 0,
      rowsPerPage: 10,
    );

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
      jobList?.value = _jobList;

      if (jobList != null && jobList!.isNotEmpty) {
        JobModel? job = jobList![0];
        var jobJson = job?.toJson();
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

  void showJobDetails(int _jobId) {
    Get.toNamed(Routes.jobDetails, arguments: _jobId);
  }

  ///
}
