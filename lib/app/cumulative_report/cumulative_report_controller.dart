// ignore_for_file: invalid_use_of_protected_member

import 'package:cmms/app/cumulative_report/cumulative_report_presenter.dart';
import 'package:get/get.dart';

class CumulativeReportController extends GetxController {
  ///
  CumulativeReportController(
    this.cumulativeReportPresenter,
  );
  CumulativeReportPresenter cumulativeReportPresenter;

  @override
  void onInit() async {
    super.onInit();
  }
}
