import 'dart:async';

import 'package:cmms/app/execute_course/execute_course_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/schedule_course_model.dart';
import 'package:cmms/domain/models/training_course_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ExecuteCourseController extends GetxController {
  ExecuteCourseController(this.schedulePresenter);

  ExecuteCoursePresenter schedulePresenter;
  HomeController homeController = Get.find();
  RxInt facilityId = 0.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  TextEditingController dateOfTraining = TextEditingController();
  TextEditingController venue = TextEditingController();
  FocusNode venueFocus = FocusNode();
  ScrollController venueScroll = ScrollController();
  TextEditingController comment = TextEditingController();
  FocusNode commentFocus = FocusNode();
  ScrollController commentScroll = ScrollController();
  TextEditingController employeeName = TextEditingController();
  FocusNode employeeNameFocus = FocusNode();
  ScrollController employeeNameScroll = ScrollController();
  TextEditingController employeeEmail = TextEditingController();
  FocusNode employeeEmailFocus = FocusNode();
  ScrollController employeeEmailScroll = ScrollController();
  TextEditingController employeeNumber = TextEditingController();
  FocusNode employeeNumberFocus = FocusNode();
  ScrollController employeeNumberScroll = ScrollController();
  TextEditingController trainerName = TextEditingController();
  FocusNode trainerFocus = FocusNode();
  ScrollController trainerScroll = ScrollController();

  RxInt id = 0.obs;
  Rx<int> selectedCourseId = 0.obs;
  Rx<String> selectedCourseName = ''.obs;
  Rx<int> selectedEmployeeId = 0.obs;
  Rx<String> selectedEmployeeName = ''.obs;
  Rx<String> selectedModeName = ''.obs;
  Rx<int> selectedModeId = 0.obs;
  Rx<int> selectedTrainingAgencyId = 0.obs;
  Rx<String> selectedTrainingAgencyName = ''.obs;
  RxBool isTrainingCourseSelected = true.obs;
  RxBool isTrainingAgencySelected = true.obs;
  RxBool isEmployeeSelected = true.obs;
  RxBool isModeSelected = true.obs;
  Rx<bool> isemployeeNameListSelected = true.obs;
  Rx<String> selectedEmployeeNamesList = ''.obs;
  RxInt selectedId = 0.obs;

  Map<dynamic, dynamic> employee_map = {};
  RxList<ScheduleTrainingCourse> scheduleTrainingCourse =
      <ScheduleTrainingCourse>[].obs;
  RxList<int> selectedEmployeeIdList = <int>[].obs;
  RxList<EmployeeListModel?> employeeNameList = <EmployeeListModel>[].obs;
  RxList<EmployeeListModel?> filteredEmployeeNameList = <EmployeeListModel>[
    EmployeeListModel(
      login_id: "gapufi@mof.za",
      name: "Stella Coleman",
      mobileNumber: "(764) 598-3992",
    ),
    EmployeeListModel(
      login_id: "ekeevmuj@fo.au",
      name: "Genevieve Hansen",
      mobileNumber: "(668) 832-6583",
    ),
    EmployeeListModel(
      login_id: "vi@roon.de",
      name: "Genevieve Hansen",
      mobileNumber: "(668) 832-6583",
    ),
  ].obs;
  RxList<InternalEmployee> internalEmployees = <InternalEmployee>[].obs;
  List<TextEditingController> noteListInternal =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> noteListExternal =
      List.generate(3, (index) => TextEditingController());
  RxList<ExternalEmployees> externalEmployees = <ExternalEmployees>[
    ExternalEmployees(
      employeeName: "Cody Little",
      employeeEmail: "lima@lim.mz",
      employeeNumber: "(832) 948-5333",
    ),
    ExternalEmployees(
      employeeName: "Virginia Underwood",
      employeeEmail: "uc@upopo.tn",
      employeeNumber: "(567) 396-8452",
    ),
    ExternalEmployees(
      employeeName: "Daisy Parsons",
      employeeEmail: "wemko@wo.cz",
      employeeNumber: "(384) 437-1540",
    ),
  ].obs;
  RxList<GenderModel> mode = <GenderModel>[
    GenderModel(id: 1, name: 'Online'),
    GenderModel(id: 2, name: 'Offline'),
  ].obs;
  RxList<EmployeeModel> employees = <EmployeeModel>[
    EmployeeModel(
      id: 1,
      name: 'Majid',
    ),
    EmployeeModel(
      id: 2,
      name: 'Tanmay',
    ),
  ].obs;
  RxList<StatusModel> trainingAgency = <StatusModel>[
    StatusModel(
      id: 1,
      name: 'Softel Technologies',
    ),
    StatusModel(
      id: 2,
      name: 'Hero Future Energies',
    ),
  ].obs;

  RxList<TrainingCourse> trainingCourseList = <TrainingCourse>[
    TrainingCourse(
      id: 1,
      name: 'Training Course 1',
      description: 'Description 1',
    ),
    TrainingCourse(
      id: 2,
      name: 'Training Course 2',
      description: 'Description 2',
    ),
  ].obs;

  @override
  void onInit() {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId.value = event;
      getEmployeeList();
    });
    commentFocus.addListener(() {
      if (!commentFocus.hasFocus) {
        commentScroll.jumpTo(0.0);
      }
    });
    venueFocus.addListener(() {
      if (!venueFocus.hasFocus) {
        venueScroll.jumpTo(0.0);
      }
    });
    employeeNameFocus.addListener(() {
      if (!employeeNameFocus.hasFocus) {
        employeeNameScroll.jumpTo(0.0);
      }
    });
    employeeEmailFocus.addListener(() {
      if (!employeeEmailFocus.hasFocus) {
        employeeEmailScroll.jumpTo(0.0);
      }
    });
    employeeNumberFocus.addListener(() {
      if (!employeeNumberFocus.hasFocus) {
        employeeNumberScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  void addExternalEmployee() {
    externalEmployees.add(
      ExternalEmployees(
        employeeName: employeeName.text,
        employeeEmail: employeeEmail.text,
        employeeNumber: employeeNumber.text,
      ),
    );
    clear();
  }

  void clear() {
    employeeName.clear();
    employeeEmail.clear();
    employeeNumber.clear();
  }

  removeItem(int index) {
    externalEmployees.removeAt(index);
  }

  Future<void> getEmployeeList() async {
    employeeNameList.value = <EmployeeListModel>[];
    final _employeeNameList = await schedulePresenter.getEmployeeList(
      facility_id: facilityId.value,
      isLoading: true,
    );
    for (var employee_list in _employeeNameList) {
      employeeNameList.add(employee_list);
    }
    update();
  }

  void employeeNameSelected(_selectedEmployeeNameIds) {
    selectedEmployeeIdList.value = <int>[];
    filteredEmployeeNameList.value = <EmployeeListModel>[];
    late int emp_id = 0;
    for (var _selectedEmployeeNameId in _selectedEmployeeNameIds) {
      selectedEmployeeIdList.add(_selectedEmployeeNameId);
      EmployeeListModel? e = employeeNameList.firstWhere((element) {
        return element?.id == _selectedEmployeeNameId;
      });
      filteredEmployeeNameList.add(e);
    }

    employee_map[emp_id] = selectedEmployeeIdList;
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({list, value});
    switch (list.runtimeType) {
      case RxList<EmployeeModel>:
        {
          int employeeIndex = employees.indexWhere((x) => x.name == value);
          selectedEmployeeName.value = employees[employeeIndex].name ?? '';
          selectedEmployeeId.value = employees[employeeIndex].id ?? 0;
          print("facility selected $selectedEmployeeId, $selectedEmployeeName");
        }
        break;
      case RxList<TrainingCourse>:
        {
          int courseIndex =
              trainingCourseList.indexWhere((x) => x.name == value);
          selectedCourseName.value = trainingCourseList[courseIndex].name ?? '';
          selectedCourseId.value = trainingCourseList[courseIndex].id ?? 0;
          print("facility selected $selectedCourseName, $selectedCourseId");
        }
        break;
      case RxList<StatusModel>:
        {
          int agencyIndex = trainingAgency.indexWhere((x) => x.name == value);
          selectedTrainingAgencyName.value = trainingAgency[agencyIndex].name;
          selectedTrainingAgencyId.value = trainingAgency[agencyIndex].id ?? 0;
          print(
              "facility selected $selectedTrainingAgencyId, $selectedTrainingAgencyName");
        }
        break;
      case RxList<GenderModel>:
        {
          int modeIndex = mode.indexWhere((x) => x.name == value);
          selectedModeName.value = mode[modeIndex].name;
          selectedModeId.value = mode[modeIndex].id ?? 0;
          print("facility selected $selectedModeId, $selectedModeName");
        }
        break;
      case RxList<EmployeeListModel>:
        {
          int modeIndex = employeeNameList.indexWhere((x) => x?.name == value);
          selectedEmployeeNamesList.value =
              employeeNameList[modeIndex]?.name ?? "";
          selectedId.value = employeeNameList[modeIndex]?.id ?? 0;
          print("facility selected $selectedModeId, $selectedModeName");
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
