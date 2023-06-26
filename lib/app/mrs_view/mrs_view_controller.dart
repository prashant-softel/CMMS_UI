import 'package:cmms/app/mrs_view/mrs_view_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class MrsViewController extends GetxController {
  ///
  MrsViewController(
    this.mrsViewPresenter,
  );
  MrsViewPresenter mrsViewPresenter;
  final HomeController homecontroller = Get.find();

  ///
  @override
  void onInit() async {
    super.onInit();
  }
}
