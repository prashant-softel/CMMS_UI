import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/job_details_model.dart';
import '../../domain/models/job_model.dart';
import '../../domain/models/new_permit_list_model.dart';
import '../home/home_presenter.dart';
import '../job_card_details/views/widgets/permit_list_table_dialog.dart';
import '../navigators/app_pages.dart';
import '../utils/utility.dart';
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
  RxList<JobAssociatedModel?>? jobAssociatedModelsList =
      <JobAssociatedModel?>[].obs;
  RxList<MRSListByJobIdModel?>? listMrsByJobId = <MRSListByJobIdModel?>[].obs;

  // Rx<JobAssociatedModel?> jobAssociatedModel = JobAssociatedModel().obs;
  Rx<JobModel?> statusJobmodel = JobModel().obs;
  RxList<AssociatedPermit>? associatedPermitList = <AssociatedPermit>[].obs;
  PaginationController schedulePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  /// Permit
  RxList<NewPermitModel?>? permitList = <NewPermitModel>[].obs;
  var permitDropdownValues = <String?>[].obs;

  final selectedPermit = Rx<NewPermitModel?>(null);
  Rx<int?> selectedPermitId = 0.obs;
  Rx<bool> isPermitLinked = false.obs;
  int permitValuesCount = 6;
  var permitValues;
  late List<TextEditingController> textControllers;

  RxString responseMessage = ''.obs;

  /// Others
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  Rx<int> jobId = 0.obs;
  Rx<bool> isDataLoading = true.obs;
  int userId = 36;
  var breakdownTime;
  var facilityId = 0;
  Rx<int> jobCardId = 0.obs;

  ///
  // @override
  // void onInit() async {
  //   jobId.value = Get.arguments["jobId"];
  //   // try {
  //   //   await setJobId();
  //   //   getJobDetails(jobId.value);
  //   //   isDataLoading.value = false;
  //   //   textControllers =
  //   //       List.generate(permitValuesCount, (_) => TextEditingController());
  //   //   permitValues = RxList<String>.filled(permitValuesCount, '');
  //   // } //
  //   // catch (e) {
  //   //   Utility.showDialog(e.toString() + 'onReady');
  //   //   print(e);
  //   // }

  //   super.onInit();
  // }

  @override
  void onReady() async {
    try {
      await setJobId();
      getJobDetails(jobId.value);

      getjobDetailsModel(jobId.value);
      getMrsListByModule(jobId: jobId.value);

      isDataLoading.value = false;
      textControllers =
          List.generate(permitValuesCount, (_) => TextEditingController());
      permitValues = RxList<String>.filled(permitValuesCount, '');
    } //
    catch (e) {
      Utility.showDialog(e.toString() + 'onReady');
      print(e);
    }
    super.onReady();
  }

  Future<void> setJobId() async {
    try {
      final _jobId = await jobDetailsPresenter.getValue();

      // If jobId is unavailable, take it from the arguments received
      if (_jobId == null || _jobId == '' || _jobId == "null") {
        var data = Get.arguments;
        jobId.value = data["jobId"];
        jobDetailsPresenter.saveValue(jobId: jobId.value.toString());
      } else {
        jobId.value = int.tryParse(_jobId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString() + 'jobId');
    }
  }
  // startStopJobCard() {
  //   isJobCardStarted.value = !isJobCardStarted.value;
  // }

  Future<void> createJobCard() async {
    //   await startStopJobCard();

    ///
    // if (isJobCardStarted.value == true) {
    Map<String, dynamic>? responseMapJobCardStarted =
        await jobDetailsPresenter.createJobCard(
      jobId: jobId.value,
      isLoading: false,
    );

    if (responseMapJobCardStarted != null &&
        responseMapJobCardStarted.length > 0) {
      final _flutterSecureStorage = const FlutterSecureStorage();

      // await _flutterSecureStorage.delete(key: "jobId");
      final _jobCardId = responseMapJobCardStarted["id"][0];
      jobCardId.value = _jobCardId;

      Get.toNamed(Routes.jobCard, arguments: {'JcId': jobCardId.value});

      //  }
    }
  }

  void getJobDetails(int? jobId) async {
    try {
      jobDetailsList?.value = <JobDetailsModel>[];
      final _jobDetailsList = await jobDetailsPresenter.getJobDetails(
          jobId: jobId, isLoading: false);

      if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
        jobDetailsModel.value = _jobDetailsList[0];
        associatedPermitList?.value =
            jobDetailsModel.value?.associatedPermitList ?? [];
        update(["jobDetailsModel"]);
      }
    } catch (e) {
      Utility.showDialog(e.toString() + 'getJobDetails');
    }
  }

  void getjobDetailsModel(int? jobId) async {
    try {
      jobAssociatedModelsList?.value = <JobAssociatedModel>[];
      final _jobAssociatedModelsList = await jobDetailsPresenter
          .getjobDetailsModel(jobId: jobId, isLoading: false);

      if (_jobAssociatedModelsList != null &&
          _jobAssociatedModelsList.isNotEmpty) {
        jobAssociatedModelsList!.value = _jobAssociatedModelsList;
        // associatedPermitList?.value =
        //     jobAssociatedModel.value?.associatedPermitList ?? [];
        update(["getjobDetailsModel"]);
      }
    } catch (e) {
      Utility.showDialog(e.toString() + 'getjobDetailsModel');
    }
  }

  Future<void> getMrsListByModule({required int jobId}) async {
    /// TODO: CHANGE THESE VALUES
    // int moduleType = 81;
    // // int tempModuleType = 21;
    // int id = Get.arguments;
    //
    listMrsByJobId?.value = await jobDetailsPresenter.getMrsListByModule(
          jobId,
          false,
        ) ??
        [];
    update(["JobsLinkdToPermitList"]);
  }

  void goToEditJobScreen(int? _jobId) {
    Get.toNamed(Routes.editJob, arguments: {'jobId': _jobId});
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
    if (responseMapPermitLinked != null && responseMapPermitLinked.length > 0) {
      var _jobId = responseMapPermitLinked["id"][0];
      responseMessage.value = responseMapPermitLinked["message"];
      isPermitLinked.value = true;
    }
  }

  ///
  Future<List<NewPermitModel?>?> getPermitList() async {
    facilityId = jobDetailsModel.value?.facilityId ?? 0;
    final _permitList = await jobDetailsPresenter.getPermitList(
        facilityId: facilityId,
        selfView: varUserAccessModel.value.access_list!
                    .where((e) => e.feature_id == 4 && e.selfView == 1)
                    .length >
                0
            ? true
            : false,
        isLoading: false);
    if (_permitList != null) {
      permitList?.value = <NewPermitModel>[];
      permitList?.value = _permitList;
    }
    return _permitList;
  }

  createNewPermit() {
    Get.toNamed(Routes.newPermit, arguments: {
      "jobModel": jobDetailsModel.value,
      "isFromJobDetails": true,
    });
  }

  void goToJobCardScreen() {
    final _flutterSecureStoragejc = const FlutterSecureStorage();

    _flutterSecureStoragejc.delete(key: "JcId");
    createJobCard();
  }

  void goToAddMrsScreen() {
    Get.toNamed(Routes.createMrs, arguments: jobId.value);
  }

  void goToJobDetailsScreen() {
    // close pop-up
    Get.back();
    // reload screen
    getJobDetails(jobId.value);
  }

  onPermitSelected(NewPermitModel? newPermitModel) {
    if (newPermitModel != null) {
      selectedPermit.value = newPermitModel;
      // Get the selected permitId
      selectedPermitId.value = newPermitModel.permitId;
      // convert status to string
      final _status =
          PermitStatusData.getStatusStringFromInt(newPermitModel.ptwStatus);
      // Set the values of the permitValues list based on the selected permit
      permitValues[0] = newPermitModel.permitSiteNo.toString();
      permitValues[1] = newPermitModel.permitId.toString();
      permitValues[2] = newPermitModel.permitTypeName ?? '';
      permitValues[3] = newPermitModel.requestByName ?? '';
      permitValues[4] = _status;
      permitValues[5] = DateFormat('yyyy-MM-dd').format(
          newPermitModel.requestDatetime ??
              DateTime.now()); // Format date as needed
    } else {
      permitValues.fillRange(0, permitValuesCount,
          ''); // Clear the values if no permit is selected
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

  Future<void> viewNewPermitList({
    int? permitId,
    int? jobId,
  }) async {
    Get.toNamed(Routes.viewPermitWebScreen,
        arguments: {"permitId": permitId, "jobId": jobId});
    print({"Permit", permitId, jobId});
  }

  Future<void> viewJobCArd({int? jobcardId}) async {
    Get.toNamed(Routes.jobCard, arguments: jobcardId);
    print({"jobcardvghwjbkn", jobcardId});
  }
  // Future<void> vieMRSList({Rx<int>? mrsId}) async {
  //   Get.toNamed(Routes.mrsViewScreen, arguments: mrsId);
  //   print({"mrsIdsexdrcftvgybhj", mrsId});
  // }

  ///
}
