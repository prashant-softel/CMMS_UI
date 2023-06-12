import 'package:cmms/app/calibration_view/calibration_view_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CalibrationViewController extends GetxController {
  ///
  CalibrationViewController(
    this.calibrationViewPresenter,
  );
  CalibrationViewPresenter calibrationViewPresenter;
  final HomeController homecontroller = Get.find();
  var isToggleOn = false.obs;
  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getequipmentNameList();

    super.onInit();
  }

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }
}
