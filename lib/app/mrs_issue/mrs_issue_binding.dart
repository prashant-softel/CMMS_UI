import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/mrs_issue/mrs_issue_controller.dart';
import 'package:cmms/app/mrs_issue/mrs_issue_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/mrs_issue_usecase.dart';
import 'package:get/get.dart';

class MrsIssueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MrsIssueController(
        Get.put(
          MrsIssuePresenter(
            MrsIssueUsecase(
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
