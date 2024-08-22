import 'package:cmms/app/cmms_report/cmms_report_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CmmsReportDashboardController extends GetxController {
  CmmsReportDashboardController(
    this.cmmsReportDashboardPresenter,
  );
  CmmsReportDashboardPresenter cmmsReportDashboardPresenter;
  final HomeController homecontroller = Get.find();

  @override
  void onInit() async {
    super.onInit();
  }
}
