import 'package:cmms/app/Course_Category/course_category_controller.dart';
import 'package:cmms/app/course_category/course_category_presenter.dart';
import 'package:cmms/domain/usecases/course_category_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class CourseCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CourseCategoryController(
        Get.put(
          CourseCategoryPresenter(
            CourseCategoryUsecase(
              Get.find(),
            ),
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
