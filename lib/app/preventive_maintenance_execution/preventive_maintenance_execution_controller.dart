import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/pm_task_view_list_model.dart';
import '../../domain/models/update_pm_task_execution_model.dart';
import 'preventive_maintenance_execution_presenter.dart';

class PreventiveMaintenanceExecutionController extends GetxController {
  ///
  PreventiveMaintenanceExecutionController(
    this.preventiveMaintenanceExecutionPresenter,
  );
  PreventiveMaintenanceExecutionPresenter
      preventiveMaintenanceExecutionPresenter;
  Rx<int> scheduleId = 0.obs;
  RxBool isTouchable = true.obs;
  var isToggleOn = false.obs;

  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  RxList<ScheduleCheckPoint?>? scheduleCheckPoints =
      <ScheduleCheckPoint?>[].obs;
  RxList<ChecklistObservation>? checklistObservations =
      <ChecklistObservation>[].obs;
  // ScheduleCheckPoint? scheduleCheckPointsModel;
  // PaginationController schedulePaginationController = PaginationController(
  //   rowCount: 0,
  //   rowsPerPage: 10,
  // );
  // RxList<String> scheduleCheckPointsTableColumns = <String>[].obs;
  // RxList<HistoryLog?>? historyLog = <HistoryLog?>[].obs;
  // HistoryLog? historyLogModel;
  var commentCtrlr = TextEditingController();
  var updatecommentCtrlr = TextEditingController();

  ScheduleCheckPoint? selectedItem;

  @override
  void onInit() async {
    try {
      await setScheduleId();
      if (scheduleId != 0) {
        await getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setScheduleId() async {
    try {
      final _flutterSecureStorage = const FlutterSecureStorage();
      // Read jobId
      String? _scheduleId = await _flutterSecureStorage.read(key: "pmTaskId");
      if (_scheduleId == null || _scheduleId == '' || _scheduleId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        scheduleId.value = dataFromPreviousScreen['pmTaskId'];
        await _flutterSecureStorage.write(
          key: "pmTaskId",
          value: scheduleId.value == null ? '' : scheduleId.value.toString(),
        );
      } else {
        scheduleId.value = int.tryParse(_scheduleId) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "scheduleId");
    } catch (e) {
      Utility.showDialog(e.toString() + 'pmTaskId');
    }
  }

  void toggleTouch() {
    isTouchable.value = !isTouchable.value;
    print(isTouchable.value);
  }

  Future<void> getPmtaskViewList({int? scheduleId, bool? isloading}) async {
    final _permitDetails = await preventiveMaintenanceExecutionPresenter
        .getPmtaskViewList(scheduleId: scheduleId, isloading: isloading);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;
      scheduleCheckPoints!.value = _permitDetails.schedules ?? [];
      //   for (var checkpoint in scheduleCheckPoints!) {
      //     for (var checkpoint2 in checkpoint!.checklist_observation ?? []) {
      //       checklistObservations!.value.add(checkpoint2);
      //     }
      //   }
    }
    // print({"checklistObservations", checklistObservations});
  }

  void updatePmExecution() async {
    List<AddObservations> addObservations = <AddObservations>[];
    for (var checkpoint in selectedItem!.checklist_observation ?? []) {
      checklistObservations?.value.add(checkpoint);
    }
    checklistObservations?.forEach((e) {
      addObservations.add(AddObservations(
          execution_id: e.execution_id ?? 0,
          observation: e.observation_value_controller?.text ?? "",
          job_create: e.linked_job_id,
          pm_files: []));
    });
    List<Schedules> schedule = <Schedules>[];
    // checklistObservations?.forEach((e) {
    schedule.add(Schedules(
        schedule_id: selectedItem?.schedule_id ?? 0,
        add_observations: addObservations));
    // });

    UpdatePmExecutionMdel updatePmExecutionMdel = UpdatePmExecutionMdel(
        task_id: scheduleId.value,
        comment: commentCtrlr.text,
        schedules: schedule);
    var pmExecutionJsonString = updatePmExecutionMdel.toJson();
    print({"pmExecutionJsonString", pmExecutionJsonString});
    var responsePmScheduleCreated =
        await preventiveMaintenanceExecutionPresenter.updatePmExecution(
      pmExecutionJsonString: pmExecutionJsonString,
      isLoading: true,
    );
    if (responsePmScheduleCreated != null) {
      // _updatedailog();
      Fluttertoast.showToast(
          msg: "PM Schedule Successfully...", fontSize: 16.0);
    }
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
            'PM Execution Submitted',
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
          // margin: Dimens.edgeInsets15,
          // padding: Dimens.edgeInsets25,
          height: height / 7,
          width: double.infinity,

          child: Column(
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
                height: 40,
                child: CustomElevatedButton(
                  text: "PM Task",
                  onPressed: () {
                    Get.toNamed(
                      Routes.pmTask,
                    );
                  },
                  backgroundColor: ColorValues.appDarkBlueColor,
                  textColor: ColorValues.whiteColor,
                ),
              ),
            ],
          ),
        );
      }),
      actions: [],
    ));
  }

  closePmExecution() async {
    // String _comment = commentCtrlr.text.trim();

    // CommentModel commentCalibrationModel =
    //     CommentModel(id: int.tryParse(scheduleId.value), comment: _comment);

    // var approveCalibrationtoJsonString = commentCalibrationModel.toJson();
    // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
    // final response = await calibrationListPresenter.approveCloseCalibration(
    //   approveCalibrationtoJsonString: approveCalibrationtoJsonString,
    //   isLoading: true,
    // );
    // if (response == true) {
    //   getCalibrationList(facilityId, true);
    // }
  }
  closePmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: scheduleId.value, comment: _comment);

      var closetoJsonString = commentModel.toJson();
      final response =
          await preventiveMaintenanceExecutionPresenter.closePmTaskExecution(
        closetoJsonString: closetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "pmTaskId");
        Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  void UpdatePMTaskExecution() async {
    String _comment = updatecommentCtrlr.text.trim();

    var updatePMTaskExecutionJsonString = {
      "task_id": scheduleId.value,
      "comment": _comment,
    }; //commentModel.toJson();
    final response =
        await preventiveMaintenanceExecutionPresenter.UpdatePMTaskExecution(
      updatePMTaskExecutionJsonString: updatePMTaskExecutionJsonString,
      isLoading: true,
    );
    if (response == true) {
      final _flutterSecureStorage = const FlutterSecureStorage();

      _flutterSecureStorage.delete(key: "pmTaskId");
      Get.offAllNamed(Routes.pmTask);
    }
  }
}
