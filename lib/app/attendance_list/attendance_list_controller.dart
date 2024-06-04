import 'package:cmms/app/attendance_list/attendance_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:get/get.dart';

class AttendanceListController extends GetxController {
  AttendanceListController(this.attendanceListPresenter);
  AttendanceListPresenter attendanceListPresenter;

  addAttendance() {
    Get.toNamed(Routes.attendanceScreen);
  }
}
