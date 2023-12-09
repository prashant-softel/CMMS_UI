import 'package:cmms/app/incident_report_dashboard/incident_report_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class IncidentReportDashboardController extends GetxController {
  IncidentReportDashboardController(
    this.incidentReportDashboardPresenter,
  );
  IncidentReportDashboardPresenter incidentReportDashboardPresenter;
  final HomeController homecontroller = Get.find();

  @override
  void onInit() async {
    super.onInit();
  }
}
