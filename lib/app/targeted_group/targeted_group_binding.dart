
import 'package:cmms/app/targeted_group/targeted_group_controller.dart';
import 'package:cmms/app/targeted_group/targeted_group_presenter.dart';
import 'package:cmms/domain/usecases/targeted_group_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class TargetedGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TargetedGroupController(
        Get.put(
          TargetedGroupPresenter(
            TargetedGroupUsecase(
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

