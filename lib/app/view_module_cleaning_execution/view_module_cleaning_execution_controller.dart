import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/get_mc_task_equipment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import 'view_module_cleaning_execution_presenter.dart';

class viewModuleCleaningExecutionController extends GetxController {
  viewModuleCleaningExecutionController(
      this.viewModuleCleaningExecutionPresenter);
  ViewModuleCleaningExecutionPresenter viewModuleCleaningExecutionPresenter;

  final HomeController homeController = Get.find();

  Rx<String> selectedFacility = ''.obs;

  RxList<GetMCTaskEquipmentList?> equipmenTasktList =
      <GetMCTaskEquipmentList?>[].obs;

  Schedules? selectedSchedule;

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  List<Escalation> days = [];
  Map<String, RoleModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};

  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  void addRowItem() {
    rowItem.value.add([
      {"key": "Days", "value": ''},
      {"key": "Scheduled Module", "value": ''},
      {"key": "Cleaned", "value": ''},
      {"key": "Abandoned", "value": ''},
      {"key": "Pending", "value": ''},
      {"key": "Type", "value": ''},
      {"key": "Water Used", "value": ''},
      {"key": "Start Date", "value": ''},
      {'key': "End Date", "value": ''},
      {'key': "Remark", "value": ''},
    ]);
  }

  RxList<ModuleListModel?> moduleList = <ModuleListModel>[].obs;
  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  int? selectedModuleListId = 0;
  int type = 1;

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///MC Execution History
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  ///Schedule List
  RxList<Schedules?>? listSchedules = <Schedules?>[].obs;
  RxList<EquipmentsList?>? listEquipmentsList = <EquipmentsList?>[].obs;

  ///Mc Execution details
  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;
  RxList<EndMCExecutionDetailsModel?>? mcExecutionDetailsList =
      <EndMCExecutionDetailsModel?>[].obs;

  ///Date Time
  var startedAtDateTimeCtrlrWeb = TextEditingController();
  var plannedAtDateTimeCtrlrWeb = TextEditingController();

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  ///
  Rx<int> mcid = 0.obs;
  Rx<int> planId = 0.obs;
  @override
  void onInit() async {
    try {
      await setMcId();

      // id = Get.arguments['id'];
      // planId = Get.arguments['planId'];
      // print('Id:$id');
      // print('PlanId:$planId');
      // print('View MC Execution_Id:$id');
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 1), () {
          getMCExecutionHistory(id: mcid.value, facilityId: facilityId);
        });
      });
      await getMCExecutionHistory(id: mcid.value, facilityId: facilityId);
      Future.delayed(Duration(seconds: 1), () {
        getMCTaskEquipmentList(facilityId, true, facilityId);
      });

      Future.delayed(Duration(seconds: 1), () {
        getMCExecutionDetail(executionId: mcid.value, facilityId: facilityId);
      });

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMcId() async {
    try {
      final _mcid = await viewModuleCleaningExecutionPresenter.getValueMcId();
      final _planId =
          await viewModuleCleaningExecutionPresenter.getValuePlanId();

      if (_mcid == null || _mcid == '' || _mcid == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mcid.value = dataFromPreviousScreen['mcid'];
        planId.value = dataFromPreviousScreen['planId'];

        viewModuleCleaningExecutionPresenter.saveValueMcId(
            mcid: mcid.value.toString());
        viewModuleCleaningExecutionPresenter.saveValuePlanId(
            planId: planId.value.toString());
      } else {
        mcid.value = int.tryParse(_mcid) ?? 0;
        planId.value = int.tryParse(_planId.toString()) ?? 0;
      }
    } catch (e) {
      // Utility.showDialog(e.toString(), 'mcid');
    }
  }

  Future<void> getMCExecutionDetail(
      {required int executionId, required int facilityId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    mcExecutionDetailsList?.value = <EndMCExecutionDetailsModel>[];

    final _mcExecutionDetails = await viewModuleCleaningExecutionPresenter
        .getMCExecutionDetail(executionId: executionId, facilityId: facilityId);
    print('View MC Execution Detail:$_mcExecutionDetails');

    if (_mcExecutionDetails != null) {
      mcExecutionDetailsModel.value = _mcExecutionDetails;
      plannedAtDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${mcExecutionDetailsModel.value?.plannedAt}'))}';
      startedAtDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${mcExecutionDetailsModel.value?.startedAt}'))}';
      listSchedules?.value = mcExecutionDetailsModel.value?.schedules ?? [];
      // listEquipmentsList!.value = mcExecutionDetailsModel.value.
    }
  }

  Future<void> getMCTaskEquipmentList(
      int taskId, bool isLoading, int facilityId) async {
    equipmenTasktList.value = <GetMCTaskEquipmentList>[];

    final list =
        await viewModuleCleaningExecutionPresenter.getMCTaskEquipmentList(
            isLoading: isLoading, taskId: mcid.value, facilityId: facilityId);
    // print('incidentReportFacilityId$facilityId');
    // print('Incident Report List:$list');
    for (var equipment_list in list) {
      equipmenTasktList.add(equipment_list);
    }

    equipmenTasktList.value = list;

    update(['equipment_list']);
  }

  // Future<void> getFacilityList() async {
  //   final _facilityList = await addModuleCleaningExecutionPresenter.getFacilityList();
  //   //print('Facility25:$_facilityList');
  //   if (_facilityList != null) {
  //     for (var facility in _facilityList) {
  //       facilityList.add(facility);
  //     }

  //     selectedFacility.value = facilityList[0]?.name ?? '';
  //     _facilityId.sink.add(facilityList[0]?.id ?? 0);
  //   }
  // }

  void mcExecutionApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentMCExecutionAproveModel =
          CommentModel(id: id, comment: _comment);

      var mcExecutionApproveJsonString = commentMCExecutionAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewModuleCleaningExecutionPresenter.mcExecutionApprovedButton(
              mcExecutionApproveJsonString: mcExecutionApproveJsonString,
              isLoading: true,
              facility_id: facilityId);
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void rejectMcExecutionApprovedButton({int? id}) async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentMCExecutionAproveModel =
          CommentModel(id: id, comment: _comment);

      var rejectMcExecutionApproveJsonString =
          commentMCExecutionAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewModuleCleaningExecutionPresenter
              .rejectMcExecutionApprovedButton(
                  rejectMcExecutionApproveJsonString:
                      rejectMcExecutionApproveJsonString,
                  isLoading: true,
                  facility_id: facilityId);
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  Future<void> getMCExecutionHistory(
      {required int id, required int facilityId}) async {
    int moduleType = 82;
    // int tempModuleType = 21;
    // int id = Get.arguments;
    //
    historyList?.value =
        await viewModuleCleaningExecutionPresenter.getMCExecutionHistory(
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

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<FacilityModel>):
        {
          if (value != "Please Select") {
            int facilityIndex =
                facilityList.indexWhere((x) => x?.name == value);

            _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          } else {
            facilityId = 0;
          }
        }
        break;
      case const (RxList<ModuleListModel>):
        {
          if (value != "Please Select") {
            int moduleListIndex =
                moduleList.indexWhere((x) => x?.name == value);
            selectedModuleListId = moduleList[moduleListIndex]?.id ?? 0;
            print('Module List Id: $selectedModuleListId');
          } else {
            selectedModuleListId = 0;
          }
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  // Future<void> editIncidentReport({int? id}) async {
  //   Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
  //   print('Argument$id');
  // }
}
