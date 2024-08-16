import 'package:cmms/app/app.dart';
import 'package:cmms/app/careate_warranty_calim/create_warranty_claim_controller.dart';
import 'package:cmms/app/careate_warranty_calim/create_warranty_claim_presenter.dart';
import 'package:cmms/domain/usecases/warranty_claim_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';

class CreateWarrantyClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateWarrantyClaimController>(
      () => CreateWarrantyClaimController(
        CreateWarrantyClaimPresenter(
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
