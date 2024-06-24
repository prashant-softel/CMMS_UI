// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:flutter/material.dart';
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

  Rx<VegExecutionDetailsModel?> vegExecutionDetailsModel =
      VegExecutionDetailsModel().obs;
  RxList<VegTaskEquipmentList?> vegTaskEquipment = <VegTaskEquipmentList>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, Schedules> dropdownMapperData = {};
  RxList<Schedules?>? schedules = <Schedules?>[].obs;
  RxList<Schedules?>? listSchedules = <Schedules?>[].obs;
  RxList<int> scheduleId = <int>[].obs;
  RxInt scheduledId = 0.obs;
  Map<String, dynamic> data = {};
  final TextEditingController commentTextFieldCtrlr = TextEditingController();
  final TextEditingController scheduleExecutionTextFieldCtrlr =
      TextEditingController();
  TextEditingController remarkTextFieldCtrlr = TextEditingController();

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
      });
      super.onInit();
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
      vegExecutionDetailsModel.value?.schedules?.forEach((element) {
        rowItem.value.add([
          {"key": "Schedule Id", "value": '${element.scheduleId}'},
          {"key": "Days", "value": '${element.cleaningDay}'},
          {"key": "Scheduled Module", "value": '${element.scheduled}'},
          {"key": "Cleaned", "value": '${element.cleaned}'},
          {"key": "Abandoned", "value": '${element.abandoned}'},
          {"key": "Pending", "value": '${element.pending}'},
          {"key": "Type", "value": '${element.cleaningTypeName}'},
          {"key": "Water Used", "value": '${element.waterUsed}'},
          {"key": "Remark", "value": '${element.remark}'},
          {"key": "Status", "value": '${element.status_short}'},
          {'key': "Actions", "value": ''},
        ]);
      });
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

  Future<void> endVegScheduleExecutionButton({int? scheduleID}) async {
    final _endVegScheduleExecutionBtn =
        await vegExecutionPresenter.endVegScheduleExecutionButton(
      scheduleId: scheduleID,
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
  }
}
