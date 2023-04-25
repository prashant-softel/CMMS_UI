import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/job_list_usecase.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit/new_permit_presenter.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/preventive_list_usecase.dart';

class NewPermitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NewPermitController(
        Get.put(
          NewPermitPresenter(
            NewPermitUsecase(
              Get.find(),
            ),
          ),
        ),
         JobListPresenter(
          JobListUsecase(
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
