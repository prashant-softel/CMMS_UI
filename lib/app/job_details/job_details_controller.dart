import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';

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

  /// Others
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  Rx<int> jobId = 0.obs;
  int userId = 36;
  var breakdownTime;
  var facilityId = 0;

  /// Permit
  RxList<NewPermitModel?>? permitList = <NewPermitModel>[].obs;
  var permitDropdownValues = <String?>[].obs;
  List<TextEditingController> textControllers =
      List.generate(5, (_) => TextEditingController());

  final selectedPermit = Rx<NewPermitModel?>(null);

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

  void linkToExistingPermit() {
    getPermitList();
    showAlertDialog();
    // Initialize dropdown and text field values
    // associatedPermitList?.forEach((data) {
    //   permitDropdownValues.add(data.permitTypeName ?? '');
    //   final textControllerList = <TextEditingController>[];
    //   textControllerList.add(TextEditingController(text: ''));
    //   textControllerList.add(TextEditingController(text: ''));
    //   textControllerList.add(TextEditingController(text: ''));
    //   textControllerList.add(TextEditingController(text: ''));
    //   textControllerList.add(TextEditingController(text: ''));
    //   textControllers.add(textControllerList);
    // });
  }

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
