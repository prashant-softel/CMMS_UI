import 'dart:async';

import 'package:cmms/app/attendance_screen/attendance_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/attendance_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceController extends GetxController {
  AttendanceController(this.attendancePresenter);
  HomeController homeController = Get.find();
  AttendancePresenter attendancePresenter;

  Rx<int> facilityId = 0.obs;
  TextEditingController dateController = TextEditingController();
  List<TextEditingController> inTimeControllers = [];
  List<TextEditingController> outTimeControllers = [];
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<EmployeeModel?> employeeList = <EmployeeModel>[].obs;
  AttendaceModel employeeAttendance = AttendaceModel();
  ContractLabourAttendance contractAttendace = ContractLabourAttendance();
  RxList<HFEEmployeeAttendance> attendanceModel = <HFEEmployeeAttendance>[].obs;
  TextEditingController lessThan35 = TextEditingController();
  TextEditingController between35To50 = TextEditingController();
  TextEditingController greaterThan50 = TextEditingController();
  TextEditingController purposeCtrl = TextEditingController();
  FocusNode focusPurpose = FocusNode();
  ScrollController scrollPurpose = ScrollController();
  bool isLoading = true;

  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription = homeController.facilityId$.listen(
        (event) async {
          facilityId.value = event;
          await getEmployeeList(facilityId.value);
        },
      );

      focusPurpose.addListener(() {
        if (!focusPurpose.hasFocus) {
          scrollPurpose.jumpTo(0.0);
        }
      });

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getEmployeeList(int facilityId) async {
    final _employeeList = await attendancePresenter.getAssignedToList(
      facilityId: facilityId,
    );
    if (_employeeList != null) {
      employeeList.value = _employeeList;
      attendanceModel.value = List.generate(
        // employeeList.length,
        2,
        (index) => HFEEmployeeAttendance(
          id: employeeList[index]?.id,
          name: employeeList[index]?.name,
          present: false.obs,
          inTime: null,
          outTime: null,
        ),
      );
      inTimeControllers = List.generate(
        employeeList.length,
        (index) => TextEditingController(),
      );
      outTimeControllers = List.generate(
        employeeList.length,
        (index) => TextEditingController(),
      );
    }
  }

  void clearData() {
    dateController.clear();
    for (int i = 0; i < inTimeControllers.length; i++) {
      inTimeControllers[i].clear();
    }
    for (int i = 0; i < outTimeControllers.length; i++) {
      outTimeControllers[i].clear();
    }
    for (int i = 0; i < attendanceModel.length; i++) {
      attendanceModel[i].present.value = false;
      attendanceModel[i].inTime = null;
      attendanceModel[i].outTime = null;
    }
    lessThan35.clear();
    between35To50.clear();
    greaterThan50.clear();
    purposeCtrl.clear();
  }

  void isPresent(int index) {
    attendanceModel[index].present.value =
        !attendanceModel[index].present.value;
    update();
  }

  void updateInTime(int index, String value) {
    if (attendanceModel[index].inTime == null) {
      attendanceModel[index].inTime = value;
      inTimeControllers[index].text = value;
    }
  }

  void updateOutTime(int index, String value) {
    if (attendanceModel[index].outTime == null) {
      attendanceModel[index].outTime = value;
      outTimeControllers[index].text = value;
    }
  }

  Future<bool> addAttendance() async {
    int _lessThan35 = int.parse(lessThan35.text);
    int _between35To50 = int.parse(between35To50.text);
    int _greaterThan50 = int.parse(greaterThan50.text);
    String _purpose = purposeCtrl.text;
    ContractLabourAttendance contractAttendace = ContractLabourAttendance(
      lessThan35: _lessThan35,
      between35to50: _between35To50,
      greaterThan50: _greaterThan50,
      purpose: _purpose,
    );

    employeeAttendance = AttendaceModel(
      date: dateController.text,
      hfeAttendance: attendanceModel,
      contractAttendance: contractAttendace,
    );

    final jsonEmployeeAttendance = employeeAttendance.toJson();

    final _attendance = await attendancePresenter.addAttendance(
      jsonEmployeeAttendance: jsonEmployeeAttendance,
      isLoading: isLoading,
    );
    isLoading = false;
    if (_attendance != null) {
      // Get.back();
      return true;
    } else {
      return false;
    }
  }
}
