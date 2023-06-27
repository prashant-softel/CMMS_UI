
import 'package:cmms/app/edit_warranty_claim/edit_warranty_claim_controller.dart';
import 'package:cmms/app/edit_warranty_claim/edit_warranty_claim_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/view_permit/view_permit_presenter.dart';
import 'package:cmms/domain/usecases/edit_warranty_claim_usecase.dart';
import 'package:cmms/domain/usecases/view_permit_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/job_list_usecase.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit/new_permit_presenter.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/preventive_list_usecase.dart';

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
