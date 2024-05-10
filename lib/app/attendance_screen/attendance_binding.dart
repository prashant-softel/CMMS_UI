import 'package:cmms/app/attendance_screen/attendance_controller.dart';
import 'package:cmms/app/attendance_screen/attendance_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/attendance_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AttendanceController(Get.put(
        AttendancePresenter(
          AttendanceUsecase(
            Get.find(),
          ),
        ),
      )),
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
