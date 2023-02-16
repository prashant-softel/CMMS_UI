import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:get/get.dart';

import '../../domain/models/block_model.dart';
import '../home/home_presenter.dart';
import '../navigators/app_pages.dart';

class JobListController extends GetxController {
  ///
  JobListController(
      this.jobListPresenter, this.facilityPresenter, this.homePresenter);
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
  int userId = 36;
  var breakdownTime;

  ///
  @override
  void onInit() async {
    await homePresenter.generateToken();
    await getJobList(facilityId);
    getFacilityList();
    super.onInit();
  }

  void switchFacility(String? facilityName) {
    int? _facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
    getJobList(_facilityId);
  }

  Future<void> getFacilityList() async {
    final _facilityList = await jobListPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getJobList(int facilityId) async {
    jobList?.value = <JobModel>[];
    final _jobList = await jobListPresenter.getJobList(
        facilityId: facilityId, userId: userId);

    if (_jobList != null) {
      for (var job in _jobList) {
        jobList?.add(job);
      }
      update(["jobList"]);
    }
  }

  Future<void> addJob() async {
    Get.toNamed(Routes.addJob);
  }

  void showJobDetails(int jobId) {
    Get.toNamed(Routes.jobDetails, arguments: jobId);
  }

  ///
}
