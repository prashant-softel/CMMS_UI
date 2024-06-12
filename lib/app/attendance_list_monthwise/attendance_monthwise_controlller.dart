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

  bool openFromDateToStartDatePicker = false;
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

  Rx<AttendanceMonthModel> attendanceMonthModel = AttendanceMonthModel(
    facility_id: 1,
    facility_name: "Bellary",
    attendance: [
      Employee(
        employeeId: 10,
        employeeName: "Blake Snyder",
        dateOfJoining: "2015-10-02",
        dateOfExit: null,
        workingStatus: "Active",
        details: [
          Details(
            date: "01-10-2023",
            status: "P",
            inTime: "1:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "02-10-2023",
            status: "P",
            inTime: "2:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "03-10-2023",
            status: "P",
            inTime: "3:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "04-10-2023",
            status: "P",
            inTime: "4:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "05-10-2023",
            status: "P",
            inTime: "5:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "06-10-2023",
            status: "P",
            inTime: "6:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "07-10-2023",
            status: "P",
            inTime: "7:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "08-10-2023",
            status: "P",
            inTime: "8:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "09-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "10-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "11-10-2023",
            status: "P",
            inTime: "6:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "12-10-2023",
            status: "P",
            inTime: "7:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "13-10-2023",
            status: "P",
            inTime: "8:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "14-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "15-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
        ],
      ),
      Employee(
        employeeId: 12,
        employeeName: "Russell Norton",
        dateOfJoining: "2015-10-02",
        dateOfExit: null,
        workingStatus: "Active",
        details: [
          Details(
            date: "01-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "02-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "03-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "04-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "05-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "06-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "07-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "08-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "09-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "10-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "11-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "12-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "13-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "14-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "15-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
        ],
      ),
      Employee(
        employeeId: 97,
        employeeName: "Eleanor Lyons",
        dateOfJoining: "2015-10-02",
        dateOfExit: "2020-06-30",
        workingStatus: "Inactive",
        details: [
          Details(
            date: "01-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "02-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "03-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "04-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "05-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "06-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "07-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "08-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "09-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "10-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "11-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "12-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "13-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "14-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "15-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
        ],
      ),
      Employee(
        employeeId: 102,
        employeeName: "Sophie Lynch",
        dateOfJoining: "2015-10-02",
        dateOfExit: "2020-06-30",
        workingStatus: "Inactive",
        details: [
          Details(
            date: "01-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "02-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "03-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "04-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "05-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "06-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "07-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "08-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "09-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "10-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "11-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "12-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "13-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "14-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "15-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
        ],
      ),
      Employee(
        employeeId: 97,
        employeeName: "Ruby Farmer",
        dateOfJoining: "2015-10-02",
        dateOfExit: "2020-06-30",
        workingStatus: "Inactive",
        details: [
          Details(
            date: "01-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "02-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "03-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "04-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "05-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "06-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "07-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "08-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "09-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "10-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "11-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "12-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "13-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "14-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
          Details(
            date: "15-10-2023",
            status: "P",
            inTime: "10:00 AM",
            outTime: "6:00 PM",
          ),
        ],
      ),
    ],
  ).obs;

  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription = controller.facilityId$.listen((event) {
        facilityId.value = event;
      });
      super.onInit();
    } catch (e) {
      print("error $e");
    }
  }
}
