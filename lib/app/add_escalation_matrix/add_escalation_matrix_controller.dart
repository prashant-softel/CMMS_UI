import 'dart:async';

import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/escalation_details_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/status_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';

class AddEscalationMatrixController extends GetxController {
  AddEscalationMatrixController(this.addEscalationPresenter);
  AddEscalationMatrixPresenter addEscalationPresenter;

  final HomeController homeController = Get.find();

  RxList<int> dayList = <int>[].obs;
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;
  List<Escalation> days = [];
  Map<dynamic, dynamic> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};
  RxBool isStatusSelected = true.obs;
  RxString selectedStatus = ''.obs;

  void addRowItem() {
    rowItem.add([
      {"key": "Duration (Days)", "value": ''},
      {"key": "Escalation Role Id", "value": ''},
      {'key': "Escalation Roles and Levels", "value": 'Please Select'},
      {'key': "Action", "value": ''},
    ]);
  }

  RxList<ModuleModel?> moduleList = <ModuleModel>[].obs;
  ModuleModel moduleModel = ModuleModel();
  Rx<StatusList?> statusList = StatusList().obs;
  RxList<Status?> status = <Status>[].obs;
  Status statusModel = Status();
  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  int type = 1;
  RxInt status_id = 0.obs;
  RxInt module_id = 0.obs;

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = ''.obs;
  Rx<bool> isSelectedRole = true.obs;
  int? selectedRoleListId = 0;
  RxList<EscalationDetails?> escalation_details_list =
      <EscalationDetails>[].obs;
  Rx<EscalationDetails?> escalation_details = EscalationDetails().obs;
  RxList<StatusEscalation>? status_escalation_list = <StatusEscalation>[].obs;
  Rx<StatusEscalation> status_escalation = StatusEscalation().obs;
  RxList<EscalationDetail> escalation_list = <EscalationDetail>[].obs;
  Rx<EscalationDetail> escalation = EscalationDetail().obs;

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxInt facilityId = 0.obs;

  @override
  void onInit() async {
    await setId();
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId.value = event;
      await getModuleList(facilityId.value, type, true);
      await getRoleList();
      if (module_id.value != 0) {
        await getStatusList(moduleId: module_id.value);
        await getEscalationDetail(
          moduleId: module_id.value,
          statusId: status_id.value,
          isLoading: true,
        );
      }
    });
    addRowItem();
    super.onInit();
  }

  @override
  void onClose() async {
    clearStoreData();
    super.onClose();
  }

  Future<void> setId() async {
    try {
      final _status_id = await addEscalationPresenter.getStatusValue();
      final _module_id = await addEscalationPresenter.getModuleValue();
      if (_status_id == null || _status_id == "" || _status_id == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        status_id.value = dataFromPrevioursScreen['status_id'];
        module_id.value = dataFromPrevioursScreen['module_id'];
        addEscalationPresenter.saveStatusValue(
          statusId: status_id.value.toString(),
        );
        addEscalationPresenter.saveModuleValue(
          moduleId: module_id.value.toString(),
        );
      } else {
        status_id.value = int.tryParse(_status_id) ?? 0;
        module_id.value = int.tryParse(_module_id!) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  void clearStoreData() {
    addEscalationPresenter.clearStatusValue();
    addEscalationPresenter.clearModuleValue();
  }

  Future<void> getEscalationDetail({
    int? moduleId,
    int? statusId,
    bool? isLoading,
  }) async {
    final _matrixDetails = await addEscalationPresenter.getEscalationDetail(
      moduleId: moduleId ?? 0,
      statusId: statusId ?? 0,
      isLoading: isLoading,
    );
    if (_matrixDetails.isNotEmpty) {
      escalation_details_list.value = _matrixDetails;
      escalation_details.value = escalation_details_list.firstWhereOrNull(
        (element) => element?.module_id == module_id.value,
      );
      status_escalation_list?.value =
          escalation_details.value!.status_escalation!;
      status_escalation.value = status_escalation_list!.firstWhereOrNull(
        (element) => element.status_id == status_id.value,
      )!;
      escalation_list.value = status_escalation.value.escalation!;
      escalation.value = escalation_list.firstWhereOrNull(
        (element) => element.role_id != null,
      )!;
      module_id.value = escalation_details.value?.module_id ?? 0;
      status_id.value = status_escalation.value.status_id ?? 0;
      statusModel =
          status.firstWhereOrNull((element) => element?.id == status_id.value)!;
      moduleModel = moduleList
          .firstWhereOrNull((element) => element?.id == module_id.value)!;
      selectedStatus.value = statusModel.name ?? "";
      selectedModuleList.value = moduleModel.name ?? "";

      rowItem.value = [];
      escalation_list.forEach((element) {
        rowItem.add([
          {
            "key": "Duration (Days)",
            "value": '${element.days}',
          },
          {
            "key": "Escalation Role Id",
            "value": '${element.role_id}',
          },
          {
            'key': "Escalation Roles and Levels",
            "value": '${element.role_name}',
          },
          {
            'key': "Action",
            "value": '',
          },
        ]);
        dropdownMapperData[element.role_name ?? ""] = roleList.firstWhereOrNull(
          (e) => e?.name == element.role_name,
        );
      });
    }
    update(["escalation-matrix"]);
  }

  Future<void> getRoleList() async {
    final list = await addEscalationPresenter.getRoleList();
    if (list != null) {
      for (var _roleList in list) {
        roleList.add(_roleList);
      }
    }
  }

  Future<void> getModuleList(int facilityId, int type, bool isLoading) async {
    moduleList.value = <ModuleModel>[];
    final _moduleList = await addEscalationPresenter.getModuleList(
        facilityId: facilityId, type: type, isLoading: isLoading);

    if (_moduleList != null) {
      moduleList.value = _moduleList;
    }
  }

  Future<void> getStatusList({int? moduleId}) async {
    statusList.value = StatusList();
    final _statusList = await addEscalationPresenter.getStatusList(
      moduleId: moduleId,
      isLoading: true,
    );

    if (_statusList != null) {
      statusList.value = _statusList;
      status.value = statusList.value!.status!;
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<ModuleModel>):
        {
          if (value != "Please Select") {
            int moduleListIndex =
                moduleList.indexWhere((x) => x?.name == value);
            module_id.value = moduleList[moduleListIndex]?.id ?? 0;
            getStatusList(moduleId: module_id.value);
            print('Module List Id: $module_id.value');
          } else {
            module_id.value = 0;
          }
        }
        break;
      case const (RxList<RoleModel>):
        {
          if (value != "Please Select") {
            int roleModelListIndex =
                roleList.indexWhere((x) => x?.name == value);
            selectedRoleListId = roleList[roleModelListIndex]?.id ?? 0;
            print('Role List Id: $selectedRoleListId');
          } else {
            selectedRoleListId = 0;
          }
        }
        break;
      case const (RxList<Status>):
        {
          if (value != "Please Select") {
            int statusIndex = status.indexWhere((x) => x?.name == value);
            status_id.value = status[statusIndex]?.id ?? 0;
            selectedStatus.value = value;
          } else {
            status_id.value = 0;
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

  void createEscalationMatrix() async {
    rowItem.value.forEach((element) {
      Escalation day = Escalation(
        days: int.tryParse(element[0]["value"] ?? '0'),
        role_id: int.tryParse(element[1]["value"] ?? "0"),
      );
      days.add(day);
    });

    print('Days:${days}');

    late List<Status_escalation> state_escalation_list = [];

    state_escalation_list
        .add(Status_escalation(status_id: status_id.value, escalation: days));

    CreateEscalationMatrixModel createEscalationMatrixModel =
        CreateEscalationMatrixModel(
      module_id: module_id.value,
      status_escalation: state_escalation_list,
    );

    var escalationMatrixJsonString = [createEscalationMatrixModel.toJson()];
    Map<String, dynamic>? responseCreateEscalationMatrixModel =
        await addEscalationPresenter.createEscalationMatrix(
      createEscalationMatrix: escalationMatrixJsonString,
      moduleId: module_id.value,
      statusId: status_id.value,
      isLoading: true,
    );

    if (responseCreateEscalationMatrixModel == null) {}
    print('Add Escalation Matrix   data: $escalationMatrixJsonString');
  }

  Future<void> viewEscalationMatrix({
    required int moudle_id,
    required int status_id,
  }) async {
    clearStoreData();
    Get.toNamed(
      Routes.viewEscalatiomMatrixContentWeb,
      arguments: {
        "module_id": moudle_id,
        "status_id": status_id,
      },
    );
  }
}
