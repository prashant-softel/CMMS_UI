import 'dart:async';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/utils/save_file_web.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

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
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
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
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;

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
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
      }
      Future.delayed(Duration(seconds: 1), () {
        if (jobId.value > 0) {
          getJobDetails(jobId.value, facilityId);
        }
      });
    });
    try {
      await setJobId();
      // getJobDetails(jobId.value, facilityId);
      if (jobId.value > 0) {
        getjobDetailsModel(jobId.value, facilityId);
      }
      if (jobId.value > 0) {
        getMrsListByModule(jobId: jobId.value, facilityId: facilityId);
      }

      isDataLoading.value = false;
      textControllers =
          List.generate(permitValuesCount, (_) => TextEditingController());
      permitValues = RxList<String>.filled(permitValuesCount, '');
    } //
    catch (e) {
      Utility.showDialog(e.toString(), 'onReady');
      print(e);
    }
    super.onReady();
  }

  Future<void> setJobId() async {
    final String? _jobId = Get.parameters['jobId'];
    jobId.value = int.tryParse(_jobId ?? "") ?? 0;

    //   try {
    //     final _jobId = await jobDetailsPresenter.getValue();

    //     // If jobId is unavailable, take it from the arguments received
    //     if (_jobId == null || _jobId == '' || _jobId == "null") {
    //       var data = Get.arguments;
    //       jobId.value = data["jobId"];
    //       jobDetailsPresenter.saveValue(jobId: jobId.value.toString());
    //     } else {
    //       jobId.value = int.tryParse(_jobId) ?? 0;
    //     }
    //   } catch (e) {
    //     Utility.showDialog(e.toString(), 'jobId');
    //   }
    // }
    // startStopJobCard() {
    //   isJobCardStarted.value = !isJobCardStarted.value;
  }

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
      int jcId = jobCardId.value;
      Get.toNamed('${Routes.jobCard}/$jcId');

      //  }
    }
  }

  void getJobDetails(int? jobId, int facilityId) async {
    try {
      jobDetailsList?.value = <JobDetailsModel>[];
      final _jobDetailsList = await jobDetailsPresenter.getJobDetails(
          facilityId: facilityId, jobId: jobId, isLoading: false);

      if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
        jobDetailsModel.value = _jobDetailsList[0];
        associatedPermitList?.value =
            jobDetailsModel.value?.associatedPermitList ?? [];
        update(["jobDetailsModel"]);
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'getJobDetails');
    }
  }

  void getjobDetailsModel(int jobId, int facilityId) async {
    try {
      jobAssociatedModelsList?.value = <JobAssociatedModel>[];
      final _jobAssociatedModelsList =
          await jobDetailsPresenter.getjobDetailsModel(
              jobId: jobId, isLoading: false, facilityId: facilityId);

      if (_jobAssociatedModelsList != null &&
          _jobAssociatedModelsList.isNotEmpty) {
        jobAssociatedModelsList!.value = _jobAssociatedModelsList;
        // associatedPermitList?.value =
        //     jobAssociatedModel.value?.associatedPermitList ?? [];
        update(["getjobDetailsModel"]);
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'getjobDetailsModel');
    }
  }

  Future<void> editNewPermit({int? permitId, bool? isChecked}) async {
    clearJobDetailStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearpmTaskValue();
    clearPermitStoreData();
    Get.toNamed(Routes.createPermit, arguments: {
      'permitId': permitId,
      'isChecked': isChecked,
      "type": 1,
      "isFromPmTaskDetails": true,
      "jobModel": jobDetailsModel.value,
      "pmTaskModel": pmtaskViewModel.value,
      "mcModel": jobDetailsModel.value,
      "scheduleID": 0
    });
    print('PermitIDForTBt:$permitId');
    print('PermitIdArgument:$isChecked');
  }

  Future<void> getMrsListByModule(
      {required int jobId, required int facilityId}) async {
    /// TODO: CHANGE THESE VALUES
    // int moduleType = 81;
    // // int tempModuleType = 21;
    // int id = Get.arguments;
    //
    listMrsByJobId?.value = await jobDetailsPresenter.getMrsListByModule(
          jobId,
          facilityId,
          false,
        ) ??
        [];
    update(["JobsLinkdToPermitList"]);
  }

  void goToEditJobScreen(int? _jobId) {
    clearStoreDataType();

    Get.toNamed(Routes.editJob, arguments: {'jobId': _jobId, 'typeEdit': 2});
  }

  void clearStoreDataType() {
    jobDetailsPresenter.clearStoreDataType();
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
                    .where((e) =>
                        e.feature_id == UserAccessConstants.kJobCardFeatureId &&
                        e.selfView == UserAccessConstants.kHaveSelfViewAccess)
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
    clearJobDetailStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearpmTaskValue();
    clearPermitStoreData();
    Get.toNamed(Routes.createPermit, arguments: {
      "jobModel": jobDetailsModel.value,
      "permitId": 0,
      "isChecked": false,
      "type": 1,
      "isFromJobDetails": true,
      "pmTaskModel": pmtaskViewModel.value,
      "mcModel": jobDetailsModel.value,
      "scheduleID": 0
    });
  }

  void goToJobCardScreen() {
    final _flutterSecureStoragejc = const FlutterSecureStorage();

    _flutterSecureStoragejc.delete(key: "JcId");
    createJobCard();
  }

  // void goToAddMrsScreen() {
  //   Get.toNamed(Routes.createMrs, arguments: jobId.value);
  // }

  void goToJobDetailsScreen() {
    // close pop-up
    Get.back();
    // reload screen
    getJobDetails(jobId.value, facilityId);
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
    String type = 1.toString();
    Get.offAllNamed('${Routes.viewPermitScreen}/$permitId/$type');

    // Get.toNamed(Routes.viewPermitScreen,
    //     arguments: {"permitId": permitId, "jobId": jobId, "type": 1});
    // print({"Permit", permitId, jobId});
  }

  Future<void> viewJobCArd({int? jobcardId}) async {
    Get.toNamed('${Routes.jobCard}/$jobCardId');
  }
  // Future<void> vieMRSList({Rx<int>? mrsId}) async {
  //   Get.toNamed(Routes.mrsViewScreen, arguments: mrsId);
  //   print({"mrsIdsexdrcftvgybhj", mrsId});
  // }

  ///
  void clearStoreData() {
    jobDetailsPresenter.clearValue();
  }

  void clearValueJobId() {
    jobDetailsPresenter.clearValueJobId();
  }

  void clearMrsIdStoreData() {
    jobDetailsPresenter.clearMrsIdStoreData();
  }

  void clearPermitStoreData() {
    jobDetailsPresenter.clearPermitStoreData();
  }

  void clearJobDetailStoreData() {
    jobDetailsPresenter.clearJobDetailStoreData();
  }

  void clearTypeStoreData() {
    jobDetailsPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    jobDetailsPresenter.clearisCheckedValue();
  }

  void clearpmTaskValue() {
    jobDetailsPresenter.clearpmTaskValue();
  }

  void clearMrsStoreData() {
    jobDetailsPresenter.clearValue();
  }

  void clearStoreDataTaskId() {
    jobDetailsPresenter.clearStoreDataTaskId();
  }

  void clearStoreTaskData() {
    jobDetailsPresenter.clearStoreTaskData();
  }

  void clearStoreTaskActivityData() {
    jobDetailsPresenter.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    jobDetailsPresenter.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    jobDetailsPresenter.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    jobDetailsPresenter.clearStoreTaskWhereUsedData();
  }

  void clearStoreDataJobId() {
    jobDetailsPresenter.clearStoreDataJobId();
  }

  Future<void> generateInvoice() async {
    try {
      final PdfDocument document = PdfDocument();

      final PdfPage page = document.pages.add();

      final Size pageSize = page.getClientSize();

      var url = "assets/assets/files/HFELogo.png";
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = response.bodyBytes;

        PdfBitmap image = PdfBitmap(data);

        final PdfLayoutResult result =
            drawHeader(page, pageSize, document, image);

        final List<int> bytes = await document.save();

        document.dispose();

        await saveAndLaunchFile(bytes, 'Job Details.pdf');
      } else {
        print("Error fetching the image: ${response.statusCode}");
      }
    } catch (e) {
      print("Error generating invoice: $e");
    }
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    final PdfPen borderPen = PdfPen(PdfColor(142, 180, 219), width: 1.0);
    final PdfBrush backgroundBrush = PdfSolidBrush(PdfColor(217, 226, 243));
    final PdfFont headerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);

    double margin = 10; // Margin from all sides
    double currentY =
        100; // Start position for the first section below the image
    double sectionHeight = 20; // Height for each section header
    double pageWidth = pageSize.width - 2 * margin;

    // Draw image
    page.graphics.drawImage(image, Rect.fromLTWH(margin, 10, 100, 80));

    final String centerText = 'Job Details Report';
    final PdfFont centerTextFont =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    final Size centerTextSize = centerTextFont.measureString(centerText);

    // Calculate the X position to center the text
    double centerX = (pageSize.width - centerTextSize.width) / 2;

    // Draw the center text after the image
    page.graphics.drawString(
      centerText,
      centerTextFont,
      bounds: Rect.fromLTWH(
          centerX, 60, centerTextSize.width, centerTextSize.height),
    );

    // Site name section
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString(
        'Site name : ${jobDetailsModel.value?.facilityName ?? ''}', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // MC Information section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Job Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw MC Information Details (Left Side)
    double labelWidth = 80;
    double valueWidth = 120;
    double labelX = margin + 5;
    double valueX = labelX + labelWidth + 5;

    List<String> mcInfoLabelsLeft = [
      'Job ID',
      'Job Title',
      'Equipment Categories',
      'Fault',
      'Job Description'
    ];

    List<String> mcInfoValuesLeft = [
      'JOb${jobDetailsModel.value?.id ?? ''}',
      '${jobDetailsModel.value?.jobTitle ?? ''}',
      '${jobDetailsModel.value?.equipmentCatList ?? ''}',
      '${jobDetailsModel.value?.workTypeList ?? ''}',
      '${jobDetailsModel.value?.jobDescription ?? ''}',
    ];

    double rowHeight = 15;

    for (int i = 0; i < mcInfoLabelsLeft.length; i++) {
      page.graphics.drawString(mcInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(mcInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw MC Information Details (Right Side)
    double labelWidthRight = 80;
    double valueWidthRight = 120;
    double labelXRight = pageWidth / 2 + margin; // Position on the right side
    double valueXRight = labelXRight + labelWidthRight + 5;

    List<String> mcInfoLabelsRight = [
      'Block Name',
      'Equipment Name',
      'Raised By',
      'Assigned To',
      'BreakDown'
    ];
    List<String> mcInfoValuesRight = [
      '${jobDetailsModel.value?.blockName}',
      '${jobDetailsModel.value?.workingAreaList}',
      '${jobDetailsModel.value!.createdByName}',
      '${jobDetailsModel.value?.assignedName ?? ''}',
      '${jobDetailsModel.value?.breakdownTime ?? ''}',
    ];

    currentY -= mcInfoLabelsLeft.length *
        rowHeight; // Reset currentY to align with left side

    for (int i = 0; i < mcInfoLabelsRight.length; i++) {
      page.graphics.drawString(mcInfoLabelsRight[i], contentFont,
          bounds: Rect.fromLTWH(
              labelXRight, currentY + 5, labelWidthRight, rowHeight));
      page.graphics.drawString(mcInfoValuesRight[i], contentFont,
          bounds: Rect.fromLTWH(
              valueXRight, currentY + 5, valueWidthRight, rowHeight));
      currentY += rowHeight;
    }

    // Add "Schedule Execution" header before the table
    currentY += 15;
    double tableWidth =
        pageWidth; // Ensure the header width matches the table width
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, tableWidth, sectionHeight));
    page.graphics.drawString('Associated JobCard(s)', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));

    currentY += sectionHeight;

    // // Calculate column widths proportionally
    // double totalColWidth = pageWidth - 2 * margin;
    // double colWidthSchId = totalColWidth * 0.06;
    // double colWidthDays = totalColWidth * 0.06;
    // double colWidthScheduled = totalColWidth * 0.12;
    // double colWidthCleaned = totalColWidth * 0.10;
    // double colWidthAbandoned = totalColWidth * 0.12;
    // double colWidthPending = totalColWidth * 0.10;
    // double colWidthWaterUsed = totalColWidth * 0.08;
    // double colWidthPermitID = totalColWidth * 0.10;
    // double colWidthPermitStatus = totalColWidth * 0.15;
    // double colWidthStatus = totalColWidth * 0.15;

    // // Draw table header
    // page.graphics.drawRectangle(
    //     pen: borderPen,
    //     brush: backgroundBrush,
    //     bounds: Rect.fromLTWH(margin, currentY, tableWidth, 25));
    // page.graphics.drawString('Id', headerFont,
    //     bounds: Rect.fromLTWH(margin, currentY, colWidthSchId, 25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('Days', headerFont,
    //     bounds:
    //         Rect.fromLTWH(margin + colWidthSchId, currentY, colWidthDays, 25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('Scheduled', headerFont,
    //     bounds: Rect.fromLTWH(margin + colWidthSchId + colWidthDays, currentY,
    //         colWidthScheduled, 25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('Cleaned', headerFont,
    //     bounds: Rect.fromLTWH(
    //         margin + colWidthSchId + colWidthDays + colWidthScheduled,
    //         currentY,
    //         colWidthCleaned,
    //         25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('Abandoned', headerFont,
    //     bounds: Rect.fromLTWH(
    //         margin +
    //             colWidthSchId +
    //             colWidthDays +
    //             colWidthScheduled +
    //             colWidthCleaned,
    //         currentY,
    //         colWidthAbandoned,
    //         25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('Pending', headerFont,
    //     bounds: Rect.fromLTWH(
    //         margin +
    //             colWidthSchId +
    //             colWidthDays +
    //             colWidthScheduled +
    //             colWidthCleaned +
    //             colWidthAbandoned,
    //         currentY,
    //         colWidthPending,
    //         25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('Water Used', headerFont,
    //     bounds: Rect.fromLTWH(
    //         margin +
    //             colWidthSchId +
    //             colWidthDays +
    //             colWidthScheduled +
    //             colWidthCleaned +
    //             colWidthAbandoned +
    //             colWidthPending,
    //         currentY,
    //         colWidthWaterUsed,
    //         25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('PTW ID', headerFont,
    //     bounds: Rect.fromLTWH(
    //         margin +
    //             colWidthSchId +
    //             colWidthDays +
    //             colWidthScheduled +
    //             colWidthCleaned +
    //             colWidthAbandoned +
    //             colWidthPending +
    //             colWidthWaterUsed,
    //         currentY,
    //         colWidthPermitID,
    //         25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('PTW Status', headerFont,
    //     bounds: Rect.fromLTWH(
    //         margin +
    //             colWidthSchId +
    //             colWidthDays +
    //             colWidthScheduled +
    //             colWidthCleaned +
    //             colWidthAbandoned +
    //             colWidthPending +
    //             colWidthWaterUsed +
    //             colWidthPermitID,
    //         currentY,
    //         colWidthPermitStatus,
    //         25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));
    // page.graphics.drawString('Status', headerFont,
    //     bounds: Rect.fromLTWH(
    //         margin +
    //             colWidthSchId +
    //             colWidthDays +
    //             colWidthScheduled +
    //             colWidthCleaned +
    //             colWidthAbandoned +
    //             colWidthPending +
    //             colWidthWaterUsed +
    //             colWidthPermitID +
    //             colWidthPermitStatus,
    //         currentY,
    //         colWidthStatus,
    //         25),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));

    // currentY += 25;

    // // // Draw table rows
    // // for (var schedule in jobDetailsModel.value?.schedules ?? []) {
    // //   page.graphics.drawRectangle(
    // //       pen: borderPen,
    // //       bounds: Rect.fromLTWH(margin, currentY, tableWidth, 25));
    // //   page.graphics.drawString('${schedule.scheduleId}', contentFont,
    // //       bounds: Rect.fromLTWH(margin, currentY, colWidthSchId, 25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString('${schedule.cleaningDay}', contentFont,
    // //       bounds:
    // //           Rect.fromLTWH(margin + colWidthSchId, currentY, colWidthDays, 25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString('${schedule.scheduled}', contentFont,
    // //       bounds: Rect.fromLTWH(margin + colWidthSchId + colWidthDays, currentY,
    // //           colWidthScheduled, 25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString('${schedule.cleaned}', contentFont,
    // //       bounds: Rect.fromLTWH(
    // //           margin + colWidthSchId + colWidthDays + colWidthScheduled,
    // //           currentY,
    // //           colWidthCleaned,
    // //           25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString('${schedule.abandoned}', contentFont,
    // //       bounds: Rect.fromLTWH(
    // //           margin +
    // //               colWidthSchId +
    // //               colWidthDays +
    // //               colWidthScheduled +
    // //               colWidthCleaned,
    // //           currentY,
    // //           colWidthAbandoned,
    // //           25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString('${schedule.pending}', contentFont,
    // //       bounds: Rect.fromLTWH(
    // //           margin +
    // //               colWidthSchId +
    // //               colWidthDays +
    // //               colWidthScheduled +
    // //               colWidthCleaned +
    // //               colWidthAbandoned,
    // //           currentY,
    // //           colWidthPending,
    // //           25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString('${schedule.waterUsed}', contentFont,
    // //       bounds: Rect.fromLTWH(
    // //           margin +
    // //               colWidthSchId +
    // //               colWidthDays +
    // //               colWidthScheduled +
    // //               colWidthCleaned +
    // //               colWidthAbandoned +
    // //               colWidthPending,
    // //           currentY,
    // //           colWidthWaterUsed,
    // //           25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString(
    // //       'PTW${schedule.permit_id}', contentFont, // New Permit ID column
    // //       bounds: Rect.fromLTWH(
    // //           margin +
    // //               colWidthSchId +
    // //               colWidthDays +
    // //               colWidthScheduled +
    // //               colWidthCleaned +
    // //               colWidthAbandoned +
    // //               colWidthPending +
    // //               colWidthWaterUsed,
    // //           currentY,
    // //           colWidthPermitID,
    // //           25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString('${schedule.status_short_ptw}', contentFont,
    // //       bounds: Rect.fromLTWH(
    // //           margin +
    // //               colWidthSchId +
    // //               colWidthDays +
    // //               colWidthScheduled +
    // //               colWidthCleaned +
    // //               colWidthAbandoned +
    // //               colWidthPending +
    // //               colWidthWaterUsed +
    // //               colWidthPermitID,
    // //           currentY,
    // //           colWidthPermitStatus,
    // //           25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   page.graphics.drawString('${schedule.status_short}', contentFont,
    // //       bounds: Rect.fromLTWH(
    // //           margin +
    // //               colWidthSchId +
    // //               colWidthDays +
    // //               colWidthScheduled +
    // //               colWidthCleaned +
    // //               colWidthAbandoned +
    // //               colWidthPending +
    // //               colWidthWaterUsed +
    // //               colWidthPermitID +
    // //               colWidthPermitStatus,
    // //           currentY,
    // //           colWidthStatus,
    // //           25),
    // //       format: PdfStringFormat(
    // //           alignment: PdfTextAlignment.center,
    // //           lineAlignment: PdfVerticalAlignment.middle));
    // //   currentY += 25;
    // // }

    final String signatureText = 'Signature';
    final Size signatureSize = contentFont.measureString(signatureText);
    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageWidth - (signatureSize.width + margin),
            currentY + 20, signatureSize.width, signatureSize.height))!;
  }
}
