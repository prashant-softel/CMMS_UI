import 'package:get/get.dart';
import 'calibration_list_presenter.dart';

class CalibrationListController extends GetxController {
  ///
  CalibrationListController(
    this.calibrationListPresenter,
  );
  CalibrationListPresenter calibrationListPresenter;

  ///
  @override
  void onInit() async {
    super.onInit();
  }
}
