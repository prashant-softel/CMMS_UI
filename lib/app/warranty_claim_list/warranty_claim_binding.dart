import 'package:cmms/app/app.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_presenter.dart';
import 'package:cmms/domain/usecases/warranty_claim_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

class WarrantyClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarrantyClaimController>(
      () => WarrantyClaimController(
        WarrantyClaimPresenter(
          WarrantyClaimUsecase(
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
