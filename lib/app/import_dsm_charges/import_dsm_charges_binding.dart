import 'package:cmms/app/import_dsm_charges/import_dsm_charges_controller.dart';
import 'package:cmms/app/import_dsm_charges/import_dsm_charges_presenter.dart';
import 'package:cmms/domain/usecases/import_dsm_charges_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ImportDsmChargesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportDsmChargesController>(
      () => ImportDsmChargesController(
        ImportDsmChargesPresenter(
          ImportDsmChargesUsecase(
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
