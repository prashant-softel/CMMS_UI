import 'dart:async';
import 'dart:ui';

import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';

class AddEscalationMatrixController extends GetxController {
  AddEscalationMatrixController(this.addEscalationPresenter);
  AddEscalationMatrixPresenter addEscalationPresenter;

  final HomeController homeController = Get.find();

  RxList<int> dayList = <int>[].obs;

  // var status_Escalation = <Status_escalation>[].obs;
  // void addStatusEscalationData(
  //   int status_id,
  // ) {
  //   status_Escalation.value = [];
  //   status_Escalation
  //       .add(Status_escalation(status_id: status_id, escalation: escalationa));
  // }

  // var escalationa = <Escalation>[].obs;
  // void addEscalationData(
  //   int? days,
  //   int? role_id,
  // ) {
  //   escalationa.add(Escalation(
  //       days: int.tryParse('${durationDaysTextCtrlr.text}'),
  //       role_id: selectedRoleListId));
  // }

  ///Print Global key
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  List<Escalation> days = [];
  Map<String, RoleModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};

  void addRowItem() {
    rowItem.value.add([
      {"key": "Duration (Days)", "value": ''},
      {'key': "Escalation Roles and Levels", "value": 'Please Select'},
    ]);
  }

  RxList<ModuleListModel?> moduleList = <ModuleListModel>[].obs;
  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  int? selectedModuleListId = 0;
  int type = 1;

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

  ///duration in days
  // Rx<bool> isDurationDaysTextInvalid = false.obs;
  // var durationDaysTextCtrlr = TextEditingController();

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
      getTypePermitList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getModuleList(facilityId, type, true);
    });
    Future.delayed(Duration(seconds: 1), () {
      getRoleList();
    });
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

  Future<void> getTypePermitList() async {
    final _permitTypeList =
        await addEscalationPresenter.getTypePermitList(facility_id: 45);

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
    addRowItem();
  }

  Future<void> getModuleList(int facilityId, int type, bool isLoading) async {
    moduleList.value = <ModuleListModel>[];
    final _moduleList = await addEscalationPresenter.getModuleList(
        facilityId: facilityId, type: type, isLoading: isLoading);

    if (_moduleList != null) {
      moduleList.value = _moduleList;
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
      case RxList<RoleModel>:
        {
          int roleModelListIndex = roleList.indexWhere((x) => x?.name == value);
          selectedRoleListId = roleList[roleModelListIndex]?.id ?? 0;
          print('Role List Id: $selectedRoleListId');
        }
        break;
      case RxList<TypePermitModel>:
        {
          int prmitTypeIndex =
              typePermitList.indexWhere((x) => x?.name == value);
          selectedTypePermitId = typePermitList[prmitTypeIndex]?.id ?? 0;
          print('Type Permit Id: $selectedTypePermitId');
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
        .add(Status_escalation(status_id: 102, escalation: days));

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

    if (responseCreateEscalationMatrixModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    print('Add Escalation Matrix   data: $escalationMatrixJsonString');
  }

  // void createEscalationMatrix() async {
  //   {
  //     List<Escalation> days = [];
  //     rowItem.value.forEach((element) {
  //       Escalation day = Escalation(
  //         role_id: dropdownMapperData[element[1]["value"]]?.role_id,
  //         days: int.tryParse(element[0]["value"] ?? '0'),
  //       );
  //       days.add(day);
  //     });

  //     late List<Status_escalation> status_escalation = [];

  //     status_Escalation.forEach((e) {
  //       status_escalation.add(
  //           Status_escalation(status_id: e.status_id, escalation: e.escalation
  //               // is_required: e.is_required
  //               ));
  //     });

  //     CreateEscalationMatrixModel createEscalationMatrixModel =
  //         CreateEscalationMatrixModel();

  //     var escalationMatrixJsonString = [
  //       {
  //         "module_id": selectedModuleListId,
  //         "status_escalation": status_escalation
  //       }
  //     ];
  //     Map<String, dynamic>? responseCreateEscalationMatrix =
  //         await viewIncidentReportPresenter.createEscalationMatrix(
  //       createEscalationMatrix: escalationMatrixJsonString,
  //       isLoading: true,
  //     );

  //     if (responseCreateEscalationMatrix == null) {}
  //     print('Create Escalation Matrix data: $escalationMatrixJsonString');
  //   }
  // }

  Future<void> editIncidentReport({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }
}
