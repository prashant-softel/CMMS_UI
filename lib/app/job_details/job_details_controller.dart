import 'package:cmms/app/facility/facility_presenter.dart';

import 'package:get/get.dart';

import '../../domain/models/job_details_model.dart';
import '../home/home_presenter.dart';
import '../navigators/app_pages.dart';
import 'job_details_presenter.dart';

class JobDetailsController extends GetxController {
  ///
  JobDetailsController(
    this.jobDetailsPresenter,
    this.facilityPresenter,
    this.homePresenter,
  );
  JobDetailsPresenter jobDetailsPresenter;
  HomePresenter homePresenter;
  FacilityPresenter facilityPresenter;

  ///
  RxList<JobDetailsModel?>? jobDetailsList = <JobDetailsModel?>[].obs;
  RxList<AssociatedPermit>? associatedPermitList = <AssociatedPermit>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;

  int jobId = 3158;
  int userId = 36;
  var breakdownTime;

  ///
  @override
  void onInit() async {
    jobId = Get.arguments;
    await homePresenter.generateToken();
    await getJobDetails(jobId);
    super.onInit();
  }

  Future<void> getJobDetails(int jobId) async {
    //jobId = 3158;
    jobDetailsList?.value = <JobDetailsModel>[];
    final _jobDetailsList =
        await jobDetailsPresenter.getJobDetails(jobId: jobId);

    if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
      jobDetailsModel.value = _jobDetailsList[0];
      update(["jobDetailsModel"]);
    }

    associatedPermitList?.value = jobDetailsModel.value?.associatedPermit ?? [];
  }

  void editJob() {
    Get.toNamed(Routes.editJob, arguments: jobId);
  }

  ///
}
