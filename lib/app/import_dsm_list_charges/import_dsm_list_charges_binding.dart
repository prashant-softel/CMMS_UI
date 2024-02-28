import 'package:cmms/app/import_dsm_list_charges/import_dsm_list_charges_controller.dart';
import 'package:cmms/app/import_dsm_list_charges/import_dsm_list_charges_presenter.dart';
import 'package:cmms/domain/usecases/import_dsm_list_charges_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ImportDsmListChargesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportDsmListChargesListController>(
      () => ImportDsmListChargesListController(
        ImportDsmListChargesListPresenter(
          ImportDsmListChargesListUsecase(
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
