import 'package:cmms/app/setting_dashboard/setting_dashboard_presenter.dart';
import 'package:get/get.dart';

import '../../domain/models/facility_model.dart';

class SettingDashboardController extends GetxController {
  SettingDashboardController(this.settingDashboardPresenter);
  SettingDashboardPresenter settingDashboardPresenter;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;

  ///

  @override
  void onInit() async {
    //homePresenter.generateToken();
    //  Future.delayed(Duration(seconds: 1), () {
    getFacilityList();
    //});

    super.onInit();
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  void clearStoreData() {
    settingDashboardPresenter.clearValue();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await settingDashboardPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }
}
