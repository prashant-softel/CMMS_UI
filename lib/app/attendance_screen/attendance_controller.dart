import 'dart:async';

import 'package:cmms/app/attendance_screen/attendance_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/attendance_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
      dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());

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
    final _employeeList = await attendancePresenter.getEmployeeListByFacilityId(
      facilityId: facilityId,
    );
    if (_employeeList != null) {
      employeeList.value = _employeeList;
      attendanceModel.value = List.generate(
        employeeList.length,
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
      attendanceModel[i].inTime = "";
      attendanceModel[i].outTime = "";
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
    attendanceModel[index].inTime = value;
    inTimeControllers[index].text = value;
  }

  void updateOutTime(int index, String value) {
    attendanceModel[index].outTime = value;
    outTimeControllers[index].text = value;
  }

  Future<bool> addAttendance() async {
    int _lessThan35 = 0;
    int _between35To50 = 0;
    int _greaterThan50 = 0;
    if (lessThan35.text != "") {
      _lessThan35 = int.parse(lessThan35.text);
    }
    if (between35To50.text != "") {
      _between35To50 = int.parse(between35To50.text);
    }
    if (greaterThan50.text != "") {
      _greaterThan50 = int.parse(greaterThan50.text);
    }
    String _purpose = purposeCtrl.text;
    ContractLabourAttendance contractAttendace = ContractLabourAttendance(
      lessThan35: _lessThan35,
      between35to50: _between35To50,
      greaterThan50: _greaterThan50,
      purpose: _purpose,
    );

    employeeAttendance = AttendaceModel(
      date: dateController.text,
      facilityId: facilityId.value,
      hfeAttendance: attendanceModel,
      contractAttendance: contractAttendace,
    );

    final jsonEmployeeAttendance = employeeAttendance.toJson();
    final _attendance = await attendancePresenter.addAttendance(
      jsonEmployeeAttendance: jsonEmployeeAttendance,
      isLoading: isLoading,
    );
    if (_attendance) {
      clearData();
    }
    isLoading = false;
    return true;
  }
}
