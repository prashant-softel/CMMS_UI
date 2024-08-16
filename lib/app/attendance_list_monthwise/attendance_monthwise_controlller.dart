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
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 30)).obs;
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
  RxList<Employee> attendance = <Employee>[].obs;

  Rx<AttendanceMonthModel> attendanceMonthModel = AttendanceMonthModel().obs;

  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription =
          await controller.facilityId$.listen((event) async {
        facilityId.value = event;
        if (facilityId != 0) {
          await getAttendanceListMonthwise(
            start_date: formattedFromdate,
            end_date: formattedTodate,
          );
        }
      });
      super.onInit();
    } catch (e) {
      print("error $e");
    }
  }

  Future<void> getAttendanceListMonthwise({
    String? start_date,
    String? end_date,
  }) async {
    try {
      final _attendanceDetails =
          await attendanceListMonthPresenter.getAttendanceListMonthwise(
        facilityId: facilityId.value,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading.value,
      );
      if (_attendanceDetails != null) {
        attendanceMonthModel.value = _attendanceDetails;
        attendance.value = attendanceMonthModel.value.attendance ?? [];
        // print("${jsonEncode(attendanceMonthModel.value.toJson())}");
      }
      isLoading.value = false;
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
      DateFormat inputFormat = DateFormat('dd-MM-yyyy');
      sortedDates
          .sort((a, b) => inputFormat.parse(a).compareTo(inputFormat.parse(b)));
      update(["attendance-list-month"]);
    } catch (e) {
      print('Error in getAttendanceListMonthwise: $e');
    }
  }

  void getAttendanceListByDate() {
    getAttendanceListMonthwise(
      start_date: formattedFromdate,
      end_date: formattedTodate,
    );
  }
}
