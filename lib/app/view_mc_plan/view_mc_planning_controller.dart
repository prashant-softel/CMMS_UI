import 'dart:async';

import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
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
  TextEditingController mcTitelCtrlr = TextEditingController();
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, dynamic> data = {};
  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;

  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();

  RxList<McPalningDetailsModel?>? mcPlanDetailsList =
      <McPalningDetailsModel?>[].obs;
  Rx<McPalningDetailsModel?> mcPlanDetailsModel = McPalningDetailsModel().obs;
  RxList<Schedules?>? listSchedules = <Schedules?>[].obs;
  List<int?> scheduleId = [];
  RxList<Schedules?>? schedules = <Schedules?>[].obs;
  Schedules? selectedSchedules;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  var durationInDayCtrlr = TextEditingController();

  Rx<int> mcid = 0.obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;
  var startDateTc = TextEditingController();

  // Map<String, TypeModel> typedropdownMapperData = {};
  RxMap<dynamic, dynamic> cleaningTyperopdownMapperData = {}.obs;

  var days = <TypeModel>[
    TypeModel(name: 'Day 1', id: "1"),
    TypeModel(name: 'Day 2', id: "2"),
    TypeModel(name: 'Day 3', id: "3"),
  ];
  RxList<TypeModel> cleaningType = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "1"),
    TypeModel(name: 'Wet', id: "2"),
  ].obs;

  void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfInverters", "value": ''},
      {'key': "noOfSMBs", "value": ''},
      {'key': "noOfModules", "value": ''},
      {'key': "cleaningType", "value": 'Please Select', "id": ""},
    ]);
  }

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
      });
      if (mcid != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getMcPlanDetail(planId: mcid.value, facilityId: facilityId);
        });
      }
      Future.delayed(Duration(seconds: 1), () {
        getEquipmentModelList(facilityId, true);
      });
      Future.delayed(Duration(seconds: 1), () {
        getMcPlanHistory(id: mcid.value, facilityId: facilityId);
      });
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> setUserId() async {
    final String? _mcid = Get.parameters['mcid'];
    mcid.value = int.tryParse(_mcid ?? "") ?? 0;

    // try {
    //   final _mcid = await viewMcPlaningPresenter.getValue();
    //   if (_mcid == null || _mcid == '' || _mcid == "null") {
    //     var dataFromPreviousScreen = Get.arguments;

    //     mcid.value = dataFromPreviousScreen['mcid'];
    //     viewMcPlaningPresenter.saveValue(mcid: mcid.value.toString());
    //   } else {
    //     mcid.value = int.tryParse(_mcid) ?? 0;
    //   }
    // } catch (e) {
    //   Utility.showDialog(e.toString(), 'mcid');
    // }
  }

  Future<void> getEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <EquipmentListModel>[];

    final list = await viewMcPlaningPresenter.getEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);

    equipmentList.value = list;

    update(['equipment_list']);
  }

  Future<void> getMcPlanHistory(
      {required int id, required int facilityId}) async {
    int moduleType = 81;
    historyList?.value = await viewMcPlaningPresenter.getHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          id,
          facilityId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getMcPlanDetail(
      {required int planId, required int facilityId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    // mcPlanDetailsList?.value = <McPalningDetailsModel>[];

    final _mcPlanDetails = await viewMcPlaningPresenter.getMcPlanDetail(
        facilityId: facilityId, planId: planId, isLoading: true);
    print('MC plan Detail:$_mcPlanDetails');

    if (_mcPlanDetails != null) {
      mcPlanDetailsModel.value = _mcPlanDetails;
      mcTitelCtrlr.text = mcPlanDetailsModel.value?.title ?? "";
      selectedfrequency.value = mcPlanDetailsModel.value?.frequency ?? '';
      startDateTc.text = mcPlanDetailsModel.value?.startDate ?? '';
      durationInDayCtrlr.text =
          mcPlanDetailsModel.value?.noOfCleaningDays.toString() ?? "";

      rowItem.value = [];
      final sortedSchedules = _mcPlanDetails.schedules;
      sortedSchedules
          .sort((a, b) => a.cleaningDay!.compareTo(b.cleaningDay ?? 0));

      schedules!.value = sortedSchedules;

      _mcPlanDetails.schedules.forEach(
        (element) {
          rowItem.value.add(
            [
              {"key": "day", "value": '${element.cleaningDay}'},
              {"key": "noOfInverters", "value": '${element.invs}'},
              {'key': "noOfSMBs", "value": '${element.smbs}'},
              {'key': "noOfModules", "value": '${element.scheduledModules}'},
              {'key': "cleaningType", "value": '${element.cleaningTypeName}'},
            ],
          );
        },
      );
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
              facility_id: facilityId);
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
              facility_id: facilityId);
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
