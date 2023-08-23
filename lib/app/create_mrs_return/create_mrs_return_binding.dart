import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/create_mrs_return/create_mrs_return_controller.dart';
import 'package:cmms/app/create_mrs_return/create_mrs_return_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/create_mrs_return_usecase.dart';
import 'package:get/get.dart';

class CreateMrsReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CreateMrsReturnController(
        Get.put(
          CreateMrsReturnPresenter(
            CreateMrsReturnUsecase(
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
