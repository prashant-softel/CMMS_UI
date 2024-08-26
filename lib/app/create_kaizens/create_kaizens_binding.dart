

import 'package:cmms/app/create_kaizens/create_kaizens_controller.dart';
import 'package:cmms/app/create_kaizens/create_kaizens_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/create_kaizens_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class KaizensBinding extends Bindings {
  @override
  void dependencies() {
    // Binding CreateKaizensDataController
    Get.lazyPut<CreateKaizensDataController>(
      () => CreateKaizensDataController(
        CreateKaizensdataPresenter(
          CreateKaizensdataUsecase(
            Get.find(), // Ensure this is properly registered in the dependency tree
          ),
        ),
      ),
    );

    // Binding HomeController
    Get.lazyPut<HomeController>(
      () => HomeController(
        HomePresenter(
          HomeUsecase(
            Get.find(), // Ensure this is properly registered in the dependency tree
          ),
        ),
      ),
    );
  }
}
