import 'package:cmms/app/execute_course/execute_course_controller.dart';
import 'package:cmms/app/execute_course/execute_course_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/execute_course_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class ExecuteCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExecuteCourseController>(
      () => ExecuteCourseController(
        ExecuteCoursePresenter(
          ExecuteCourseUsecase(
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
