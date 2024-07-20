import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/update_pm_task_execution_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../widgets/custom_elevated_button.dart';

class ViewAuditTaskController extends GetxController {
  ///
  ViewAuditTaskController(
    this.viewAuditTaskPresenter,
  );
  ViewAuditTaskPresenter viewAuditTaskPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  Rx<int> auditTaskId = 0.obs;
  Rx<int> type = 0.obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;
  RxInt selectedValue = 1.obs;
  Rx<PmtaskViewModel> auditTasknDetailModel = PmtaskViewModel().obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  void onRadioValueChanged(int value) {
    selectedValue.value = value;
  }

  var isToggleokOn = false.obs;

  Rx<List<List<Map<String, String>>>> rowItemAuditobs =
      Rx<List<List<Map<String, String>>>>([]);
  RxString startresponseMessage = ''.obs;
  Uint8List? fileBytes;
  RxString fileName = "".obs;
  int fileId = 0;
  @override
  void onInit() async {
    try {
      await setauditTaskId();
      getHistory();

      if (auditTaskId != 0) {
        print({"fghvjbggjhjgk", auditTaskId});

        await getAuditTaskDetails(
            auditTaskId: auditTaskId.value, isloading: true);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getHistory() async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 27;
    //
    historyList?.value = await viewAuditTaskPresenter.getHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          auditTaskId.value,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> setauditTaskId() async {
    try {
      final _auditTaskId = await viewAuditTaskPresenter.getValue();
      final _type = await viewAuditTaskPresenter.getTypeValue();

      if (_auditTaskId == null ||
          _auditTaskId == '' ||
          _auditTaskId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        auditTaskId.value = dataFromPreviousScreen['auditTaskId'];
        type.value = dataFromPreviousScreen['type'];

        viewAuditTaskPresenter.saveValue(
            auditTaskId: auditTaskId.value.toString());
        viewAuditTaskPresenter.saveTypeValue(type: type.value.toString());
      } else {
        auditTaskId.value = int.tryParse(_auditTaskId) ?? 0;
        type.value = int.tryParse(_type ?? "") ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'auditTaskId');
    }
  }

  Future<void> getAuditTaskDetails({int? auditTaskId, bool? isloading}) async {
    auditTasknDetailModel.value = PmtaskViewModel();
    rowItemAuditobs.value = [];
    final _auditTasknDetailModel =
        await viewAuditTaskPresenter.getAuditTaskDetails(
      auditTaskId: auditTaskId,
      isLoading: isloading,
    );

    if (_auditTasknDetailModel != null) {
      auditTasknDetailModel.value = _auditTasknDetailModel;
    }
    print({"auditPlandetailss", auditTasknDetailModel.value.id});
  }

  void auditTaskApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentauditTaskAproveModel =
          CommentModel(id: id, comment: _comment);

      var auditTaskApproveJsonString = commentauditTaskAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditTaskPresenter.auditTaskApprovedButton(
        auditTaskApproveJsonString: auditTaskApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<bool> browseFiles({
    Uint8List? fileBytes,
  }) async {
    PmFiles? pmfile = await viewAuditTaskPresenter.browseFiles(
        fileBytes, fileName.value, true);
    fileId = pmfile?.file_id ?? 0;

    return true;
  }

  void auditTaskRejectButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentauditTaskRejectModel =
          CommentModel(id: id, comment: _comment);

      var auditTaskRejectJsonString = commentauditTaskRejectModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditTaskPresenter.auditTaskRejectButton(
        auditTaskRejectJsonString: auditTaskRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void auditTaskSkipButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentauditTaskSkipModel =
          CommentModel(id: id, comment: _comment);

      var auditTaskSkipJsonString = commentauditTaskSkipModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditTaskPresenter.auditTaskSkipButton(
        auditTaskSkipJsonString: auditTaskSkipJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void auditTaskCloseButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentauditTaskCloseModel =
          CommentModel(id: id, comment: _comment);

      var auditTaskCloseJsonString = commentauditTaskCloseModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditTaskPresenter.auditTaskCloseButton(
        auditTaskCloseJsonString: auditTaskCloseJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void auditTaskCloseApproveButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentauditTaskCloseModel =
          CommentModel(id: id, comment: _comment);

      var auditTaskCloseApproveJsonString = commentauditTaskCloseModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditTaskPresenter.auditTaskCloseApproveButton(
        auditTaskCloseApproveJsonString: auditTaskCloseApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void auditTaskCloseRejectButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentauditTaskCloseModel =
          CommentModel(id: id, comment: _comment);

      var auditTaskCloseRejectJsonString = commentauditTaskCloseModel.toJson();

      Map<String, dynamic>? response =
          await viewAuditTaskPresenter.auditTaskCloseRejectButton(
        auditTaskCloseRejectJsonString: auditTaskCloseRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  createNewPermit() {
    clearStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearjobmodelValue();
    clearpmTaskValue();
    Get.toNamed(Routes.createPermit, arguments: {
      "pmTaskModel": auditTasknDetailModel.value,
      "jobModel": jobDetailsModel.value,
      "permitId": 0,
      "isChecked": false,
      "type": 3,
      "isFromPmTaskDetails": true,
      "mcModel": mcExecutionDetailsModel.value,
      "scheduleID": 0
    });
  }

  void clearStoreData() {
    viewAuditTaskPresenter.clearStoreData();
  }

  void clearTypeStoreData() {
    viewAuditTaskPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    viewAuditTaskPresenter.clearisCheckedValue();
  }

  void clearjobmodelValue() {
    viewAuditTaskPresenter.clearjobmodelValue();
  }

  void clearpmTaskValue() {
    viewAuditTaskPresenter.clearpmTaskValue();
  }

  void startAuditTask() async {
    Map<String, dynamic>? responseMapStart =
        await viewAuditTaskPresenter.startAuditTask(
      auditTaskId: auditTaskId.value,
      isLoading: true,
    );
    // if (responseMapStart != null && responseMapStart.length > 0) {
    //   // getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
    //   startresponseMessage.value = responseMapStart["message"];
    //   // print({"jkfdkjfd", startresponseMessage});
    //   // isPermitLinked.value = true;
    // //  _updatedailog();
    // }
  }

  void _updatedailog() {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Text(
            'Audit Task Started',
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
                            // await setScheduleId();

                            // if (scheduleId != 0) {
                            //   await getPmtaskViewList(
                            //       scheduleId: scheduleId.value,
                            //       isloading: true,
                            //       facilityId: facilityId);
                            //   getHistory(facilityId);
                            //   getMrsListByModuleTask(taskId: scheduleId.value);
                            //   getAssignedToList(facilityId);
                            // }
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
                        text: "Audit Task List",
                        onPressed: () {
                          Get.back();

                          Get.offAndToNamed(Routes.auditTask);
                        },
                        backgroundColor: ColorValues.appDarkBlueColor,
                        textColor: ColorValues.whiteColor,
                      ),
                    ),
                    Dimens.boxWidth10,
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        text: "Execute",
                        onPressed: () {
                          Get.back();

                          // gotoexecution();
                        },
                        backgroundColor: ColorValues.appYellowColor,
                        textColor: ColorValues.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
      actions: [],
    ));
  }

  void updateAuditTaskExecution() async {
    Get.back();
    PmFiles fil = PmFiles(file_id: 0, pm_event: 0);
    List<PmFiles> pmfile = <PmFiles>[fil];

    List<AddObservations> addObservations = <AddObservations>[];
    rowItemAuditobs.value.forEach((element) {
      AddObservations item = AddObservations(
          execution_id: int.tryParse(element[0]["id"] ?? '0'),
          observation: element[3]["value"] ?? "",
          job_create: 0, // int.tryParse(element[7]["job_value"] ?? '0'),
          text: element[5]["value"] ?? '',
          cp_ok: int.tryParse(element[2]["value"] ?? '0'),
          pm_files: []);
      addObservations.add(item);
    });
    // });
    List<SchedulesTask> schedule = <SchedulesTask>[];
    // checklistObservations?.forEach((e) {
    schedule.add(SchedulesTask(
        schedule_id: auditTasknDetailModel.value.schedules![0].schedule_id ?? 0,
        add_observations: addObservations));
    // });

    UpdatePmExecutionMdel updatePmExecutionMdel = UpdatePmExecutionMdel(
        task_id: auditTaskId.value,
        comment: "", // commentCtrlr.text,
        schedules: schedule);
    var auditExecutionJsonString = updatePmExecutionMdel.toJson();
    print({"pmExecutionJsonString", auditExecutionJsonString});
    var responsePmScheduleCreated =
        await viewAuditTaskPresenter.updateAuditTaskExecution(
      auditExecutionJsonString: auditExecutionJsonString,
      isLoading: true,
    );
    // _updatedailog();
    // Get.back();
  }

  void clearPermitStoreData() {
    viewAuditTaskPresenter.clearPermitStoreData();
  }

  Future<void> viewNewPermitList({
    int? permitId,
    int? jobId,
  }) async {
    Get.toNamed(Routes.viewPermitScreen,
        arguments: {"permitId": permitId, "jobId": jobId, "type": 3});
    print({"Permit", permitId, jobId});
  }
}
