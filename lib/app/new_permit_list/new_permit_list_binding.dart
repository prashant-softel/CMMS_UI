
import 'package:cmms/domain/usecases/new_permit_list_usecase.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_presenter.dart';
import 'package:get/get.dart';

// import '../../domain/usecases/job_list_usecase.dart';

class NewPermitListBinding extends Bindings {
  @override
  void dependencies() {
    //Get.find<JobListController>();
    Get.lazyPut<NewPermitListController>(
      () => NewPermitListController(
        Get.put(
          NewPermitListPresenter(
            NewPermitListUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
