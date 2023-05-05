import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  Rx<int> jobId = 0.obs;
  int userId = 36;
  var breakdownTime;

  final permitDropdownValues = <String>[].obs;
  final textControllers = <List<TextEditingController>>[].obs;

  ///
  @override
  void onInit() async {
    try {
      final _flutterSecureStorage = const FlutterSecureStorage();
      // Read jobId
      String? _jobId = await _flutterSecureStorage.read(key: "jobId");
      if (_jobId == null || _jobId == '' || _jobId == "null") {
        jobId.value = Get.arguments["jobId"];
        await _flutterSecureStorage.write(
          key: "jobId",
          value: jobId.value == null ? '' : jobId.value.toString(),
        );
      } else {
        jobId.value = int.tryParse(_jobId) ?? 0;
      }
      getJobDetails(jobId.value);
      super.onInit();
    } //
    catch (e) {
      print(e);
    }
  }

  setDropdownValue(int index, String value) {
    permitDropdownValues[index] = value;
  }

  setTextValue(int row, int col, String value) {
    textControllers[row][col].text = value;
  }

  Future<void> getJobDetails(int? jobId) async {
    jobDetailsList?.value = <JobDetailsModel>[];
    final _jobDetailsList =
        await jobDetailsPresenter.getJobDetails(jobId: jobId, isLoading: true);

    if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
      jobDetailsModel.value = _jobDetailsList[0];
      update(["jobDetailsModel"]);
    }

    associatedPermitList?.value =
        jobDetailsModel.value?.associatedPermitList ?? [];
  }

  void editJob() {
    Get.toNamed(Routes.editJob, arguments: jobId.value);
  }

  void linkToExistingPermit() {
    // Initialize dropdown and text field values
    associatedPermitList?.forEach((data) {
      permitDropdownValues.add(data.permitTypeName ?? '');
      final textControllerList = <TextEditingController>[];
      textControllerList.add(TextEditingController(text: ''));
      textControllerList.add(TextEditingController(text: ''));
      textControllerList.add(TextEditingController(text: ''));
      textControllerList.add(TextEditingController(text: ''));
      textControllerList.add(TextEditingController(text: ''));
      textControllers.add(textControllerList);
    });
  }

  createNewPermit() {}

  void goToJobCardScreen() {
    Get.toNamed(Routes.jobCard, arguments: jobId);
  }

  ///
}
