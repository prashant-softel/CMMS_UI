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
  Rx<int> updateSubmit = 0.obs;

  TextEditingController dateController = TextEditingController();
  List<TextEditingController> inTimeControllers = [];
  List<TextEditingController> outTimeControllers = [];
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<EmployeeModel?> employeeList = <EmployeeModel>[].obs;
  AttendaceModel employeeAttendance = AttendaceModel();
  ContractLabourAttendance contractAttendace = ContractLabourAttendance();
  RxList<HFEEmployeeAttendance?> attendanceModel =
      <HFEEmployeeAttendance>[].obs;
  TextEditingController lessThan35 = TextEditingController();
  TextEditingController between35To50 = TextEditingController();
  TextEditingController greaterThan50 = TextEditingController();
  TextEditingController purposeCtrl = TextEditingController();
  DateTime currentDate = DateTime.now();
  FocusNode focusPurpose = FocusNode();
  ScrollController scrollPurpose = ScrollController();
  bool isLoading = true;
  Rx<AttendaceModel?>? getAttendanceDetails = Rx<AttendaceModel?>(null);

  @override
  void onInit() async {
    try {
      await setId();
      facilityIdStreamSubscription = homeController.facilityId$.listen(
        (event) async {
          facilityId.value = event;
          if (facilityId.value != 0) {
            await getAttendanceData(date: dateController.text);
          }
        },
      );
      focusPurpose.addListener(() {
        if (!focusPurpose.hasFocus) {
          scrollPurpose.jumpTo(0.0);
        }
      });
      super.onInit();
    } catch (e) {
      print("error: $e");
    }
  }

  Future<void> setId() async {
    try {
      String? _date = await attendancePresenter.getDate();
      if (_date == null || _date == "" || _date == "null") {
        var dataFromPreviousScreen = Get.arguments;
        dateController.text = dataFromPreviousScreen['date'];
        currentDate = DateTime.parse(dateController.text);
        attendancePresenter.saveDate(date: dateController.text);
      } else {
        dateController.text = _date;
        currentDate = DateTime.parse(dateController.text);
      }
    } catch (e) {
      print("Attendance Date Exception: $e");
    }
  }

  void clearStoreData() {
    attendancePresenter.clearDateValue();
  }

  Future<void> getAttendanceData({required String date}) async {
    try {
      final _attendanceDetails = await attendancePresenter.getAttendanceDetail(
        facilityId: facilityId.value,
        date: date,
        isLoading: isLoading,
      );

      if (_attendanceDetails != null &&
          (_attendanceDetails.hfeAttendance?.isNotEmpty ??
              false || _attendanceDetails.contractAttendance != null)) {
        getAttendanceDetails?.value = _attendanceDetails;

        // Set values for contract attendance
        final contractAttendance =
            getAttendanceDetails?.value?.contractAttendance;
        lessThan35.text = contractAttendance?.lessThan35?.toString() ?? '';
        between35To50.text =
            contractAttendance?.between35to50?.toString() ?? '';
        greaterThan50.text =
            contractAttendance?.greaterThan50?.toString() ?? '';
        purposeCtrl.text = contractAttendance?.purpose ?? '';

        // Ensure Attendence_Id is set properly
        attendanceModel.value = List<HFEEmployeeAttendance>.generate(
          getAttendanceDetails!.value!.hfeAttendance!.length,
          (index) {
            var hfe = getAttendanceDetails!.value!.hfeAttendance![index];
            return HFEEmployeeAttendance(
              Attendence_Id: hfe?.Attendence_Id, // Capture Attendence_Id here
              id: hfe?.id,
              name: hfe?.name,
              present: hfe!.present,
              inTime: hfe.inTime,
              outTime: hfe.outTime,
            );
          },
        );

        // Initialize in/out time controllers for each employee
        inTimeControllers = List.generate(
          attendanceModel.length,
          (index) => TextEditingController(),
        );
        outTimeControllers = List.generate(
          attendanceModel.length,
          (index) => TextEditingController(),
        );

        // Set inTime and outTime for each employee
        for (int i = 0; i < attendanceModel.length; i++) {
          inTimeControllers[i].text = attendanceModel[i]?.inTime ?? "";
          outTimeControllers[i].text = attendanceModel[i]?.outTime ?? "";
        }
        updateSubmit.value = 1;
      } else {
        updateSubmit.value = 0;
        await getEmployeeList(facilityId.value);
      }
    } catch (e) {
      print('Error in getAttendanceData: $e');
    }
  }

  Future<void> getEmployeeList(int facilityId) async {
    final _employeeList = await attendancePresenter.getEmployeeListByFacilityId(
      facilityId: facilityId,
    );
    if (_employeeList != null) {
      employeeList.value = _employeeList;
      attendanceModel.value = List<HFEEmployeeAttendance>.generate(
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
      attendanceModel[i]?.present.value = false;
      attendanceModel[i]?.inTime = "";
      attendanceModel[i]?.outTime = "";
    }
    lessThan35.clear();
    between35To50.clear();
    greaterThan50.clear();
    purposeCtrl.clear();
  }

  void isPresent(int index) {
    attendanceModel[index]?.present.value =
        !attendanceModel[index]!.present.value;
    if (attendanceModel[index]?.present.value == true) {
      attendanceModel[index]?.inTime = "10:00 AM";
      inTimeControllers[index].text = "10:00 AM";
      attendanceModel[index]?.outTime = "6:00 PM";
      outTimeControllers[index].text = "6:00 PM";
    } else {
      attendanceModel[index]?.inTime = "";
      inTimeControllers[index].clear();
      attendanceModel[index]?.outTime = "";
      outTimeControllers[index].clear();
    }
    update();
  }

  void updateInTime(int index, String value) {
    attendanceModel[index]?.inTime = value;
    inTimeControllers[index].text = value;
  }

  void updateOutTime(int index, String value) {
    attendanceModel[index]?.outTime = value;
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
      Id: 0,
      lessThan35: _lessThan35,
      between35to50: _between35To50,
      greaterThan50: _greaterThan50,
      purpose: _purpose,
    );

    // Ensure that Attendence_Id is set to 0 for adding new records
    List<HFEEmployeeAttendance> newAttendanceModel = attendanceModel.map((hfe) {
      return HFEEmployeeAttendance(
        Attendence_Id: 0, // Include Attendence_Id here
        id: hfe?.id,
        name: hfe?.name,
        present: hfe!.present,
        inTime: hfe.inTime,
        outTime: hfe.outTime,
      );
    }).toList();

    employeeAttendance = AttendaceModel(
      date: dateController.text,
      facilityId: facilityId.value,
      hfeAttendance: newAttendanceModel,
      contractAttendance: contractAttendace,
    );

    final jsonEmployeeAttendance = employeeAttendance.toJson();
    final _attendance = await attendancePresenter.addAttendance(
      jsonEmployeeAttendance: jsonEmployeeAttendance,
      isLoading: isLoading,
    );

    if (_attendance) {
      // clearData();
    }

    isLoading = false;
    return true;
  }

  Future<bool> updateAttendance() async {
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

    // Set contract attendance details
    ContractLabourAttendance contractAttendace = ContractLabourAttendance(
      Id: 0,
      lessThan35: _lessThan35,
      between35to50: _between35To50,
      greaterThan50: _greaterThan50,
      purpose: _purpose,
    );

    // Ensure Attendence_Id is included in each HFEEmployeeAttendance object
    List<HFEEmployeeAttendance> updatedAttendanceModel =
        attendanceModel.map((hfe) {
      return HFEEmployeeAttendance(
        Attendence_Id:
            hfe?.Attendence_Id, // Use the Attendence_Id from the model
        id: hfe?.id,
        name: hfe?.name,
        present: hfe!.present,
        inTime: hfe.inTime,
        outTime: hfe.outTime,
      );
    }).toList();

    // Create the attendance model with all the data
    employeeAttendance = AttendaceModel(
      date: dateController.text,
      facilityId: facilityId.value,
      hfeAttendance: updatedAttendanceModel,
      contractAttendance: contractAttendace,
    );

    // Convert to JSON and send to the presenter for updating
    final jsonEmployeeAttendance = employeeAttendance.toJson();
    final _attendance = await attendancePresenter.updateAttendance(
      jsonEmployeeAttendance: jsonEmployeeAttendance,
      isLoading: isLoading,
    );

    if (_attendance) {
      // Optionally clear data after successful update
      // clearData();
    }

    isLoading = false;
    return true;
  }
}
