import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_controlller.dart';
import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/attendance_monthwise_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class AttendanceListMonthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceListMonthController>(
      () => AttendanceListMonthController(
        AttendanceListMonthPresenter(
          AttendanceListMonthUsecase(
            Get.find(),
          ),
        ),
      ),
    );
    Get.lazyPut(
      () => HomeController(
        Get.put(
          HomePresenter(
            HomeUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}