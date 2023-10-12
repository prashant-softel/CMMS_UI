import 'dart:async';

import 'package:cmms/app/view_mc_plan/view_mc_planning_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';

import 'package:cmms/domain/models/mc_details_plan_model.dart';

import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ViewMcPlaningController extends GetxController {
  ///
  ViewMcPlaningController(
    this.viewMcPlaningPresenter,
  );
  ViewMcPlaningPresenter viewMcPlaningPresenter;
  final HomeController homecontroller = Get.find();

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, dynamic> data = {};
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();

  RxList<McPalningDetailsModel?>? mcPlanDetailsList =
      <McPalningDetailsModel?>[].obs;
  Rx<McPalningDetailsModel?> mcPlanDetailsModel = McPalningDetailsModel().obs;
  RxList<Schedules?>? listSchedules = <Schedules?>[].obs;
  List<int?> scheduleId = [];
  RxList<Schedules?>? schedules = <Schedules?>[].obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<int> id = 0.obs;

  Map<String, TypeModel> typedropdownMapperData = {};

  var type = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "0"),
    TypeModel(name: 'Wet', id: "1"),
  ];

  void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfInverters", "value": ''},
      {'key': "noOfSMBs", "value": ''},
      {'key': "noOfModules", "value": ''},
      {'key': "type", "value": 'Please Select'},
    ]);
  }

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
      });
      if (id != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getMcPlanDetail(planId: id.value);
        });
      }
      getMcPlanHistory(id: id.value);
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      var dataFromPreviousScreen = Get.arguments;

      id.value = dataFromPreviousScreen['id'];
      // id= Get.arguments;
      print('AddStock:$id');
    } catch (e) {
      print(e.toString() + 'userId');
    }
  }

  Future<void> getMcPlanHistory({required int id}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 81;
    historyList?.value = await viewMcPlaningPresenter.getHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getMcPlanDetail({required int planId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    mcPlanDetailsList?.value = <McPalningDetailsModel>[];

    final _mcPlanDetails =
        await viewMcPlaningPresenter.getMcPlanDetail(planId: planId);
    print('MC plan Detail:$_mcPlanDetails');

    if (_mcPlanDetails != null) {
      mcPlanDetailsModel.value = _mcPlanDetails;
      // plannedAtDateTimeCtrlrWeb.text =
      //     '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${mcPlanDetailsModel.value?.plannedAt}'))}';
      // startedAtDateTimeCtrlrWeb.text =
      //     '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${mcPlanDetailsModel.value?.startedAt}'))}';
      listSchedules?.value = mcPlanDetailsModel.value?.schedules ?? [];
      scheduleId =
          listSchedules!.map((element) => element?.scheduleId).toList();
      print('ScheduleId: ${scheduleId}');

      // rowItem.value = [];
      // schedules?.value = _mcPlanDetails.schedules;

      // _mcPlanDetails.schedules.forEach((element) {
      //   rowItem.value.add([
      //     {"key": "Schedule Id", "value": '${element!.scheduleId}'},
      //     {"key": "Days", "value": '${element.cleaningDay}'},ß
      //     {"key": "Scheduled Module", "value": '${element.scheduledModules}'},
      //     {"key": "Cleaned", "value": '${element.cleanedModules}'},
      //     {"key": "Abandoned", "value": '${element.abandonedModules}'},
      //     {"key": "Pending", "value": '${element.pendingModules}'},
      //     {"key": "Type", "value": '${element.cleaningTypeName}'},
      //     {"key": "Water Used", "value": '${element.waterUsed}'},
      //     {"key": "Remark", "value": '${element.remark}'},
      //     {"key": "Status", "value": '${element.status_short}'},
      //     {'key': "Actions", "value": ''},
      //   ]);
      // });
    }
  }

  void mcPlanApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderAproveModel =
          CommentModel(id: id, comment: _comment);

      var mcApproveJsonString = commentGoodsOrderAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewMcPlaningPresenter.mcPlanApprovedButton(
        mcApproveJsonString: mcApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void mcPlanRejectButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentGoodsOrderAproveModel =
          CommentModel(id: id, comment: _comment);

      var mcRejectJsonString = commentGoodsOrderAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewMcPlaningPresenter.mcPlanRejectButton(
        mcRejectJsonString: mcRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      default:
        {}
        break;
    }
  }
}
