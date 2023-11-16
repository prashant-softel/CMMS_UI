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

  void goToCreateObservation() {
    Get.toNamed(Routes.createObservation);
  }

  Future<void> createChecklist() async {
    Get.toNamed(
      Routes.preventiveList,
    );
  }

  Future<void> checkPoint() async {
    Get.toNamed(
      Routes.preventiveCheckPoint,
    );
  }
}
