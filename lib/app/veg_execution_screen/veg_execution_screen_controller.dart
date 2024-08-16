// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_presenter.dart';
import 'package:cmms/domain/models/close_permit_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/update_vegetation_execution_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class VegExecutionController extends GetxController {
  VegExecutionController(
    this.vegExecutionPresenter,
  );
  VegExecutionPresenter vegExecutionPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  RxInt facilityId = 0.obs;
  RxInt vegexe = 0.obs;
  RxInt vegid = 0.obs;
  TextEditingController commentCtrlr = TextEditingController();
  Rx<VegExecutionDetailsModel?> vegExecutionDetailsModel =
      VegExecutionDetailsModel().obs;
  RxList<VegTaskEquipmentList?> vegTaskEquipment = <VegTaskEquipmentList>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, VegSchedules> dropdownMapperData = {};
  RxList<VegSchedules?>? schedules = <VegSchedules?>[].obs;
  RxList<VegSchedules?>? listSchedules = <VegSchedules?>[].obs;
  RxList<int> scheduleId = <int>[].obs;
  RxInt scheduledId = 0.obs;
  Map<String, dynamic> data = {};
  final TextEditingController commentTextFieldCtrlr = TextEditingController();
  final TextEditingController scheduleExecutionTextFieldCtrlr =
      TextEditingController();
  TextEditingController remarkTextFieldCtrlr = TextEditingController();
  TextEditingController remarkCtrlrWeb = TextEditingController();
  Map<String, String> check = <String, String>{};
  int count = 0;
  Rx<bool> allScheduleTrue = false.obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;

  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;

  @override
  void onInit() async {
    try {
      await setVegId();
      facilityIdStreamSubscription =
          homecontroller.facilityId$.listen((event) async {
        facilityId.value = event;
        await getVegExecutionDetail(
          executionId: vegexe.value,
          facilityId: facilityId.value,
        );
        await getVegTaskEquipmentList(
          executionId: vegexe.value,
          facilityId: facilityId.value,
        );
        await getAssignedToList();
      });
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  Future<void> setVegId() async {
    try {
      final _vegexe = await vegExecutionPresenter.getExecutionId();
      final _vegid = await vegExecutionPresenter.getPlanId();
      if (_vegexe == null || _vegexe == '' || _vegexe == "null") {
        var dataFromPreviousScreen = Get.arguments;
        vegid.value = dataFromPreviousScreen['vegid'];
        vegexe.value = dataFromPreviousScreen['vegexe'];
        vegExecutionPresenter.savePlanId(vegid: vegid.value.toString());
        vegExecutionPresenter.saveExecutionId(vegexe: vegexe.value.toString());
        print("Execution Id: ${vegexe.value}");
        print("Plan Id: ${vegid.value}");
      } else {
        vegexe.value = int.tryParse(_vegexe) ?? 0;
        vegid.value = int.tryParse(_vegid.toString()) ?? 0;
        print("Execution Id: ${vegexe.value}");
        print("Plan Id: ${vegid.value}");
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'vegid');
    }
  }

  Future<void> getVegExecutionDetail({
    required int executionId,
    required int facilityId,
  }) async {
    final _vegExecutionDetails =
        await vegExecutionPresenter.getVegExecutionDetail(
      executionId: executionId,
      facilityId: facilityId,
    );
    rowItem.value = [];
    if (_vegExecutionDetails != null) {
      vegExecutionDetailsModel.value = _vegExecutionDetails;
      listSchedules?.value = vegExecutionDetailsModel.value?.schedules ?? [];
      scheduleId.value =
          listSchedules!.map((element) => element?.scheduleId ?? 0).toList();
      // vegid.value = vegExecutionDetailsModel.value?.id ?? 0;
      bool allStatus383 =
          listSchedules!.every((element) => element?.status == 731);

      allScheduleTrue.value = allStatus383;
      vegExecutionDetailsModel.value?.schedules?.forEach((element) {
        rowItem.value.add([
          {"key": "Schedule Id", "value": '${element.scheduleId}'},
          {"key": "Days", "value": '${element.cleaningDay}'},
          {"key": "Scheduled Module", "value": '${element.scheduled}'},
          {"key": "Cleaned", "value": '${element.cleaned}'},
          {"key": "Abandoned", "value": '${element.abandoned}'},
          {"key": "Pending", "value": '${element.pending}'},
          {"key": "Remark", "value": '${element.remark_of_schedule}'},
          {"key": "Permit_code", "value": '${element.permit_code}'},
          {"key": "Permit_status", "value": '${element.status_short_ptw}'},
          {"key": "Status", "value": '${element.status_short}'},
          {'key': "Actions", "value": ''},
        ]);
      });
    }
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList = await vegExecutionPresenter.getAssignedToList(
      facilityId: facilityId.value,
      featureId: UserAccessConstants.kVegetationControlFeatureId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
    }
  }

  Future<void> getVegTaskEquipmentList({
    required int executionId,
    required int facilityId,
  }) async {
    final _vegTaskEquipmentList =
        await vegExecutionPresenter.getVegTaskEquipmentList(
      executionId: executionId,
      facilityId: facilityId,
    );
    if (_vegTaskEquipmentList.isNotEmpty) {
      vegTaskEquipment.value = _vegTaskEquipmentList;
      check.clear();

      for (var equipment in vegTaskEquipment) {
        for (var smb in equipment?.smbs ?? []) {
          if (smb.isAbandonSmbCheck) {
            check["${smb.smbName}"] = "abandon";
            count++;
          } else if (smb.isCleanedSmbCheck) {
            check["${smb.smbName}"] = "cleaned";
            count++;
          } else {
            print("${smb.smbName} execution remaining");
          }
        }
        if (count == 0) {
          check["${equipment?.invName}"] = "remaining";
        }
        count = 0;
      }
    }
  }

  Future<void> startVegExecutionButton() async {
    final _startVegExecutionBtn =
        await vegExecutionPresenter.startVegExecutionButton(
      executionId: vegexe.value,
    );
  }

  Future<void> endVegExecutionButton() async {
    final _endVegExecutionBtn =
        await vegExecutionPresenter.endVegExecutionButton(
      executionId: vegexe.value,
    );
  }

  void abandonVegExecutionButton({int? id}) async {
    {
      if (commentTextFieldCtrlr.text == '') {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = commentTextFieldCtrlr.text.trim();
      CommentModel commentAbandonModel = CommentModel(
        id: id,
        comment: _comment,
      );
      var abandoneJsonString = commentAbandonModel.toJson();
      Map<String, dynamic>? response =
          await vegExecutionPresenter.abandonVegExecutionButton(
        abandoneJsonString: abandoneJsonString,
        isLoading: true,
      );
    }
  }

  Future<void> startVegExecutionScheduleButton({int? scheduleID}) async {
    final _startVegScheduleExecutionBtn =
        await vegExecutionPresenter.startVegExecutionScheduleButton(
      scheduleId: scheduleID,
    );
  }

  Future<void> endVegScheduleExecutionButton(
      {int? scheduleID, int? ptw_id}) async {
    var _comment = remarkTextFieldCtrlr.text.trim();
    ClosePermitModel ptwClose = ClosePermitModel(
        id: ptw_id, comment: _comment, conditionIds: [1, 2, 3, 4], fileIds: []);
    var closePtwJsonString = ptwClose.toJson();

    final _endVegScheduleExecutionBtn =
        await vegExecutionPresenter.endVegScheduleExecutionButton(
      scheduleId: scheduleID,
      closePtwJsonString: closePtwJsonString,
    );
  }

  void abandonVegScheduleButton({int? id}) async {
    String _comment = scheduleExecutionTextFieldCtrlr.text.trim();
    CommentModel commentAbandonScheduleModel = CommentModel(
      id: id,
      comment: _comment,
    );
    var abandoneScheduleJsonString = commentAbandonScheduleModel.toJson();
    Map<String, dynamic>? response =
        await vegExecutionPresenter.abandonVegScheduleButton(
      abandoneScheduleJsonString: abandoneScheduleJsonString,
      isLoading: true,
    );
    if (response == true) {}
  }

  void clearStoreData() {
    vegExecutionPresenter.clearExecutionId();
    vegExecutionPresenter.clearPlanId();
    clearPermitStoreData();
  }

  void updateVegScheduleExecution({
    int? scheduleId,
    int? cleaningDay,
    String? remark,
  }) async {
    {
      rowItem.value.forEach((element) {});
      print('data${rowItem.value}');
      List<int> cleanedEquipmentIds = [];
      List<int> abandonedEquipmentIds = [];
      vegTaskEquipment.forEach((e) {
        e?.smbs?.forEach((element) {
          if (element.isAbandonSmbCheck!) {
            abandonedEquipmentIds.add(element.smbId ?? 0);
          }
          if (element.isCleanedSmbCheck!) {
            cleanedEquipmentIds.add(element.smbId!);
          }
        });
      });
      print('cleaned:$cleanedEquipmentIds');

      UpdateVegExecution updateVegScheduleExecutionModel = UpdateVegExecution(
        scheduleId: scheduleId ?? 0,
        executionId: vegexe.value,
        cleaningDay: cleaningDay ?? 0,
        remark: remark == null ? "" : remark,
        cleanedEquipmentIds: cleanedEquipmentIds,
        abandonedEquipmentIds: abandonedEquipmentIds,
      );
      var updateVegJson = updateVegScheduleExecutionModel.toJson();
      Map<String, dynamic>? responseVegScheduleExecution =
          await vegExecutionPresenter.updateVegScheduleExecution(
        updateVegJson: updateVegJson,
        isLoading: true,
      );
      print('Update MC Schedule Execution data: $updateVegJson');
    }
  }

  approveShecduleExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.vegapproveShecduleExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  rejectShecduleExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.vegrejectShecduleExecution(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  endApproveExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.endApproveExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  endRejectExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.endRejectExecution(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  abandonedApproveExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.abandonedApproveExecution(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  abandoneRejectExecution(int id) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: id, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await vegExecutionPresenter.abandoneRejectExecution(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.vegExecutionListScreen);
      }
    }
  }

  assignToVeg({required int id}) async {
    {
      final response = await vegExecutionPresenter.assignToVeg(
        assignId: selectedAssignedToId,
        taskId: id,
        isLoading: true,
      );
    }
  }

  void clearPermitStoreData() {
    vegExecutionPresenter.clearPermitStoreData();
  }

  createNewPermit({int? scheduleID}) {
    clearStoreData();
    clearJobDetailStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearpmTaskValue();
    clearPermitStoreData();
    clearmcDetailsStoreData();
    Get.offNamed(
      Routes.createPermit,
      arguments: {
        "jobModel": jobDetailsModel.value,
        "permitId": 0,
        "isChecked": false,
        "type": 5,
        "isFromJobDetails": true,
        "pmTaskModel": pmtaskViewModel.value,
        "mcModel": mcExecutionDetailsModel.value,
        "vegModel": vegExecutionDetailsModel.value,
        "scheduleID": scheduleID
      },
    );
  }

  Future<void> editNewPermit({int? permitId, bool? isChecked}) async {
    clearStoreData();
    clearJobDetailStoreData();
    clearTypeStoreData();
    clearisCheckedtoreData();
    clearpmTaskValue();
    clearPermitStoreData();
    clearmcDetailsStoreData();
    Get.toNamed(Routes.createPermit, arguments: {
      "jobModel": jobDetailsModel.value,
      "permitId": permitId,
      "isChecked": isChecked,
      "type": 5,
      "isFromJobDetails": true,
      "pmTaskModel": pmtaskViewModel.value,
      "mcModel": mcExecutionDetailsModel.value,
      "vegModel": vegExecutionDetailsModel.value,
      "scheduleID": 0
    });
    print('PermitIDForTBt:$permitId');
    print('PermitIdArgument:$isChecked');
  }

  void clearmcDetailsStoreData() {
    vegExecutionPresenter.clearmcDetailsStoreData();
  }

  void clearJobDetailStoreData() {
    vegExecutionPresenter.clearJobDetailStoreData();
  }

  void clearTypeStoreData() {
    vegExecutionPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    vegExecutionPresenter.clearisCheckedValue();
  }

  void clearpmTaskValue() {
    vegExecutionPresenter.clearpmTaskValue();
  }

  Future<void> viewNewPermitList({
    int? permitId,
    int? jobId,
  }) async {
    Get.toNamed(Routes.viewPermitScreen, arguments: {
      "permitId": permitId,
      "jobId": jobId,
      "type": 5,
    });
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
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
        {}
        break;
    }
  }
}
