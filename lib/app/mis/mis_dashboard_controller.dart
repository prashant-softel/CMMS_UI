import 'package:cmms/app/app.dart';
import 'package:cmms/app/mis/mis_dashboard_presenter.dart';

import 'package:cmms/app/navigators/navigators.dart';

import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class MisDashboardController extends GetxController {
  MisDashboardController(
    this.misDashboardPresenter,
  );

  // final HomeController controller = Get.find();

  MisDashboardPresenter misDashboardPresenter;
  late MisDashboardController listOfObservationController;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;

  @override
  void onInit() async {
    getFacilityList();

    super.onInit();
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityList() async {
    try {
      final _facilityList = await misDashboardPresenter.getFacilityList(false);

      if (_facilityList != null) {
        for (var facility in _facilityList) {
          facilityList.add(facility);
        }
        selectedFacility.value = facilityList[0]?.name ?? '';
      }
    } catch (e) {
      Utility.showDialog(e.toString() + ' MisController - getFacilityList');
    }
  }

  void goToJobListScreen() {
    Get.toNamed(Routes.observationListScreen);
  }

  void goToPlanListScreen() {
    misDashboardPresenter.clearValue();

    Get.toNamed(Routes.auditListScreen, arguments: {"type": 3});
  }

  void goTocreatePlanScreen() {
    misDashboardPresenter.clearValue();

    Get.toNamed(Routes.createAudit, arguments: {"type": 3});
  }

  void goToCreateObservation() {
    Get.toNamed(Routes.createObservation);
  }

  Future<void> createChecklist() async {
    misDashboardPresenter.clearValue();

    Get.toNamed(Routes.preventiveList, arguments: {'type': 3});
  }

  Future<void> checkPoint() async {
    misDashboardPresenter.clearValue();

    Get.toNamed(Routes.preventiveCheckPoint, arguments: {'type': 3});
  }

  void goToCheckListOfObservation() {
    Get.toNamed(Routes.checkListOfObservation);
  }
}
