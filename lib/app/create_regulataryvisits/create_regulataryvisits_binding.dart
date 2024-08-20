

import 'package:cmms/app/create_regulataryvisits/create_regulataryvisits_controller.dart';
import 'package:cmms/app/create_regulataryvisits/create_regulataryvisits_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/create_regulataryvisits_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class RegulataryVisitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateRegulataryVisitsController>(
      () => CreateRegulataryVisitsController(
        CreateRegulataryVisitsPresenter(
          CreateRegulataryVisitsUsecase(
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
