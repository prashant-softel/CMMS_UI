import 'package:cmms/app/material_category/material_category_controller.dart';
import 'package:cmms/app/material_category/material_category_presenter.dart';
import 'package:cmms/domain/usecases/material_category_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class MAterialCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MaterialCategoryController(
        Get.put(
          MaterialCategoryPresenter(
            MaterialCategoryUsecase(
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
