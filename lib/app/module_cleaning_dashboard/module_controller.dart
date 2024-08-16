import 'package:cmms/app/module_cleaning_dashboard/module_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ModuleCleaningDashboardController extends GetxController {
  ModuleCleaningDashboardController(
    this.moduleCleaningDashboardPresenter,
  );
  ModuleCleaningDashboardPresenter moduleCleaningDashboardPresenter;
  final HomeController homecontroller = Get.find();

  @override
  void onInit() async {
    super.onInit();
  }

  void clearStoreDataMcid() {
    moduleCleaningDashboardPresenter.clearValueMcId();
  }

  void clearStoreDataPlanid() {
    moduleCleaningDashboardPresenter.clearValuePlanId();
  }
}
