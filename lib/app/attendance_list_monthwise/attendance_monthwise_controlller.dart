import 'dart:async';
import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/attendance_month_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';

class AttendanceListMonthController extends GetxController {
  AttendanceListMonthController(this.attendanceListMonthPresenter);
  AttendanceListMonthPresenter attendanceListMonthPresenter;

  RxBool openFromDateToStartDatePicker = false.obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 70)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);
  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;
  RxInt facilityId = 0.obs;
  final HomeController controller = Get.find();
  RxBool isLoading = true.obs;
  List<String> sortedDates = [];

  Rx<AttendanceMonthModel> attendanceMonthModel = AttendanceMonthModel().obs;
  // Rx<AttendanceMonthModel> attendanceMonthModel = AttendanceMonthModel(
  //   facility_id: 1,
  //   facility_name: "Bellary",
  //   attendance: [
  //     Employee(
  //       employeeId: 1,
  //       employeeName: "HFEAdmin",
  //       dateOfJoining: "2012-02-20T00:00:00",
  //       dateOfExit: "0001-01-01T00:00:00",
  //       workingStatus: "Inactive",
  //       details: [
  //         Details(
  //           date: "2024-06-24T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-26T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-27T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //       ],
  //     ),
  //     Employee(
  //       employeeId: 12,
  //       employeeName: "PradeepTholety",
  //       dateOfJoining: "2022-03-22T00:00:00",
  //       dateOfExit: "0001-01-01T00:00:00",
  //       workingStatus: "Inactive",
  //       details: [
  //         Details(
  //           date: "2024-06-24T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-26T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-27T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //       ],
  //     ),
  //     Employee(
  //       employeeId: 48,
  //       employeeName: "ShivaKumar",
  //       dateOfJoining: "2017-10-20T00:00:00",
  //       dateOfExit: "0001-01-01T00:00:00",
  //       workingStatus: "Inactive",
  //       details: [
  //         Details(
  //           date: "2024-06-24T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-26T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-27T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //       ],
  //     ),
  //     Employee(
  //       employeeId: 50,
  //       employeeName: "GuruKumar",
  //       dateOfJoining: "2017-10-20T00:00:00",
  //       dateOfExit: "0001-01-01T00:00:00",
  //       workingStatus: "Inactive",
  //       details: [
  //         Details(
  //           date: "2024-06-24T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-26T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-27T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //       ],
  //     ),
  //     Employee(
  //       employeeId: 57,
  //       employeeName: "NareshD",
  //       dateOfJoining: "2019-08-01T00:00:00",
  //       dateOfExit: "0001-01-01T00:00:00",
  //       workingStatus: "Inactive",
  //       details: [
  //         Details(
  //           date: "2024-06-24T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-26T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-27T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //       ],
  //     ),
  //     Employee(
  //       employeeId: 77,
  //       employeeName: "madhubansahani",
  //       dateOfJoining: "2024-04-15T00:00:00",
  //       dateOfExit: "0001-01-01T00:00:00",
  //       workingStatus: "Inactive",
  //       details: [
  //         Details(
  //           date: "2024-06-24T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-26T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //         Details(
  //           date: "2024-06-27T00:00:00",
  //           status: "P",
  //           inTime: "10:00 AM",
  //           outTime: "6:00 PM",
  //         ),
  //       ],
  //     ),
  //   ],
  // ).obs;

  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription =
          await controller.facilityId$.listen((event) async {
        facilityId.value = 1;
        if (facilityId != 0) {
          await getAttendanceListMonthwise();
        }
      });
      super.onInit();
    } catch (e) {
      print("error $e");
    }
  }

  Future<void> getAttendanceListMonthwise() async {
    try {
      final _attendanceDetails =
          await attendanceListMonthPresenter.getAttendanceListMonthwise(
        facilityId: facilityId.value,
        isLoading: isLoading.value,
      );
      if (_attendanceDetails != null) {
        attendanceMonthModel.value = _attendanceDetails;
        // print("${jsonEncode(attendanceMonthModel.value.toJson())}");
      }
      List<String> uniqueDates = [];
      attendanceMonthModel.value.attendance?.forEach((employee) {
        print('Processing employee: ${employee.employeeName}');
        employee.details?.forEach((data) {
          if (data.date != null && data.date!.isNotEmpty) {
            uniqueDates.add(data.date!);
          }
        });
      });
      sortedDates = uniqueDates.toSet().toList();
      update(["attendance-list-month"]);
    } catch (e) {
      print('Error in getAttendanceListMonthwise: $e');
    }
  }
}
