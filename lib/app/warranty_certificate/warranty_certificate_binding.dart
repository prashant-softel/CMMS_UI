import 'package:cmms/app/warranty_certificate/warranty_certificate_controller.dart';
import 'package:cmms/app/warranty_certificate/warranty_certificate_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/warranty_certificate_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class WarrantyCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WarrantyCertificateController(
        Get.put(
          WarrantyCertificatePresenter(
            WarrantyCertificateUsecase(
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
