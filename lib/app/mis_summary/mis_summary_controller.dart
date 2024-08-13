
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/mis_summary/mis_summary_presenter.dart';
import 'package:get/get.dart';
class MisSummaryController extends GetxController {
  ///
  MisSummaryController(
    this.misSummaryPresenter,
  );
  MisSummaryPresenter misSummaryPresenter;

  final HomeController controller = Get.find();
  

  

}
