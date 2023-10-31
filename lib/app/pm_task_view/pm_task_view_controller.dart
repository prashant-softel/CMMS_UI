import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_presenter.dart';
import 'package:cmms/app/pm_task_view/view/permit_list_table.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

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

  var dueToDateTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedDueTime = DateTime.now().obs;
  TextEditingController commentCtrlr = TextEditingController();

  ///Assigned To
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<MRSListByJobIdModel?>? listMrsByTaskId = <MRSListByJobIdModel?>[].obs;

  //////////////////////////////////

  @override
  void onInit() async {
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
        getAssignedToList(facilityId);
      }
    });
    try {
      await setScheduleId();

      if (scheduleId != 0) {
        await getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
        getHistory();
        getMrsListByModuleTask(taskId: scheduleId.value);
      }
      // textControllers =
      //     List.generate(permitValuesCount, (_) => TextEditingController());
      // permitValues = RxList<String>.filled(permitValuesCount, '');

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setScheduleId() async {
    try {
      // final _flutterSecureStorage = const FlutterSecureStorage();
      // // Read jobId
      final _scheduleId =
          await preventiveMaintenanceTaskViewPresenter.getValue();

      //  String? _scheduleId = await _flutterSecureStorage.read(key: "pmTaskId");
      if (_scheduleId == null || _scheduleId == '' || _scheduleId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        scheduleId.value = dataFromPreviousScreen['pmTaskId'];
        preventiveMaintenanceTaskViewPresenter.saveValue(
            pmTaskId: scheduleId.value.toString());

        // await _flutterSecureStorage.write(
        //   key: "pmTaskId",
        //   value: scheduleId.value == null ? '' : scheduleId.value.toString(),
        // );
      } else {
        scheduleId.value = int.tryParse(_scheduleId) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "scheduleId");
    } catch (e) {
      Utility.showDialog(e.toString() + 'scheduleId');
    }
  }

  Future<void> getMrsListByModuleTask({required int taskId}) async {
    listMrsByTaskId?.value =
        await preventiveMaintenanceTaskViewPresenter.getMrsListByModuleTask(
              taskId,
              false,
            ) ??
            [];
    update(["taskLinkdToPermitList"]);
  }

  Future<void> getHistory() async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 27;
    //
    historyList?.value =
        await preventiveMaintenanceTaskViewPresenter.getHistory(
              // tempModuleType,
              // tempJobCardId,
              moduleType,
              scheduleId.value,
              true,
            ) ??
            [];
    update(["historyList"]);
  }

  Future<void> getAssignedToList(_facilityId) async {
    final _assignedToList = await preventiveMaintenanceTaskViewPresenter
        .getAssignedToList(facilityId: _facilityId);

    if (_assignedToList != null) {
      for (var _assignedTo in _assignedToList) {
        assignedToList.add(_assignedTo);
      }
      update(["assignedToList"]);
    }
  }

  Future<void> getPmtaskViewList({int? scheduleId, bool? isloading}) async {
//scheduleId = 5326;
    final _permitDetails = await preventiveMaintenanceTaskViewPresenter
        .getPmtaskViewList(scheduleId: scheduleId, isloading: isloading);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;
      scheduleCheckPoint!.value = _permitDetails.schedules ?? [];
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

  void linkToPermit() async {
    Map<String, dynamic>? responseMapPermitLinked =
        await preventiveMaintenanceTaskViewPresenter.scheduleLinkToPermit(
      permitId: selectedPermitId.value,
      scheduleId: scheduleId.value,
      isLoading: false,
    );
    if (responseMapPermitLinked != null && responseMapPermitLinked.length > 0) {
      // var _jobId = responseMapPermitLinked["id"][0];

      // isPermitLinked.value = true;
      Get.back();
      getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
    }
  }

  void setPmTask() async {
    Map<String, dynamic>? responseMapStart =
        await preventiveMaintenanceTaskViewPresenter.setPmTask(
      scheduleId: scheduleId.value,
      isLoading: false,
    );
    if (responseMapStart != null && responseMapStart.length > 0) {
      // getPmtaskViewList(scheduleId: scheduleId.value, isloading: true);
      startresponseMessage.value = responseMapStart["message"];
      // print({"jkfdkjfd", startresponseMessage});
      // isPermitLinked.value = true;
      _updatedailog();
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
                                  isloading: true);
                              getHistory();
                              getMrsListByModuleTask(taskId: scheduleId.value);
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

                          Get.offAllNamed(Routes.pmTask);
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

                          gotoexecution();
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

  void onDropdownValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<EmployeeModel>:
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

  Future<void> gotoexecution() async {
    Get.toNamed(Routes.pmExecution, arguments: {'pmTaskId': scheduleId.value});
  }

  createNewPermit() {
    Get.toNamed(Routes.newPermit, arguments: {
      "pmTaskModel": pmtaskViewModel.value,
      "isFromPmTaskDetails": true,
    });
  }

  approvePmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: scheduleId.value, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response =
          await preventiveMaintenanceTaskViewPresenter.approvePmTaskExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "pmTaskId");
        Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  closePmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: scheduleId.value, comment: _comment);

      var closetoJsonString = commentModel.toJson();
      final response =
          await preventiveMaintenanceTaskViewPresenter.closePmTaskExecution(
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

  rejectPmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: scheduleId.value, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response =
          await preventiveMaintenanceTaskViewPresenter.rejectPmTaskExecution(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "pmTaskId");
        Get.offAllNamed(Routes.pmTask);
      }
    }
  }
}
