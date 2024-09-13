import 'package:cmms/app/app.dart';
import 'package:cmms/app/wc_certificates_list/wc_certificates_list_controller.dart';
import 'package:cmms/app/wc_certificates_list/wc_certificates_list_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/wc_certificate_list_usecase.dart';

import 'package:get/get.dart';

class WcCertificatesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WcCertificatesListController(
        Get.put(
          WcCertificatesListPresenter(
            WcCertificatesListUsecase(
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
