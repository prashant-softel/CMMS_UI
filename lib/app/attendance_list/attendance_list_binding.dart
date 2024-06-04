import 'package:cmms/app/attendance_list/attendance_list_controller.dart';
import 'package:cmms/app/attendance_list/attendance_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/attendance_list_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class AttendanceListBinding extends Bindings {
  AttendanceListBinding();

  @override
  void dependencies() {
    Get.lazyPut(
      () => AttendanceListController(Get.put(
        AttendanceListPresenter(
          AttendanceListUsecase(
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
