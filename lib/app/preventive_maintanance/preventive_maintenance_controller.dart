import 'package:cmms/app/preventive_maintanance/preventive_maintenance_presenter.dart';
import 'package:get/get.dart';

import '../../domain/models/facility_model.dart';
import '../navigators/app_pages.dart';

class PreventiveController extends GetxController {
  PreventiveController(this.preventivePresenter);
  PreventivePresenter preventivePresenter;

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

  Future<void> getFacilityList() async {
    final _facilityList = await preventivePresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  void switchFacility(String? facilityName) {}
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

  Future<void> pmMapping() async {
    Get.toNamed(
      Routes.preventiveMaintenanceMapping,
    );
  }

  Future<void> pmSchedule() async {
    Get.toNamed(
      Routes.pmSchedule,
    );
  }

  Future<void> pmTask() async {
    Get.toNamed(
      Routes.pmTask,
    );
  }

  Future<void> pmExecution() async {
    Get.toNamed(
      Routes.pmExecution,
    );
  }
}
