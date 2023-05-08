import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../domain/models/job_details_model.dart';
import '../../domain/models/new_permit_list_model.dart';
import '../home/home_presenter.dart';
import '../job_card_details/views/widgets/permit_list_table_dialog.dart';
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

  /// Job Details
  RxList<JobDetailsModel?>? jobDetailsList = <JobDetailsModel?>[].obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  RxList<AssociatedPermit>? associatedPermitList = <AssociatedPermit>[].obs;

  /// Permit
  RxList<NewPermitModel?>? permitList = <NewPermitModel>[].obs;
  var permitDropdownValues = <String?>[].obs;
  List<TextEditingController> textControllers =
      List.generate(5, (_) => TextEditingController());
  final selectedPermit = Rx<NewPermitModel?>(null);
  Rx<int?> selectedPermitId = 0.obs;

  final permitValues = RxList<String>.filled(5, '');
  RxString responseMessage = ''.obs;

  /// Others
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  Rx<int> jobId = 0.obs;
  int userId = 36;
  var breakdownTime;
  var facilityId = 0;

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

  // void setTextValue(int index, String value) {
  //   // Update the value for the corresponding index
  // }

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

  void showPermitsDialog() {
    getPermitList();
    showAlertDialog();
  }

  void linkToPermit() async {
    Map<String, dynamic>? responseMapPermitLinked =
        await jobDetailsPresenter.linkToPermit(
      permitId: selectedPermitId.value,
      jobId: jobId.value,
      isLoading: false,
    );
    if (responseMapPermitLinked != null) {
      var _jobId = responseMapPermitLinked["id"][0];
      responseMessage.value = responseMapPermitLinked["message"];
    }
  }

  ///
  Future<void> getPermitList() async {
    facilityId = jobDetailsModel.value?.facilityId ?? 0;
    final _permitList = await jobDetailsPresenter.getPermitList(
        facilityId: facilityId, selfView: false, isLoading: false);
    if (_permitList != null) {
      permitList?.value = <NewPermitModel>[];
      permitList?.value = _permitList;
    }
    //return _permitList;
  }

  createNewPermit() {
    Get.toNamed(Routes.newPermit, arguments: {
      "jobModel": jobDetailsModel.value,
      "isFromJobDetails": true,
    });
  }

  void goToJobCardScreen() {
    Get.toNamed(Routes.jobCard, arguments: jobId);
  }

  void goToJobDetailsScreen() {
    Get.offNamed(Routes.jobDetails, arguments: {'jobId': jobId});
  }

  onPermitSelected(NewPermitModel? newPermitModel) {
    if (newPermitModel != null) {
      selectedPermit.value = newPermitModel;
      // Get the selected permitId
      selectedPermitId.value = newPermitModel.permitId;
      // Set the values of the permitValues list based on the selected permit

      permitValues[0] = newPermitModel.permitSiteNo.toString();
      permitValues[1] = newPermitModel.permitTypeName ?? '';
      permitValues[2] = newPermitModel.requestByName ?? '';
      permitValues[3] = newPermitModel.ptwStatus.toString();
      permitValues[4] = DateFormat('yyyy-MM-dd').format(
          newPermitModel.requestDatetime ??
              DateTime.now()); // Format date as needed
    } else {
      permitValues.fillRange(
          0, 5, ''); // Clear the values if no permit is selected
    }
  }

  /// Show alert dialog
  static void showAlertDialog({
    int? jobId,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(PermitListTableDialog());
  }

  ///
}
