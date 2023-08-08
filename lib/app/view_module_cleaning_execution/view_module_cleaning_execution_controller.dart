import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import 'view_module_cleaning_execution_presenter.dart';

class viewModuleCleaningExecutionController extends GetxController {
  viewModuleCleaningExecutionController(this.viewModuleCleaningExecutionPresenter);
  ViewModuleCleaningExecutionPresenter viewModuleCleaningExecutionPresenter;

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
  int? id = 0;
  @override
  void onInit() async {
    id = Get.arguments;
    print('View MC Execution_Id:$id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      // Future.delayed(Duration(seconds: 1), () {
      //   getFacilityList();
      // });
    });

  
   

    super.onInit();
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

 
 
  // Future<void> editIncidentReport({int? id}) async {
  //   Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
  //   print('Argument$id');
  // }
}
