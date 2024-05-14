import 'package:cmms/app/view_course/view_course_controller.dart';
import 'package:cmms/app/view_course/view_course_presenter.dart';
import 'package:cmms/domain/usecases/view_course_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ViewCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewCourseController>(
      () => ViewCourseController(
        ViewCoursePresenter(
          ViewCourseUsecase(
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
