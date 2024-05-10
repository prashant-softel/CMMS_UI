import 'package:cmms/app/administration_dashboard_screen/admin_dash_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class AdminDashboardController extends GetxController {
  AdminDashboardController(
    this.adminDashboardPresenter,
  );
  AdminDashboardPresenter adminDashboardPresenter;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;

  @override
  void onInit() async {
    // getFacilityList();

    super.onInit();
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityList() async {
    try {
      final _facilityList =
          await adminDashboardPresenter.getFacilityList(false);

      if (_facilityList != null) {
        for (var facility in _facilityList) {
          facilityList.add(facility);
        }
        selectedFacility.value = facilityList[0]?.name ?? '';
      }
    } catch (e) {
      Utility.showDialog(e.toString(), ' admin dashboard - getFacilityList');
    }
  }
}
