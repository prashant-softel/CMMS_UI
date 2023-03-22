import 'package:get/get.dart';
import 'preventive_check_point_presenter.dart';

class PreventiveCheckPointController extends GetxController {
  PreventiveCheckPointController(
    this.preventiveCheckPointPresenter,
  );
  PreventiveCheckPointPresenter preventiveCheckPointPresenter;

  @override
  void onInit() async {
    super.onInit();
  }

  var isToggleOn = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }
  // Future<void> createChecklist() async {
  //   Get.toNamed(
  //     Routes.create_checkList,
  //   );
  // }
}
