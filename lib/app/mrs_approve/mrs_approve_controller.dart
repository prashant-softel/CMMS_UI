import 'package:cmms/app/mrs_approve/mrs_approve_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class MrsApproveController extends GetxController {
  ///
  MrsApproveController(
    this.mrsApprovePresenter,
  );
  MrsApprovePresenter mrsApprovePresenter;
  final HomeController homecontroller = Get.find();

  ///
  @override
  void onInit() async {
    super.onInit();
  }
}
