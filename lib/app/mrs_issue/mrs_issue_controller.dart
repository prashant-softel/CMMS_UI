import 'package:cmms/app/mrs_issue/mrs_issue_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class MrsIssueController extends GetxController {
  ///
  MrsIssueController(
    this.mrsIssuePresenter,
  );
  MrsIssuePresenter mrsIssuePresenter;
  final HomeController homecontroller = Get.find();

  ///
  @override
  void onInit() async {
    super.onInit();
  }
}
