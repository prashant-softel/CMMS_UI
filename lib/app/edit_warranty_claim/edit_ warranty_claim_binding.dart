
import 'package:cmms/app/edit_warranty_claim/edit_warranty_claim_controller.dart';
import 'package:cmms/app/edit_warranty_claim/edit_warranty_claim_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/edit_warranty_claim_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';


class EditWarrantyClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditWarrantyClaimController(
        Get.put(
          EditWarrantyClaimPresenter(
            EditWarrantyClaimUsecase(
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
    //  Get.lazyPut(
    //   () => EditWarrantyClaimController(
    //     Get.put(
    //       EditWarrantyClaimPresenter(
    //         EditWarrantyClaimUsecase(
    //           Get.find(),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    
  }
}
