import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/vegetation_control/vegetation_presenter.dart';
import 'package:get/get.dart';

class VegetationDashboardController extends GetxController {
  VegetationDashboardController(
    this.vegetationDashboardPresenter,
  );
  VegetationDashboardPresenter vegetationDashboardPresenter;
  final HomeController homecontroller = Get.find();

  @override
  void onInit() async {
    super.onInit();
  }
}
