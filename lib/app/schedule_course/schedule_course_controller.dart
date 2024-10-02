import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/schedule_course/schedule_course_presenter.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/schedule_course_details_model.dart';
import 'package:cmms/domain/models/schedule_course_model.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ScheduleController extends GetxController {
  ScheduleController(this.schedulePresenter);

  SchedulePresenter schedulePresenter;
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
  TextEditingController employeeDesignation = TextEditingController();
  FocusNode employeeDesignationFocus = FocusNode();
  ScrollController employeeDesignationScroll = ScrollController();
  TextEditingController company = TextEditingController();
  FocusNode companyFocus = FocusNode();
  ScrollController companyScroll = ScrollController();
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
  RxInt courseId = 0.obs;
  RxInt scheduleId = 0.obs;
  RxBool isLoading = true.obs;

  RxBool isFormInvalid = false.obs;
  RxBool isDateInvalid = false.obs;
  RxBool isTrainerInvalid = false.obs;
  RxBool isVenueInvalid = false.obs;
  RxBool isCommentInvalid = false.obs;
  RxBool isExternalEmployeeInvalid = false.obs;
  RxBool isEmployeeNameInvalid = false.obs;
  RxBool isEmployeeEmailInvalid = false.obs;
  RxBool isEmployeeNumberInvalid = false.obs;
  RxBool isEmployeeDesignationInvalid = false.obs;
  RxBool isCompanyInvalid = false.obs;

  Map<dynamic, dynamic> employee_map = {};
  RxList<ScheduleTrainingCourse> scheduleTrainingCourse =
      <ScheduleTrainingCourse>[].obs;
  Rx<DateTime> selectedStartTime = DateTime.now().obs;
  Rx<TrainingCourseListModel> trainingCourse = TrainingCourseListModel().obs;
  Rx<ScheduleCourseDetails> scheduleCourseDetails = ScheduleCourseDetails().obs;
  RxList<int> selectedEmployeeIdList = <int>[].obs;
  RxList<EmployeeListModel?> employeeNameList = <EmployeeListModel>[].obs;
  RxList<EmployeeListModel?> filteredEmployeeNameList =
      <EmployeeListModel>[].obs;
  RxList<InternalEmployee> internalEmployees = <InternalEmployee>[].obs;
  RxList<ExternalEmployees> externalEmployees = <ExternalEmployees>[].obs;
  RxList<StatusModel> mode = <StatusModel>[
    StatusModel(id: 1, name: 'Online'),
    StatusModel(id: 2, name: 'Offline'),
    StatusModel(id: 2, name: 'Online + Offline'),
  ].obs;
  RxList<EmployeeListModel?> employees = <EmployeeListModel>[].obs;
  RxList<BusinessListModel> trainingAgency = <BusinessListModel>[
    BusinessListModel(
      id: 1,
      name: 'Softel Technologies',
    ),
    BusinessListModel(
      id: 2,
      name: 'Hero Future Energies',
    ),
  ].obs;

  @override
  void onInit() async {
    await setId();
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId.value = event;
      await getEmployeeList();
      await getCourseDetails(courseId.value);
      if (scheduleId.value != 0) {
        await getScheduleCourseDetails(schedule_id: scheduleId.value);
      }
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
    trainerFocus.addListener(() {
      if (!trainerFocus.hasFocus) {
        trainerScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> setId() async {
    try {
      final _courseId = await schedulePresenter.getValue();
      final _scheduleId = await schedulePresenter.getScheduleValue();
      if (_courseId == null || _courseId == "" || _courseId == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        courseId.value = dataFromPrevioursScreen['courseId'];
        scheduleId.value = dataFromPrevioursScreen['scheduleId'];
        schedulePresenter.saveValue(courseId: courseId.value.toString());
        schedulePresenter.saveScheduleValue(
            scheduleId: scheduleId.value.toString());
      } else {
        courseId.value = int.tryParse(_courseId) ?? 0;
        scheduleId.value = int.tryParse(_scheduleId ?? "") ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  void clearStoreData() {
    schedulePresenter.clearValue();
    schedulePresenter.clearScheduleValue();
  }

  Future<void> getCourseDetails(int courseId) async {
    trainingCourse.value = TrainingCourseListModel();
    final _courseDetails = await schedulePresenter.getCourseDetails(
      courseId: courseId,
      isLoading: isLoading.value,
    );
    trainingCourse.value = _courseDetails;
    isLoading.value = false;
  }

  Future<void> getScheduleCourseDetails({required int schedule_id}) async {
    scheduleCourseDetails.value = ScheduleCourseDetails();
    final _courseDetails = await schedulePresenter.getScheduleCourseDetails(
      schedule_id: schedule_id,
      isLoading: true,
    );
    scheduleCourseDetails.value = _courseDetails;
  }

  void addExternalEmployee() {
    checkFormExternal();
    if (isExternalEmployeeInvalid.value) {
      return;
    }
    externalEmployees.add(
      ExternalEmployees(
        employeeName: employeeName.text,
        employeeEmail: employeeEmail.text,
        employeeNumber: employeeNumber.text,
        designation: employeeDesignation.text,
        companyName: company.text,
      ),
    );
    clear();
    Get.back();
  }

  void clear() {
    employeeName.clear();
    employeeEmail.clear();
    employeeNumber.clear();
    employeeDesignation.clear();
    company.clear();
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

  Future<void> getEmployeePermitList() async {
    employeeNameList.value = <EmployeeListModel>[];
    
    final _employeeNameList = await schedulePresenter.getEmployeePermitList(
      isLoading: true,
      facility_id: facilityId.value,
      featureId: UserAccessConstants.kPermitFeatureId,
    );
    for (var employee_list in _employeeNameList) {
      employees.add(employee_list);
    }
  }

  void employeeNameSelected(_selectedEmployeeNameIds) {
    selectedEmployeeIdList.value = <int>[];
    filteredEmployeeNameList.value = <EmployeeListModel>[];
    for (var _selectedEmployeeNameId in _selectedEmployeeNameIds) {
      selectedEmployeeIdList.add(_selectedEmployeeNameId);
      EmployeeListModel? e = employeeNameList.firstWhere((element) {
        return element?.id == _selectedEmployeeNameId;
      });
      filteredEmployeeNameList.add(e);
    }
  }

  void checkFormExternal() {
    if (employeeName.text.isEmpty) {
      isEmployeeNameInvalid.value = false;
      isExternalEmployeeInvalid.value = true;
    } else {
      isEmployeeNameInvalid.value = true;
    }
    if (employeeEmail.text.isEmpty) {
      isEmployeeEmailInvalid.value = false;
      isExternalEmployeeInvalid.value = true;
    } else {
      isEmployeeEmailInvalid.value = true;
    }
    if (employeeNumber.text.isEmpty) {
      isEmployeeNumberInvalid.value = false;
      isExternalEmployeeInvalid.value = true;
    } else {
      isEmployeeNumberInvalid.value = true;
    }
    if (employeeDesignation.text.isEmpty) {
      isEmployeeDesignationInvalid.value = false;
      isExternalEmployeeInvalid.value = true;
    } else {
      isEmployeeDesignationInvalid.value = true;
    }
    if (company.text.isEmpty) {
      isCompanyInvalid.value = false;
      isExternalEmployeeInvalid.value = true;
    } else {
      isCompanyInvalid.value = true;
    }
  }

  void checkForm() {
    if (dateOfTraining.text.isEmpty) {
      isDateInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isDateInvalid.value = false;
    }
    if (trainerName.text.isEmpty) {
      isTrainerInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isTrainerInvalid.value = false;
    }
    if (venue.text.isEmpty) {
      isVenueInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isVenueInvalid.value = false;
    }
    if (comment.text.isEmpty) {
      isCommentInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isCommentInvalid.value = false;
    }
    if (selectedTrainingAgencyName.value == '') {
      isTrainingAgencySelected.value = false;
      isFormInvalid.value = true;
    } else {
      isTrainingAgencySelected.value = true;
    }
    if (selectedEmployeeName.value == '') {
      isEmployeeSelected.value = false;
      isFormInvalid.value = true;
    } else {
      isEmployeeSelected.value = true;
    }
    if (selectedModeName.value == '') {
      isModeSelected.value = false;
      isFormInvalid.value = true;
    } else {
      isModeSelected.value = true;
    }
  }

  Future<void> scheduleCourse({List<dynamic>? fileIds}) async {
    // checkForm();
    // if (isFormInvalid.value) {
    //   return;
    // }
    String _venue = venue.text.trim();
    String _trainerName = trainerName.text.trim();
    String _dateOfTraining = dateOfTraining.text.trim();
    String _comment = comment.text.trim();
    filteredEmployeeNameList.forEach((e) {
      internalEmployees.add(
        InternalEmployee(
          empId: e?.id,
          empName: e?.name,
          empEmail: e?.login_id,
          empNumber: e?.mobileNumber,
          empDesignation: e?.designation,
        ),
      );
    });

    ScheduleTrainingCourse scheduleCourse = ScheduleTrainingCourse(
      courseId: courseId.value,
      courseName: trainingCourse.value.name,
      comment: _comment,
      trainingAgencyId: selectedTrainingAgencyId.value,
      dateOfTraining: _dateOfTraining,
      venue: _venue,
      facility_id: facilityId.value,
      trainerName: _trainerName,
      hfeEmployeeId: selectedEmployeeId.value,
      mode: selectedModeName.value,
      internalEmployees: internalEmployees,
      externalEmployees: externalEmployees,
      uploadfile_ids: fileIds,
    );
    var scheduleCourseJson = scheduleCourse.toJson();
    schedulePresenter.scheduleCourse(
      scheduleCourseJson: scheduleCourseJson,
      isLoading: isLoading.value,
    );

    print("Successfully scheduled");
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({list, value});
    switch (list.runtimeType) {
      case const (RxList<EmployeeModel>):
        {
          int employeeIndex = employees.indexWhere((x) => x?.name == value);
          selectedEmployeeName.value = employees[employeeIndex]?.name ?? '';
          selectedEmployeeId.value = employees[employeeIndex]?.id ?? 0;
          isEmployeeSelected.value = true;
          print("facility selected $selectedEmployeeId, $selectedEmployeeName");
        }
        break;
      case const (RxList<BusinessListModel>):
        {
          int agencyIndex = trainingAgency.indexWhere((x) => x.name == value);
          selectedTrainingAgencyName.value =
              trainingAgency[agencyIndex].name ?? '';
          isTrainingAgencySelected.value = true;
          selectedTrainingAgencyId.value = trainingAgency[agencyIndex].id ?? 0;
          print(
              "facility selected $selectedTrainingAgencyId, $selectedTrainingAgencyName");
        }
        break;
      case const (RxList<StatusModel>):
        {
          int modeIndex = mode.indexWhere((x) => x.name == value);
          selectedModeName.value = mode[modeIndex].name;
          selectedModeId.value = mode[modeIndex].id ?? 0;
          isModeSelected.value = true;
          print("facility selected $selectedModeId, $selectedModeName");
        }
        break;
      // case RxList<EmployeeListModel>:
      //   {
      //     int modeIndex = employeeNameList.indexWhere((x) => x?.name == value);
      //     selectedEmployeeNamesList.value =
      //         employeeNameList[modeIndex]?.name ?? "";
      //     selectedId.value = employeeNameList[modeIndex]?.id ?? 0;
      //     print("facility selected $selectedModeId, $selectedModeName");
      //   }
      //   break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
