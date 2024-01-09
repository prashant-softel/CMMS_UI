import 'package:cmms/app/dsm_charges/dsm_charges_controller.dart';
import 'package:cmms/app/dsm_charges/dsm_charges_presenter.dart';
import 'package:cmms/domain/usecases/dsm_charges_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class DsmChargesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DsmChargesListController>(
      () => DsmChargesListController(
        DsmChargesListPresenter(
          DsmChargesListUsecase(
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
