import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/inventory_list/inventory_list_controller.dart';
import 'package:cmms/app/inventory_list/inventory_list_presenter.dart';
import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_controller.dart';
import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/inventory_list_usecase.dart';
import 'package:cmms/domain/usecases/warranty_certificates_list_usecase.dart';
import 'package:get/get.dart';

class WarrantyCertificatesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WarrantyCertificatesListController(
        Get.put(
          WarrantyCertificatesListPresenter(
            WarrantyCertificatesListUsecase(
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
