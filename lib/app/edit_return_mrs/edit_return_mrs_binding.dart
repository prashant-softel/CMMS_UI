import 'package:cmms/app/edit_return_mrs/edit_return_mrs_controller.dart';
import 'package:cmms/app/edit_return_mrs/edit_return_mrs_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/edit_return_mrs_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class EditMrsReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditMrsReturnController(
        Get.put(
          EditMrsReturnPresenter(
            EditMrsReturnUsecase(
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
