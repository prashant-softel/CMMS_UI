import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_warranty_claim/view_warranty_claim_controller.dart';
import 'package:cmms/app/view_warranty_claim/view_warranty_claim_presenter.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_presenter.dart';
import 'package:cmms/domain/usecases/view_warranty_claim_usecase.dart';
import 'package:cmms/domain/usecases/warranty_claim_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class ViewWarrantyClaimBinding extends Bindings {
  @override
  void dependencies() {
      // Get.find<WarrantyClaimController>();
    Get.lazyPut(
      () => ViewWarrantyClaimController(
        Get.put(
          ViewWarrantyClaimPresenter(
            ViewWarrantyClaimUsecase(
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
