import 'package:cmms/app/edit_mrs/edit_mrs_controller.dart';
import 'package:cmms/app/edit_mrs/edit_mrs_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/edit_mrs_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class EditMrsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditMrsController(
        Get.put(
          EditMrsPresenter(
            EditMrsUsecase(
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
