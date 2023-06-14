import 'package:cmms/app/mrs/mrs_list_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class MrsListController extends GetxController {
  ///
  MrsListController(
    this.mrsListPresenter,
  );
  MrsListPresenter mrsListPresenter;
  final HomeController homecontroller = Get.find();

  ///
  @override
  void onInit() async {
    super.onInit();
  }
}
