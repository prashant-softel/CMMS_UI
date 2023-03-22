import 'package:cmms/app/preventive_check_point/preventive_check_point_controller.dart';
import 'package:cmms/app/preventive_check_point/preventive_check_point_presenter.dart';
import 'package:cmms/app/preventive_maintanance/preventive_maintenance_controller.dart';
import 'package:cmms/domain/usecases/preventive_checkpoint_usecase.dart';
import 'package:get/get.dart';

class PreventiveCheckPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<PreventiveController>();

    Get.lazyPut(
      () => PreventiveCheckPointController(
        Get.put(
          PreventiveCheckPointPresenter(
            PreventiveCheckPointUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
