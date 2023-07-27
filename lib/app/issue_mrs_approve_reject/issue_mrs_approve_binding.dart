import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/issue_mrs_approve_reject/issue_mrs_approve_controller.dart';
import 'package:cmms/app/issue_mrs_approve_reject/issue_mrs_approve_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/issue_mrs_approve_usecase.dart';

class IssueMrsApproveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => IssueMrsApproveController(
        Get.put(
          IssueMrsApprovePresenter(
            IssueMrsApproveUsecase(
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
