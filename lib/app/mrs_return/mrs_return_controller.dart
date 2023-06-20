import 'package:cmms/app/mrs_return/mrs_return_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class MrsReturnController extends GetxController {
  ///
  MrsReturnController(
    this.mrsReturnPresenter,
  );
  MrsReturnPresenter mrsReturnPresenter;
  final HomeController homecontroller = Get.find();

  ///
  @override
  void onInit() async {
    super.onInit();
  }
}
