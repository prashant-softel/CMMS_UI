import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/transferItems_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);

  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  RxList<ScheduleCheckPoint?>? scheduleCheckPoints =
      <ScheduleCheckPoint?>[].obs;
  RxList<ChecklistObservation>? checklistObservations =
      <ChecklistObservation>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<MRSListByJobIdModel?>? listMrsByTaskId = <MRSListByJobIdModel?>[].obs;
  RxList<CmmrsItems?>? cmmrsItems = <CmmrsItems?>[].obs;

  var commentCtrlr = TextEditingController();
  var updatecommentCtrlr = TextEditingController();
  Map<String, CmmrsItems> dropdownMapperData = {};

  ScheduleCheckPoint? selectedItem;
  Rx<String> selectedasset = ''.obs;
  Rx<bool> isAssetsSelected = true.obs;
  int selectedAssetsId = 0;
  // Map<String, ScheduleCheckPoint> dropdownMapperData = {};
  String selectname = "";
  @override
  void onInit() async {
    try {
      await setScheduleId();
      if (scheduleId != 0) {
        await getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);

        getHistory();
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  void addRowItem() {
    rowItem.value.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Material_Type", "value": ''},
      {'key': "Issued_Qty", "value": ''},
      {'key': "Consumed_Qty", "value": ''},
    ]);
  }

  Future<void> getMrsListByModuleTask({required int taskId}) async {
    listMrsByTaskId?.value =
        await preventiveMaintenanceExecutionPresenter.getMrsListByModuleTask(
              taskId,
              false,
            ) ??
            [];
    if (listMrsByTaskId!.value != null) {
      var _assetsList = listMrsByTaskId!.value[0]!.cmmrsItems;
      for (var asset in _assetsList!) {
        cmmrsItems!.add(asset);
      }
      print({"mrsit", listMrsByTaskId});
      addRowItem();
    }
  }

  Future<void> setScheduleId() async {
    try {
      final _scheduleId =
          await preventiveMaintenanceExecutionPresenter.getValue();

      //  String? _scheduleId = await _flutterSecureStorage.read(key: "pmTaskId");
      if (_scheduleId == null || _scheduleId == '' || _scheduleId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        scheduleId.value = dataFromPreviousScreen['pmTaskId'];
        preventiveMaintenanceExecutionPresenter.saveValue(
            pmTaskId: scheduleId.value.toString());

        // await _flutterSecureStorage.write(
        //   key: "pmTaskId",
        //   value: scheduleId.value == null ? '' : scheduleId.value.toString(),
        // );
      } else {
        scheduleId.value = int.tryParse(_scheduleId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString() + 'pmTaskId');
    }
  }

  Future<void> getHistory() async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 27;
    //

    historyList?.value =
        await preventiveMaintenanceExecutionPresenter.getHistory(
              // tempModuleType,
              // tempJobCardId,
              moduleType,
              scheduleId.value,
              true,
            ) ??
            [];
    update(["historyList"]);
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
      getMrsListByModuleTask(taskId: scheduleId ?? 0);
    }
    selectedasset.value = scheduleCheckPoints![0]?.name ?? "";
    update(["getPmtaskViewList"]);

    // print({"checklistObservations", checklistObservations});
  }

  Future<void> transferItem() async {
    List<TranferItems> items = [];
    rowItem.value.forEach((element) {
      TranferItems item = TranferItems(
          assetItemID:
              dropdownMapperData[element[0]["value"]]?.asset_item_ID ?? 0,
          facilityID: pmtaskViewModel.value?.facility_id ?? 0,
          fromActorID: scheduleId.value,
          fromActorType: AppConstants.kTask,
          mrsID: listMrsByTaskId![0]!.mrsId ?? 0,
          qty: int.tryParse(element[3]["value"] ?? '0') ?? 0,
          refID: scheduleId.value,
          refType: AppConstants.kTask,
          remarks: "remarks",
          toActorID:
              dropdownMapperData[element[0]["value"]]?.asset_type_ID ?? 0,
          toActorType: AppConstants.kInventory);

      items.add(item);
    });
    var transferItemJsonString = items;
    print({"transferItemJsonString", transferItemJsonString});

    var responsetransferItem =
        await preventiveMaintenanceExecutionPresenter.transferItem(
      transferItemJsonString: transferItemJsonString,
      isLoading: true,
    );
    if (responsetransferItem == null) {}
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
          job_create: e.linked_job_id.value,
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
    // _updatedailog();
    Fluttertoast.showToast(msg: "PM Schedule Successfully...", fontSize: 16.0);
  }

  void cloneDialog(String assets) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Text(
            'CheckList Observation Clone',
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

        return Obx(
          () => Container(
            // margin: Dimens.edgeInsets15,
            // padding: Dimens.edgeInsets25,
            height: height / 7,
            width: double.infinity,

            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Are You Want to clone the',
                      style: Styles.blue700,
                      children: <TextSpan>[
                        TextSpan(
                            text: '\n${selectedItem?.name ?? ""}',
                            style: Styles.green700),
                        TextSpan(text: '  with', style: Styles.blue700),
                        TextSpan(
                          text: '\n ${selectedasset.value}',
                          style: Styles.redBold15,
                        ),
                        TextSpan(text: '  ?', style: Styles.blue700),
                      ]),
                ),
                Dimens.boxHeight12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        text: "Cancel",
                        onPressed: () {
                          Get.back();
                        },
                        backgroundColor: ColorValues.cancelColor,
                        textColor: ColorValues.whiteColor,
                      ),
                    ),
                    // Spacer(),
                    Dimens.boxWidth20,
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        text: "Clone",
                        onPressed: () {
                          cloneSchedule(
                              from_schedule_id: selectedItem?.schedule_id ?? 0,
                              to_schedule_id: selectedAssetsId);
                        },
                        backgroundColor: ColorValues.appDarkBlueColor,
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

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case RxList<ScheduleCheckPoint?>:
        {
          int assetsIndex =
              scheduleCheckPoints!.indexWhere((x) => x?.name == value);
          selectedAssetsId =
              scheduleCheckPoints![assetsIndex]?.schedule_id ?? 0;
          if (selectedAssetsId > 0) {
            isAssetsSelected.value = true;
          }
          selectedasset.value = scheduleCheckPoints![assetsIndex]?.name ?? "";
        }
        break;
    }
  }

  void cloneSchedule(
      {required int from_schedule_id, required int to_schedule_id}) async {
    final response =
        await preventiveMaintenanceExecutionPresenter.cloneSchedule(
            from_schedule_id: from_schedule_id,
            to_schedule_id: to_schedule_id,
            taskId: scheduleId.value,
            isloading: true);
    if (response == true) {
      final _flutterSecureStorage = const FlutterSecureStorage();

      _flutterSecureStorage.delete(key: "pmTaskId");
      Get.offAllNamed(Routes.pmTask);
    }
  }
}
