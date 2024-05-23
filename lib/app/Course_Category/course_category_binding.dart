import 'package:cmms/app/schedule_course/schedule_course_controller.dart';
import 'package:cmms/app/schedule_course/schedule_course_presenter.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(
        SchedulePresenter(
          CourseUsecase(
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
