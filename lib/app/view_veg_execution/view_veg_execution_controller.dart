import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_veg_execution/view_veg_execution_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ViewVegExecutionController extends GetxController {
  ViewVegExecutionController(this.viewVegExecutionPresenter);
  
  ViewVegExecutionPresenter viewVegExecutionPresenter;

  final HomeController homeController = Get.find();
  Rx<String> selectedFacility = ''.obs;
  Schedules? selectedSchedule;

  // RxList<GetMCTaskEquipmentList?> equipmenTasktList =
  // <GetMCTaskEquipmentList?>[].obs;

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, RoleModel> dropdownMapperData = {};

  // List<Escalation> days = [];
  // Map<String, PaiedModel> paiddropdownMapperData = {};

  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  // void addRowItem() {
  //   rowItem.value.add([
  //     {"key": "Days", "value": ''},
  //     {"key": "Scheduled Module", "value": ''},
  //     {"key": "Cleaned", "value": ''},
  //     {"key": "Abandoned", "value": ''},
  //     {"key": "Pending", "value": ''},
  //     {"key": "Water Used", "value": ''},
  //     {"key": "Start Date", "value": ''},
  //     {'key': "End Date", "value": ''},
  //     {'key': "Remark", "value": ''},
  //   ]);
  // }

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
  RxList<Schedules?>? listSchedules = <Schedules?>[].obs;
  RxList<Equipments?>? listEquipmentsList = <Equipments?>[].obs;

  Rx<VegExecutionDetailsModel?> vegExecutionDetailsModel =
      VegExecutionDetailsModel().obs;
  RxList<VegExecutionDetailsModel?>? vegExecutionDetailsList =
      <VegExecutionDetailsModel?>[].obs;

  var startedAtDateTimeCtrlrWeb = TextEditingController();
  var plannedAtDateTimeCtrlrWeb = TextEditingController();
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<int> vegid = 0.obs;
  Rx<int> vegplanId = 0.obs;

  void onInit() async {
    try {
      await setVegId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
      });

      Future.delayed(Duration(seconds: 1), () {
        getVegExecutionDetail(executionId: vegid.value);
      });
          super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setVegId() async {
    try {
      final _vegid = await viewVegExecutionPresenter.getValueVegId();
      final _vegplanId =
          await viewVegExecutionPresenter.getValuePlanId();

      if (_vegid == null || _vegid == '' || _vegid == "null") {
        var dataFromPreviousScreen = Get.arguments;

        vegid.value = dataFromPreviousScreen['vegid'];
        vegplanId.value = dataFromPreviousScreen['vegplanId'];

        viewVegExecutionPresenter.saveValueVegId(
            vegid: vegid.value.toString());
        viewVegExecutionPresenter.saveValuePlanId(
            vegplanId: vegplanId.value.toString());
      } else {
        vegid.value = int.tryParse(_vegid) ?? 0;
        vegplanId.value = int.tryParse(_vegplanId.toString()) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'vegid');
    }
  }

    Future<void> getVegExecutionDetail({required int executionId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    vegExecutionDetailsList?.value = <VegExecutionDetailsModel>[];

    final _vegExecutionDetails = await viewVegExecutionPresenter
        .getVegExecutionDetail(executionId: executionId);
    print('View Vegetation Execution Detail:$_vegExecutionDetails');

    if (_vegExecutionDetails != null) {
      vegExecutionDetailsModel.value = _vegExecutionDetails;
      plannedAtDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${vegExecutionDetailsModel.value?.plannedAt}'))}';
      startedAtDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${vegExecutionDetailsModel.value?.startedAt}'))}';
      listSchedules?.value = vegExecutionDetailsModel.value?.schedules ?? [];
      // listEquipmentsList!.value = vegExecutionDetailsModel.value.
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      case RxList<ModuleListModel>:
        {
          int moduleListIndex = moduleList.indexWhere((x) => x?.name == value);
          selectedModuleListId = moduleList[moduleListIndex]?.id ?? 0;
          print('Module List Id: $selectedModuleListId');
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
