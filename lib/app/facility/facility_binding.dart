import 'package:cmms/app/facility/facility_controller.dart';
import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/domain/usecases/facility_usecase.dart';
import 'package:get/get.dart';

class FacilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FacilityController>(
      () => FacilityController(
        FacilityPresenter(
          FacilityUsecase(
            Get.find(),
          ),
        ),
      ),
    );
  }
}
