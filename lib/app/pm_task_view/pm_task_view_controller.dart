import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_presenter.dart';
import 'package:cmms/app/pm_task_view/view/permit_list_table.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/save_file_web.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/close_permit_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../domain/models/history_model.dart';
import '../theme/styles.dart';
import '../widgets/custom_elevated_button.dart';

class PreventiveMaintenanceTaskViewController extends GetxController {
  ///
  PreventiveMaintenanceTaskViewController(
    this.preventiveMaintenanceTaskViewPresenter,
  );
  PreventiveMaintenanceTaskViewPresenter preventiveMaintenanceTaskViewPresenter;
  Rx<int> scheduleId = 0.obs;
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  RxList<ScheduleCheckPoint?>? scheduleCheckPoint = <ScheduleCheckPoint?>[].obs;
  ScheduleCheckPoint? selectedItem;
  PaginationController schedulePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<String> scheduleCheckPointTableColumns = <String>[].obs;
  // RxList<HistoryLog?>? historyLog = <HistoryLog?>[].obs;
  // HistoryLog? historyLogModel;
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();
  RxList<NewPermitModel?>? permitList = <NewPermitModel>[].obs;
  var permitDropdownValues = <String?>[].obs;

  bool openDueTimeDatePicker = false;
  var dueDateTimeCtrlr = TextEditingController();

  final selectedPermit = Rx<NewPermitModel?>(null);
  Rx<int?> selectedPermitId = 0.obs;
  Rx<bool> isPermitLinked = false.obs;
  int permitValuesCount = 6;
  var permitValues;
  late List<TextEditingController> textControllers;
  RxString responseMessage = ''.obs;
  RxString startresponseMessage = ''.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<int> permitIdclose = 0.obs;

  var dueToDateTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedDueTime = DateTime.now().obs;
  TextEditingController commentCtrlr = TextEditingController();
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;

  ///Assigned To
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<MRSListByJobIdModel?>? listMrsByTaskId = <MRSListByJobIdModel?>[].obs;
  RxList<CmmrsItems> cmmrsItems = <CmmrsItems>[].obs;
  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;
  int storeStatus = 0;
  Rx<bool> allTrue = false.obs;
  var itemExistsWithZeroDifference = <bool>[].obs;
  var returnitemExists = <int>[].obs;

  //////////////////////////////////

  @override
  void onInit() async {
    try {
      await setScheduleId();

      // Subscribe to facilityId$ stream to listen for changes.
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        print('Received facilityId: $event'); // Debugging log

        facilityId = event;
        if (facilityId > 0) {
          isFacilitySelected.value = true;

          if (scheduleId.value != 0) {
            // Perform necessary API calls or updates.
            await getPmtaskViewList(
              scheduleId: scheduleId.value,
              isloading: true,
              facilityId: facilityId,
            );
            getHistory(facilityId);
            getMrsListByModuleTask(taskId: scheduleId.value);
          }

          getReAssignedToList(facilityId);
        }
      });

      // Optional: If you have any textControllers or permitValues, initialize them.
      // textControllers = List.generate(
      //     permitValuesCount, (_) => TextEditingController());
      // permitValues = RxList<String>.filled(permitValuesCount, '');

      super.onInit();
    } catch (e) {
      print('Error in onInit: $e');
    }
  }

  Future<void> setScheduleId() async {
    final String? _pmTaskId = Get.parameters['pmTaskId'];
    scheduleId.value = int.tryParse(_pmTaskId ?? "") ?? 0;

    // try {
    //   final _scheduleId =
    //       await preventiveMaintenanceTaskViewPresenter.getValue();

    //   //  String? _scheduleId = await _flutterSecureStorage.read(key: "pmTaskId");
    //   if (_scheduleId == null || _scheduleId == '' || _scheduleId == "null") {
    //     var dataFromPreviousScreen = Get.arguments;

    //     scheduleId.value = dataFromPreviousScreen['pmTaskId'];
    //     preventiveMaintenanceTaskViewPresenter.saveValue(
    //         pmTaskId: scheduleId.value.toString());

    //     // await _flutterSecureStorage.write(
    //     //   key: "pmTaskId",
    //     //   value: scheduleId.value == null ? '' : scheduleId.value.toString(),
    //     // );
    //   } else {
    //     scheduleId.value = int.tryParse(_scheduleId) ?? 0;
    //   }
    //   //  await _flutterSecureStorage.delete(key: "scheduleId");
    // } catch (e) {
    //   Utility.showDialog(e.toString(), 'scheduleId');
    // }
  }

  Future<void> getMrsListByModuleTask({required int taskId}) async {
    listMrsByTaskId?.value =
        await preventiveMaintenanceTaskViewPresenter.getMrsListByModuleTask(
              taskId,
              false,
            ) ??
            [];
    for (var item in listMrsByTaskId!.value) {
      cmmrsItems.value = item!.cmmrsItems!;
    }
    _processJsonData();
    allTrue.value = itemExistsWithZeroDifference.every((item) => item);

    // update(["taskLinkdToPermitList"]);
  }

  void _processJsonData() {
    itemExistsWithZeroDifference.value = cmmrsItems!.map((element) {
      double issuedQty = element?.issued_qty ?? 0;
      double usedQty = element?.used_qty ?? 0;
      return (issuedQty - usedQty) == 0;
    }).toList();
    returnitemExists.value = cmmrsItems!.map((element) {
      return element?.mrs_return_ID ?? 0;
    }).toList();
  }

  Future<void> getHistory(int facilityId) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 27;
    //
    historyList?.value =
        await preventiveMaintenanceTaskViewPresenter.getHistory(
              // tempModuleType,
              // tempJobCardId,
              moduleType,
              scheduleId.value,
              facilityId,
              true,
            ) ??
            [];
    update(["historyList"]);
  }

  Future<void> getReAssignedToList(_facilityId) async {
    final _assignedToList =
        await preventiveMaintenanceTaskViewPresenter.getAssignedToListWOAttend(
            facilityId: _facilityId,
            featureId: UserAccessConstants.kPmTaskFeatureId,
            isattendanceneeded: 0);

    if (_assignedToList != null) {
      for (var _assignedTo in _assignedToList) {
        assignedToList.add(_assignedTo);
      }
      update(["assignedToList"]);
    }
  }

  Future<void> getPmtaskViewList(
      {int? scheduleId, bool? isloading, required int facilityId}) async {
//scheduleId = 5326;
    final _permitDetails =
        await preventiveMaintenanceTaskViewPresenter.getPmtaskViewList(
            scheduleId: scheduleId,
            isloading: isloading,
            facilityId: facilityId);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;

      scheduleCheckPoint!.value = _permitDetails.schedules ?? [];
      // if (pmtaskViewModel.value?.status == 161 ||
      //     pmtaskViewModel.value?.status == 162 ||
      //     pmtaskViewModel.value?.status == 163 ||
      //     pmtaskViewModel.value?.status == 164) {
      //   preventiveMaintenanceTaskViewPresenter.saveStatusValue(
      //       status: pmtaskViewModel.value?.status.toString());

      //   // await _flu
      // }
    }
  }

  void showPermitsDialog() {
    getPermitList();
    showAlertDialog();
  }

  static void showAlertDialog({
    int? jobId,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(SchedulePermitListTableDialog());
  }

  Future<List<NewPermitModel?>?> getPermitList() async {
    permitList?.value = <NewPermitModel>[];

    // facilityId = jobDetailsModel.value?.facilityId ?? 0;
    final _permitList =
        await preventiveMaintenanceTaskViewPresenter.getPermitList(
            facilityId: pmtaskViewModel.value?.facility_id,
            selfView: false,
            isLoading: false);
    if (_permitList != null) {
      permitList?.value = _permitList;
    }
    return _permitList;
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

  // void linkToPermit() async {
  //   Map<String, dynamic>? responseMapPermitLinked =
  //       await preventiveMaintenanceTaskViewPresenter.scheduleLinkToPermit(
  //     permitId: selectedPermitId.value,
  //     scheduleId: scheduleId.value,
  //     isLoading: false,
  //   );
  //   if (responseMapPermitLinked != null && responseMapPermitLinked.length > 0) {
  //     // var _jobId = responseMapPermitLinked["id"][0];

  //     // isPermitLinked.value = true;
  //     Get.back();
  //     getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
  //   }
  // }

  void setPmTask() async {
    Map<String, dynamic>? responseMapStart =
        await preventiveMaintenanceTaskViewPresenter.setPmTask(
            scheduleId: scheduleId.value,
            isLoading: true,
            facility_id: facilityId);
    if (responseMapStart != null && responseMapStart.length > 0) {
      // getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
      startresponseMessage.value = responseMapStart["message"];
      // print({"jkfdkjfd", startresponseMessage});
      // isPermitLinked.value = true;
      _updatedailog();
    }
  }

  void _updatedailog() {
    Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Column(
            children: [
              Text(
                'PM Task Started',
                textAlign: TextAlign.center,
                style: Styles.green700,
              ),
              Divider(
                color: ColorValues.greyColor,
              )
            ],
          ),
          content: Builder(builder: (context) {
            var height = Get.height;

            return Container(
              height: height / 6,
              width: double.infinity,
              child: Container(
                margin: Dimens.edgeInsets20,
                child: Column(
                  children: [
                    Text(startresponseMessage.value),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // RichText(
                        //   text: TextSpan(
                        //       text: 'PM Execution Submitted with',
                        //       style: Styles.blue700,
                        //       children: <TextSpan>[
                        //         TextSpan(text: ' \n     Code', style: Styles.blue700),
                        //         TextSpan(
                        //           text: '  2444',
                        //           style: Styles.redBold15,
                        //         ),
                        //       ]),
                        // ),
                        // Dimens.boxHeight12,
                        //  Text("PM Execution Submitted with code PMSC87456"),
                        Container(
                          height: 35,
                          child: CustomElevatedButton(
                            text: "View Task",
                            onPressed: () async {
                              Get.back();
                              try {
                                await setScheduleId();

                                if (scheduleId != 0) {
                                  await getPmtaskViewList(
                                      scheduleId: scheduleId.value,
                                      isloading: true,
                                      facilityId: facilityId);
                                  getHistory(facilityId);
                                  getMrsListByModuleTask(
                                      taskId: scheduleId.value);
                                  getReAssignedToList(facilityId);
                                }
                                // textControllers =
                                //     List.generate(permitValuesCount, (_) => TextEditingController());
                                // permitValues = RxList<String>.filled(permitValuesCount, '');
                              } catch (e) {
                                print(e);
                              }
                            },
                            backgroundColor: ColorValues.appGreenColor,
                            textColor: ColorValues.whiteColor,
                          ),
                        ),
                        Dimens.boxWidth10,
                        Container(
                          height: 35,
                          child: CustomElevatedButton(
                            text: "PM Task List",
                            onPressed: () {
                              Get.back();

                              Get.offAndToNamed(Routes.pmTask);
                            },
                            backgroundColor: ColorValues.appDarkBlueColor,
                            textColor: ColorValues.whiteColor,
                          ),
                        ),
                        // Dimens.boxWidth10,
                        // Container(
                        //   height: 35,
                        //   child: CustomElevatedButton(
                        //     text: "Execute",
                        //     onPressed: () {
                        //       Get.back();

                        //       gotoexecution();
                        //     },
                        //     backgroundColor: ColorValues.appYellowColor,
                        //     textColor: ColorValues.whiteColor,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
          actions: [],
        ),
        barrierDismissible: false);
  }

  void onDropdownValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<EmployeeModel>):
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId != 0) {
            isAssignedToSelected.value = true;
          }
          selectedAssignedTo.value = value;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  // Future<void> gotoexecution() async {
  //   Get.offNamed(Routes.pmExecution, arguments: {'pmTaskId': scheduleId.value});
  // }
  Future<void> gotoexecution() async {
    String pmTaskId = scheduleId.value.toString(); // Get the schedule ID
    Get.offNamed('${Routes.pmExecution}/$pmTaskId'); // Pass the ID in the path
  }

  createNewPermit() {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearjobmodelValue();
    clearpmTaskValue();
    Get.toNamed(Routes.createPermit, arguments: {
      "pmTaskModel": pmtaskViewModel.value,
      "jobModel": jobDetailsModel.value,
      "permitId": 0,
      "isChecked": false,
      "type": 2,
      "isFromPmTaskDetails": true,
      "mcModel": mcExecutionDetailsModel.value,
      "scheduleID": 0
    });
  }

  Future<void> editNewPermit({int? permitId, bool? isChecked}) async {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearjobmodelValue();
    clearpmTaskValue();
    Get.toNamed(Routes.createPermit, arguments: {
      'permitId': permitId,
      'isChecked': isChecked,
      "type": 2,
      "isFromPmTaskDetails": true,
      "jobModel": jobDetailsModel.value,
      "pmTaskModel": pmtaskViewModel.value,
      "mcModel": mcExecutionDetailsModel.value,
      "scheduleID": 0
    });
    print('PermitIDForTBt:$permitId');
    print('PermitIdArgument:$isChecked');
  }

  approvePmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(
          id: scheduleId.value, comment: _comment, facilityId: facilityId);

      var approvetoJsonString = commentModel.toJson();
      final response =
          await preventiveMaintenanceTaskViewPresenter.approvePmTaskExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        // Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  approveCancelPmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(
          id: scheduleId.value, comment: _comment, facilityId: facilityId);

      var approveCanceltoJsonString = commentModel.toJson();
      final response = await preventiveMaintenanceTaskViewPresenter
          .approveCancelPmTaskExecution(
        approveCanceltoJsonString: approveCanceltoJsonString,
        isLoading: true,
      );
      if (response == true) {
        // Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  CancelPMTask() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(
          id: scheduleId.value, comment: _comment, facilityId: facilityId);
      ClosePermitModel ptwClose = ClosePermitModel(
          id: pmtaskViewModel.value?.permit_id ?? 0,
          comment: _comment,
          conditionIds: [1, 2, 3, 4],
          fileIds: []);

      var CancelPMTaskJsonString = commentModel.toJson();
      var closePtwJsonString = ptwClose.toJson();

      final permitId = pmtaskViewModel.value!.permit_id;
      bool shouldClosePermit = permitId! > 0;
      final response =
          await preventiveMaintenanceTaskViewPresenter.CancelPMTask(
        CancelPMTaskJsonString: CancelPMTaskJsonString,
        closePtwJsonString: closePtwJsonString,
        shouldClosePermit: shouldClosePermit,
        isLoading: true,
      );
      if (response == true) {
        // Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  closePmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: scheduleId.value, comment: _comment);
      ClosePermitModel ptwClose = ClosePermitModel(
          id: pmtaskViewModel.value?.permit_id ?? 0,
          comment: _comment,
          conditionIds: [1, 2, 3, 4],
          fileIds: [],
          facility_id: facilityId);
      var closetoJsonString = commentModel.toJson();
      var closePtwJsonString = ptwClose.toJson();

      final response =
          await preventiveMaintenanceTaskViewPresenter.closePmTaskExecution(
              closetoJsonString: closetoJsonString,
              isLoading: true,
              closePtwJsonString: closePtwJsonString);
      if (response == true) {
        Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  assignToPmTask({required int id}) async {
    {
      final response =
          await preventiveMaintenanceTaskViewPresenter.assignToPmTask(
              assignId: selectedAssignedToId,
              taskId: id,
              isLoading: true,
              facility_id: facilityId);
    }
  }

  rejectPmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(
          id: scheduleId.value, comment: _comment, facilityId: facilityId);

      var rejecttoJsonString = commentModel.toJson();
      final response =
          await preventiveMaintenanceTaskViewPresenter.rejectPmTaskExecution(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        // Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  rejectCancelPmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();
      // final _storeStatus =
      //     await preventiveMaintenanceTaskViewPresenter.getStatusValue();
      // storeStatus = int.tryParse(_storeStatus ?? "") ?? 0;
      // CommentModel commentModel = CommentModel(
      CommentModel commentModel = CommentModel(
          id: scheduleId.value, comment: _comment, facilityId: facilityId);

      // var rejectCanceltoJsonString = {
      //   "id": scheduleId.value,
      //   "comment": _comment,
      //   "facilityId": facilityId,
      //   "status": storeStatus
      // };
      var rejectCanceltoJsonString = commentModel.toJson();
      final response = await preventiveMaintenanceTaskViewPresenter
          .rejectCancelPmTaskExecution(
        rejectCanceltoJsonString: rejectCanceltoJsonString,
        isLoading: true,
      );
      if (response == true) {
        // Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  void clearMrsStoreData() {
    preventiveMaintenanceTaskViewPresenter.clearValue();
  }

  void clearStoreData() {
    preventiveMaintenanceTaskViewPresenter.clearStoreData();
  }

  void clearTypeStoreData() {
    preventiveMaintenanceTaskViewPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    preventiveMaintenanceTaskViewPresenter.clearisCheckedValue();
  }

  void clearjobmodelValue() {
    preventiveMaintenanceTaskViewPresenter.clearjobmodelValue();
  }

  void clearpmTaskValue() {
    preventiveMaintenanceTaskViewPresenter.clearpmTaskValue();
  }

  void clearStoreTaskData() {
    preventiveMaintenanceTaskViewPresenter.clearStoreTaskData();
  }

  void clearStoreTaskActivityData() {
    preventiveMaintenanceTaskViewPresenter.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    preventiveMaintenanceTaskViewPresenter.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    preventiveMaintenanceTaskViewPresenter.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    preventiveMaintenanceTaskViewPresenter.clearStoreTaskWhereUsedData();
  }

  void clearStoreDataJobId() {
    preventiveMaintenanceTaskViewPresenter.clearStoreDataJobId();
  }

  void clearPermitStoreData() {
    preventiveMaintenanceTaskViewPresenter.clearPermitStoreData();
  }

  Future<void> viewNewPermitList({
    int? permitId,
    int? jobId,
  }) async {
    String type = 2.toString();
    Get.offNamed('${Routes.viewPermitScreen}/$permitId/$type');

    // Get.toNamed(Routes.viewPermitScreen,
    //     arguments: {"permitId": permitId, "jobId": jobId, "type": 2});
    // print({"Permit", permitId, jobId});
  }

  Future<void> generateInvoice() async {
    final PdfDocument document = PdfDocument();

    final PdfPage page = document.pages.add();

    final Size pageSize = page.getClientSize();
    var url = "assets/assets/files/HFELogo.png";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;

    PdfBitmap image = PdfBitmap(data);

    final PdfLayoutResult result = drawHeader(page, pageSize, document, image);

    final List<int> bytes = await document.save();

    document.dispose();

    await saveAndLaunchFile(bytes, 'PM Task Report.pdf');
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

    // Draw images
    page.graphics.drawImage(image, Rect.fromLTWH(margin, 10, 100, 80));

    final String centerText = 'PM Task Report';
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
        'Site name : ${pmtaskViewModel.value?.site_name ?? ''}', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // PM Information
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('PM Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw PM Information Details (Left Side)
    double labelWidth = 80;
    double valueWidth = 120;
    double labelX = margin + 5;
    double valueX = labelX + labelWidth + 5;

    List<String> pmInfoLabelsLeft = [
      'PM Plan ID',
      'PM Plan/task title',
      'Due date',
      'Start date',
      'PMT Status'
    ];

    List<String> pmInfoValuesLeft = [
      'PMT${pmtaskViewModel.value?.id ?? ''}',
      '${pmtaskViewModel.value?.plan_title ?? ''}',
      '${pmtaskViewModel.value?.due_date ?? ''}',
      '${pmtaskViewModel.value?.start_time == "0001-01-01T00:00:00" ? '' : pmtaskViewModel.value?.start_time ?? ''}',
      '${pmtaskViewModel.value?.status_short ?? ''}',
    ];

    double rowHeight = 15;

    for (int i = 0; i < pmInfoLabelsLeft.length; i++) {
      page.graphics.drawString(pmInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(pmInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw PM Information Details (Right Side)
    double labelWidthRight = 80;
    double valueWidthRight = 120;
    double labelXRight = pageWidth / 2 + margin; // Position on the right side
    double valueXRight = labelXRight + labelWidthRight + 5;

    List<String> pmInfoLabelsRight = [
      'PM Task ID',
      'Frequency',
      'Assigned to',
      'Done date'
    ];
    List<String> pmInfoValuesRight = [
      '${pmtaskViewModel.value?.id ?? ''}',
      '${pmtaskViewModel.value?.frequency_name ?? ''}',
      '${pmtaskViewModel.value?.assigned_to_name ?? ''}',
      '${pmtaskViewModel.value?.done_date ?? ''}',
    ];

    currentY -= pmInfoLabelsLeft.length *
        rowHeight; // Reset currentY to align with left side

    for (int i = 0; i < pmInfoLabelsRight.length; i++) {
      page.graphics.drawString(pmInfoLabelsRight[i], contentFont,
          bounds: Rect.fromLTWH(
              labelXRight, currentY + 5, labelWidthRight, rowHeight));
      page.graphics.drawString(pmInfoValuesRight[i], contentFont,
          bounds: Rect.fromLTWH(
              valueXRight, currentY + 5, valueWidthRight, rowHeight));
      currentY += rowHeight;
    }

    // Draw Equipment details
    currentY += 20; // Adding some space before the next section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Equipment details', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw Equipment Details Table
    double columnWidth = pageWidth / 3;
    List<String> equipmentHeaders = [
      'S. No',
      'Equipment category',
      'Equipment name'
    ];

    for (int i = 0; i < equipmentHeaders.length; i++) {
      page.graphics.drawString(equipmentHeaders[i], contentFont,
          bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
              columnWidth, rowHeight));
    }

    currentY += rowHeight;

    // Draw each equipment name from the schedules
    for (int i = 0; i < (pmtaskViewModel.value?.schedules?.length ?? 0); i++) {
      var schedule = pmtaskViewModel.value!.schedules![i];

      page.graphics.drawString('${i + 1}', contentFont,
          bounds: Rect.fromLTWH(
              margin, currentY + 5, columnWidth, rowHeight)); // S. No
      page.graphics.drawString(
          '${pmtaskViewModel.value?.category_name ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + columnWidth, currentY + 5, columnWidth,
              rowHeight)); // Equipment category
      page.graphics.drawString('${schedule.name ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
              columnWidth, rowHeight)); // Equipment name

      currentY += rowHeight;
    }

    // Permit carried by section
    currentY += 10; // Adding some space before the next section

// Draw the permit section with header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Permit carried by', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

// Column Headers
    columnWidth = pageWidth / 4; // Adjust column width as needed
    List<String> permitHeaders = [
      'S. No',
      'Employee ID',
      'Employee name',
      'Company'
    ];

    for (int i = 0; i < permitHeaders.length; i++) {
      page.graphics.drawString(permitHeaders[i], contentFont,
          bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
              columnWidth, rowHeight));
    }

    currentY += sectionHeight;

    if (pmtaskViewModel.value!.permit_id != 0) {
      // Draw Permit Data
      page.graphics.drawString('1', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString(
          '${pmtaskViewModel.value!.employee_ID}', contentFont,
          bounds: Rect.fromLTWH(
              margin + columnWidth, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString(
          '${pmtaskViewModel.value!.employee_name}', contentFont,
          bounds: Rect.fromLTWH(
              margin + 2 * columnWidth, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString('${pmtaskViewModel.value!.company}', contentFont,
          bounds: Rect.fromLTWH(
              margin + 3 * columnWidth, currentY + 5, columnWidth, rowHeight));

      currentY += rowHeight;
    } else {
      // Draw the "No permit carried out" message below the headers
      page.graphics.drawString('No Permit Carried Out', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

// Continue with the next section or other content

    currentY += 10; // Adding some space before the next section

// Draw the PTW Information section header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('PTW Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

// Define static widths for the S. No, PTW ID, and Isolation taken columns
    double serialNoWidth = 40; // Width for S. No
    double ptwIdWidth = 50; // Width for PTW ID
    double isolationTakenWidth = 80; // Width for Isolation taken
    double remainingWidth = pageWidth -
        (ptwIdWidth +
            serialNoWidth +
            isolationTakenWidth); // Calculate remaining width

// Headers for PTW Information section
    List<String> ptwHeaders = [
      'S. No',
      'PTW ID',
      'Isolation taken',
      'Permit type',
      'Isolated equipment\'s'
    ];

// Draw the headers with static widths
    page.graphics.drawString(ptwHeaders[0], contentFont,
        bounds: Rect.fromLTWH(margin, currentY + 5, serialNoWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[1], contentFont,
        bounds: Rect.fromLTWH(
            margin + serialNoWidth, currentY + 5, ptwIdWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidth + ptwIdWidth, currentY + 5,
            isolationTakenWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[3], contentFont,
        bounds: Rect.fromLTWH(
            margin + serialNoWidth + ptwIdWidth + isolationTakenWidth,
            currentY + 5,
            remainingWidth / 2,
            rowHeight));
    page.graphics.drawString(ptwHeaders[4], contentFont,
        bounds: Rect.fromLTWH(
            margin +
                serialNoWidth +
                ptwIdWidth +
                isolationTakenWidth +
                remainingWidth / 2,
            currentY + 5,
            remainingWidth / 2,
            rowHeight));

    currentY += rowHeight;

    if (pmtaskViewModel.value!.permit_id != 0) {
      // Draw the PTW data
      page.graphics.drawString('1', contentFont,
          bounds: Rect.fromLTWH(
              margin, currentY + 5, serialNoWidth, rowHeight)); // S. No
      page.graphics.drawString(
          '${pmtaskViewModel.value?.permit_id ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + serialNoWidth, currentY + 5,
              ptwIdWidth, rowHeight)); // PTW ID
      page.graphics.drawString(
          '${pmtaskViewModel.value?.isolation_taken ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + serialNoWidth + ptwIdWidth,
              currentY + 5, isolationTakenWidth, rowHeight)); // Isolation taken
      page.graphics.drawString(
          '${pmtaskViewModel.value?.permit_type ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin + serialNoWidth + ptwIdWidth + isolationTakenWidth,
              currentY + 5,
              remainingWidth / 2,
              rowHeight)); // Permit type
      page.graphics.drawString(
          '${pmtaskViewModel.value?.isolated_equipment ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  serialNoWidth +
                  ptwIdWidth +
                  isolationTakenWidth +
                  remainingWidth / 2,
              currentY + 5,
              remainingWidth / 2,
              rowHeight)); // Isolated equipment's

      currentY += rowHeight;
    } else {
      // Draw the "No PTW information available" message below the headers
      page.graphics.drawString('No PTW information available', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

// Continue with the next section or other content

    // Adding some space before the next section
    currentY += 25;

// TBT section header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('TBT conducted by', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

// Define static widths for the TBT table columns
    double tbtConductedByWidth = pageWidth / 4; // Width for 'TBT conducted by'
    double tbtDoneTimeWidth = pageWidth / 4; // Width for 'TBT done time'
    double startTimeWidth = pageWidth / 4; // Width for 'Start time'
    double statusWidth = pageWidth / 4; // Width for 'Status'

// Headers for TBT section
    List<String> tbtHeaders = [
      'TBT conducted by',
      'TBT done time',
      'Start time',
      'Status'
    ];

// Draw the headers with static widths
    page.graphics.drawString(tbtHeaders[0], contentFont,
        bounds: Rect.fromLTWH(
            margin, currentY + 5, tbtConductedByWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[1], contentFont,
        bounds: Rect.fromLTWH(margin + tbtConductedByWidth, currentY + 5,
            tbtDoneTimeWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + tbtConductedByWidth + tbtDoneTimeWidth,
            currentY + 5, startTimeWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[3], contentFont,
        bounds: Rect.fromLTWH(
            margin + tbtConductedByWidth + tbtDoneTimeWidth + startTimeWidth,
            currentY + 5,
            statusWidth,
            rowHeight));

    currentY += rowHeight;

    if (pmtaskViewModel.value!.ptw_tbt_done == 1) {
      // Draw the TBT data
      page.graphics.drawString(
          '${pmtaskViewModel.value?.tbT_conducted_by_name ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, tbtConductedByWidth,
              rowHeight)); // TBT conducted by
      page.graphics.drawString(
          '${pmtaskViewModel.value?.tbT_done_time == "0001-01-01T00:00:00" ? '' : pmtaskViewModel.value?.tbT_done_time ?? ''}',
          contentFont,
          bounds: Rect.fromLTWH(margin + tbtConductedByWidth, currentY + 5,
              tbtDoneTimeWidth, rowHeight)); // TBT done time
      page.graphics.drawString(
          '${pmtaskViewModel.value?.start_time == "0001-01-01T00:00:00" ? '' : pmtaskViewModel.value?.start_time ?? ''}',
          contentFont,
          bounds: Rect.fromLTWH(margin + tbtConductedByWidth + tbtDoneTimeWidth,
              currentY + 5, startTimeWidth, rowHeight)); // Start time
      page.graphics.drawString(
          '${pmtaskViewModel.value?.status_short_ptw ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin + tbtConductedByWidth + tbtDoneTimeWidth + startTimeWidth,
              currentY + 5,
              statusWidth,
              rowHeight)); // Status

      currentY += rowHeight;
    } else {
      // Draw the "No TBT information available" message below the headers
      page.graphics.drawString('No TBT information available', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

// Continue with the next section or other content

    // Work description section
    currentY += 25;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Work description', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Add static description after Work description
    page.graphics.drawString(
        '${pmtaskViewModel.value?.workdescription ?? ''}', contentFont,
        bounds: Rect.fromLTWH(
            margin + 5, currentY + 5, pageWidth - 10, rowHeight * 2),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));
    currentY += rowHeight * 2;

    // Material consumption section
    currentY += 10;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Material consumption', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Define static widths
    double eqpIdWidth = 50;
    double idWidth = 40;
    double typeWidth = 80;
    double issuedQtyWidth = 60;
    double usedQtyWidth = 60;

    // Calculate remaining width for the name column
    double nameColumnWidth = pageWidth -
        (eqpIdWidth + idWidth + typeWidth + issuedQtyWidth + usedQtyWidth);

    // Draw the headers
    page.graphics.drawString('Eqp ID', contentFont,
        bounds: Rect.fromLTWH(margin, currentY + 5, eqpIdWidth, rowHeight));
    page.graphics.drawString('ID', contentFont,
        bounds: Rect.fromLTWH(
            margin + eqpIdWidth, currentY + 5, idWidth, rowHeight));
    page.graphics.drawString('name', contentFont,
        bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth, currentY + 5,
            nameColumnWidth, rowHeight));
    page.graphics.drawString('type', contentFont,
        bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth + nameColumnWidth,
            currentY + 5, typeWidth, rowHeight));
    page.graphics.drawString('Issued Qty', contentFont,
        bounds: Rect.fromLTWH(
            margin + eqpIdWidth + idWidth + nameColumnWidth + typeWidth,
            currentY + 5,
            issuedQtyWidth,
            rowHeight));
    page.graphics.drawString('Used Qty', contentFont,
        bounds: Rect.fromLTWH(
            margin +
                eqpIdWidth +
                idWidth +
                nameColumnWidth +
                typeWidth +
                issuedQtyWidth,
            currentY + 5,
            usedQtyWidth,
            rowHeight));

    currentY += rowHeight;

    // Draw the material consumption data
    for (int i = 0;
        i < (pmtaskViewModel.value?.material_consumption?.length ?? 0);
        i++) {
      var materialConsumption = pmtaskViewModel.value!.material_consumption![i];

      page.graphics.drawString(
          '${materialConsumption.equipment_ID ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin, currentY + 5, eqpIdWidth, rowHeight)); // Equipment ID

      page.graphics.drawString(
          '${materialConsumption.material_ID ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth, currentY + 5, idWidth,
              rowHeight)); // Material ID

      page.graphics.drawString(
          '${materialConsumption.material_name ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth, currentY + 5,
              nameColumnWidth, rowHeight)); // Material name

      page.graphics.drawString(
          '${materialConsumption.material_type ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth + nameColumnWidth,
              currentY + 5, typeWidth, rowHeight)); // Material type

      page.graphics.drawString(
          '${materialConsumption.issued_qty ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin + eqpIdWidth + idWidth + nameColumnWidth + typeWidth,
              currentY + 5,
              issuedQtyWidth,
              rowHeight)); // Issued quantity

      page.graphics.drawString(
          '${materialConsumption.used_qty ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  eqpIdWidth +
                  idWidth +
                  nameColumnWidth +
                  typeWidth +
                  issuedQtyWidth,
              currentY + 5,
              usedQtyWidth,
              rowHeight)); // Used quantity

      currentY += rowHeight;
    }

    // Tools carried section
    currentY += 25; // Adding some space before the next section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Tools carried', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Define column widths for Tools carried section
    double serialNoWidthTools = 40;
    double toolNameWidth = pageWidth / 2;
    double toolCountWidth = pageWidth - serialNoWidthTools - toolNameWidth;

    // Draw the column headers for Tools carried section
    List<String> toolsHeaders = ['S. No', 'Tool name', 'No. of tools'];

    page.graphics.drawString(toolsHeaders[0], contentFont,
        bounds:
            Rect.fromLTWH(margin, currentY + 5, serialNoWidthTools, rowHeight));
    page.graphics.drawString(toolsHeaders[1], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidthTools, currentY + 5,
            toolNameWidth, rowHeight));
    page.graphics.drawString(toolsHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidthTools + toolNameWidth,
            currentY + 5, toolCountWidth, rowHeight));

    currentY += rowHeight;

    // Loop through each schedule and its linked jobs to draw the rows for Tools carried section
    int toolIndex = 1; // Initialize tool serial number

    for (var schedule in pmtaskViewModel.value?.schedules ?? []) {
      if (schedule.schedule_link_job != null &&
          schedule.schedule_link_job!.isNotEmpty) {
        for (var job in schedule.schedule_link_job!) {
          if (job.tool_name != null &&
              job.no_of_tools != null &&
              job.no_of_tools! > 0) {
            page.graphics.drawString('$toolIndex', contentFont,
                bounds: Rect.fromLTWH(margin, currentY + 5, serialNoWidthTools,
                    rowHeight)); // S. No

            page.graphics.drawString(job.tool_name ?? '', contentFont,
                bounds: Rect.fromLTWH(margin + serialNoWidthTools, currentY + 5,
                    toolNameWidth, rowHeight)); // Tool name

            page.graphics.drawString('${job.no_of_tools}', contentFont,
                bounds: Rect.fromLTWH(
                    margin + serialNoWidthTools + toolNameWidth,
                    currentY + 5,
                    toolCountWidth,
                    rowHeight)); // No. of tools

            currentY += rowHeight;
            toolIndex++;
          }
        }
      }
    }

    // If no tools are found, you can add a message indicating that
    if (toolIndex == 1) {
      page.graphics.drawString('No tools carried', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));
      currentY += rowHeight;
    }

    // Remarks field
    currentY += 25;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Remarks', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    page.graphics.drawString(
        '${pmtaskViewModel.value?.new_remark ?? ''}', contentFont,
        bounds: Rect.fromLTWH(
            margin + 5, currentY + 5, pageWidth - 10, rowHeight * 2),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));
    currentY += rowHeight * 2;

    // PM History section
    double pageHeight = pageSize.height;

    for (var history in historyList!.value) {
      // Check if we need to add a new page
      if (currentY + rowHeight > pageHeight - margin) {
        // Add a new page and reset the currentY
        page = document.pages.add();
        currentY = margin; // Reset Y position for the new page

        // Re-draw the "PM History" header on the new page
        page.graphics.drawRectangle(
            pen: borderPen,
            brush: backgroundBrush,
            bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
        page.graphics.drawString('PM History', headerFont,
            bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
        currentY += sectionHeight;

        // Draw column headers for "PM History"
        List<String> historyHeaders = [
          'Time Stamp',
          'Posted By',
          'Comments',
          'Status'
        ];

        for (int i = 0; i < historyHeaders.length; i++) {
          page.graphics.drawString(historyHeaders[i], contentFont,
              bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
                  columnWidth, rowHeight));
        }

        currentY += rowHeight; // Move down after drawing headers
      }

      // Render your history items as before
      if (history != null) {
        String timeStamp = history.createdAt?.result != null
            ? history.createdAt!.result
                .toString()
                .substring(0, 16)
                .replaceFirst('T', ' ')
            : 'N/A';
        String postedBy = history.createdByName ?? 'Unknown';
        String comments = history.comment ?? 'No comments';
        String status = history.status_name ?? 'Unknown status';

        page.graphics.drawString(timeStamp, contentFont,
            bounds:
                Rect.fromLTWH(margin, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(postedBy, contentFont,
            bounds: Rect.fromLTWH(
                margin + columnWidth, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(comments, contentFont,
            bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
                columnWidth, rowHeight));
        page.graphics.drawString(status, contentFont,
            bounds: Rect.fromLTWH(margin + 3 * columnWidth, currentY + 5,
                columnWidth, rowHeight));

        currentY += rowHeight;
      }
    }

    final String signatureText = 'Signature';
    final Size signatureSize = contentFont.measureString(signatureText);
    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageWidth - (signatureSize.width + margin),
            currentY + 20, signatureSize.width, signatureSize.height))!;
  }
}
