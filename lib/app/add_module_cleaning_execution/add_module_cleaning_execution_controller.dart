import 'dart:async';

import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';

class AddModuleCleaningExecutionController extends GetxController {
  AddModuleCleaningExecutionController(this.addModuleCleaningExecutionPresenter);
  AddModuleCleaningExecutionPresenter addModuleCleaningExecutionPresenter;

  final HomeController homeController = Get.find();

  Rx<String> selectedFacility = ''.obs;



 
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  List<Escalation> days = [];
  Map<String, RoleModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};

  void addRowItem() {
    rowItem.value.add([
      {"key": "Days", "value": ''},
      {"key": "Scheduled Module", "value": ''},
      {"key": "Cleaned", "value": ''},
      {"key": "Abandoned", "value": ''},
      {"key": "Pending", "value": ''},
      {"key": "Type", "value": ''},
      {"key": "Water Used", "value": ''},
      {"key": "Remark", "value": ''},
      {'key': "Actions", "value": ''},
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
  Rx<bool> isTypePermit = true.obs;

 

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );




 
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  ///
  // int? id = 0;
  int? planId = 0;
  String? status = '';
  @override
  void onInit() async {
    status = Get.arguments;
    // planId = Get.arguments;

    
    print('status:$status');
    // print('plan Id:$planId');

    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
      });
    });

     Future.delayed(Duration(seconds: 1), () {
        getTypePermitList();
      });

  
   

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await addModuleCleaningExecutionPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

   Future<void> getTypePermitList() async {
    final _permitTypeList =
        await addModuleCleaningExecutionPresenter.getTypePermitList(facility_id: facilityId);

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
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

 
  // void createEscalationMatrix() async {
  //   List<Escalation> days = [];
  //   rowItem.value.forEach((element) {
  //     Escalation day = Escalation(
  //       days: int.tryParse(element[0]["value"] ?? '0'),
  //       role_id: dropdownMapperData[element[1]["value"]]?.id,
  //     );
  //     days.add(day);
  //   });

  //   print('Days:${days}');

  //   late List<Status_escalation> state_escalation_list = [];

  //   state_escalation_list
  //       .add(Status_escalation(status_id: 102, escalation: days));

  //   CreateEscalationMatrixModel createEscalationMatrixModel =
  //       CreateEscalationMatrixModel(
  //     module_id: selectedModuleListId,
  //     status_escalation: state_escalation_list,
  //   );

  //   var escalationMatrixJsonString = [createEscalationMatrixModel.toJson()];
  //   Map<String, dynamic>? responseCreateEscalationMatrixModel =
  //       await addEscalationPresenter.createEscalationMatrix(
  //     createEscalationMatrix: escalationMatrixJsonString,
  //     isLoading: true,
  //   );

  //   if (responseCreateEscalationMatrixModel == null) {
  //     //  CreateNewPermitDialog();
  //     // showAlertDialog();
  //   }
  //   print('Add Escalation Matrix   data: $escalationMatrixJsonString');
  // }

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
