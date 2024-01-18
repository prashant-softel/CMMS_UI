import 'package:cmms/app/add_training_course/add_course_controller.dart';
import 'package:cmms/app/add_training_course/add_course_presenter.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class AddCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCourseController>(
      () => AddCourseController(
        AddCoursePresenter(
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