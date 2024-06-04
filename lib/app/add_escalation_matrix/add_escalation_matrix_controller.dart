import 'dart:async';

import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/status_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
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
  Map<String, RoleModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};

  void addRowItem() {
    rowItem.add([
      {"key": "Duration (Days)", "value": ''},
      {'key': "Escalation Roles and Levels", "value": 'Please Select'},
      {'key': "Action", "value": ''},
    ]);
  }

  RxList<ModuleModel?> moduleList = <ModuleModel>[].obs;
  Rx<StatusList?> statusList = StatusList().obs;
  RxList<Status?> status = <Status>[].obs;
  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  int? selectedModuleListId = 0;
  int type = 1;
  int statusId = 0;

  ///Permit Type
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  int selectedTypePermitId = 0;

  Rx<bool> isTypePermit = true.obs;
  Rx<String> selectedStartDate = ''.obs;
  Rx<bool> isStartdate = true.obs;
  Rx<bool> isEnddate = true.obs;

  Rx<bool> isFormInvalid = false.obs;

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///Plant Name
  RxList<FacilityModel?> facilityPlantList = <FacilityModel>[].obs;
  Rx<bool> isFacilityPlantSelected = true.obs;
  Rx<String> selectedPlantFacility = ''.obs;

  ///Equipment name List
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedEquipmentName = ''.obs;
  Rx<bool> isEquipmentNameSelected = true.obs;
  int selectedEquipmentnameId = 0;
  RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = ''.obs;
  Rx<bool> isSelectedRole = true.obs;
  int? selectedRoleListId = 0;

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  ///
  int? id = 0;
  @override
  void onInit() async {
    id = Get.arguments;
    print('EscalationMatrix_Id:$id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
      });
    });
    Future.delayed(Duration(seconds: 1), () {
      getModuleList(facilityId, type, true);
    });
    Future.delayed(Duration(seconds: 1), () {
      getRoleList();
    });
    addRowItem();
    // await getIncidentReportHistory(id: id!);

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await addEscalationPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
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
      case RxList<ModuleModel>:
        {
          if (value != "Please Select") {
            int moduleListIndex =
                moduleList.indexWhere((x) => x?.name == value);
            selectedModuleListId = moduleList[moduleListIndex]?.id ?? 0;
            getStatusList(moduleId: selectedModuleListId);
            print('Module List Id: $selectedModuleListId');
          } else {
            selectedModuleListId = 0;
          }
        }
        break;
      case RxList<RoleModel>:
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
      case RxList<Status>:
        {
          if (value != "Please Select") {
            int statusIndex = status.indexWhere((x) => x?.name == value);
            statusId = status[statusIndex]?.id ?? 0;
            selectedTypePermit.value = value;
          } else {
            statusId = 0;
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
    List<Escalation> days = [];
    rowItem.value.forEach((element) {
      Escalation day = Escalation(
        days: int.tryParse(element[0]["value"] ?? '0'),
        role_id: dropdownMapperData[element[1]["value"]]?.id,
      );
      days.add(day);
    });

    print('Days:${days}');

    late List<Status_escalation> state_escalation_list = [];

    state_escalation_list
        .add(Status_escalation(status_id: statusId, escalation: days));

    CreateEscalationMatrixModel createEscalationMatrixModel =
        CreateEscalationMatrixModel(
      module_id: selectedModuleListId,
      status_escalation: state_escalation_list,
    );

    var escalationMatrixJsonString = [createEscalationMatrixModel.toJson()];
    Map<String, dynamic>? responseCreateEscalationMatrixModel =
        await addEscalationPresenter.createEscalationMatrix(
      createEscalationMatrix: escalationMatrixJsonString,
      isLoading: true,
    );

    if (responseCreateEscalationMatrixModel == null) {}
    print('Add Escalation Matrix   data: $escalationMatrixJsonString');
  }
}
