import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/schedule_course/schedule_course_presenter.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/schedule_course_model.dart';
import 'package:cmms/domain/models/training_course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  ScheduleController(this.schedulePresenter);

  SchedulePresenter schedulePresenter;
  HomeController homeController = Get.find();
  TextEditingController dateOfTraining = TextEditingController();
  TextEditingController venue = TextEditingController();
  FocusNode venueFocus = FocusNode();
  ScrollController venueScroll = ScrollController();
  TextEditingController comment = TextEditingController();
  FocusNode commentFocus = FocusNode();
  ScrollController commentScroll = ScrollController();
  TextEditingController employeeName = TextEditingController();
  TextEditingController employeeEmail = TextEditingController();
  TextEditingController employeeNumber = TextEditingController();

  Rx<int> selectedCourseId = 0.obs;
  Rx<String> selectedCourseName = ''.obs;
  Rx<int> selectedEmployeeId = 0.obs;
  Rx<String> selectedEmployeeName = ''.obs;
  Rx<int> selectedTrainingAgencyId = 0.obs;
  Rx<String> selectedTrainingAgencyName = ''.obs;
  RxBool isTrainingCourseSelected = true.obs;
  RxBool isTrainingAgencySelected = true.obs;
  RxBool isEmployeeSelected = true.obs;

  RxList<ScheduleTrainingCourse> scheduleTrainingCourse =
      <ScheduleTrainingCourse>[].obs;
  RxList<InternalEmployee> internalEmployees = <InternalEmployee>[].obs;
  RxList<ExternalEmployees> externalEmployees = <ExternalEmployees>[].obs;
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
  RxList<EmployeeModel> trainingAgency = <EmployeeModel>[
    EmployeeModel(
      id: 1,
      name: 'Softel Technologies',
    ),
    EmployeeModel(
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
    super.onInit();
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({list, value});
    switch (list.runtimeType) {
      case RxList<EmployeeModel>:
        {
          int employeeIndex = employees.indexWhere((x) => x.name == value);
          selectedEmployeeName.value = employees[employeeIndex].name ?? '';
          selectedEmployeeId.value = employees[employeeIndex].id ?? 0;
          print({"selected facality11": selectedEmployeeName});
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
      case RxList<EmployeeModel>:
        {
          int agencyIndex = trainingAgency.indexWhere((x) => x.name == value);
          selectedTrainingAgencyName.value =
              trainingAgency[agencyIndex].name ?? '';
          selectedTrainingAgencyId.value = trainingAgency[agencyIndex].id ?? 0;
          print(
              "facility selected $selectedTrainingAgencyId, $selectedTrainingAgencyName");
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
