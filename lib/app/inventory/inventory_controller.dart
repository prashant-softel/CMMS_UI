import 'package:cmms/app/breakdown_maintenance/breakdown_maintenance_binding.dart';
import 'package:get/get.dart';

import '../../domain/models/facility_model.dart';
import '../navigators/app_pages.dart';
import 'inventory_presenter.dart';

class InventoryController extends GetxController {
  InventoryController(this.inventoryPresenter);
  InventoryPresenter inventoryPresenter;

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
    final _facilityList = await inventoryPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> pmSchedule() async {
    Get.toNamed(
      Routes.pmSchedule,
    );
  }

  Future<void> newWarrantyClaimList() async {
    Get.toNamed(
      Routes.newWarrantyClaimList,
    );
  }

  Future<void> breakdownMaintenance() async {
    Get.toNamed(
      Routes.warrantyClaimListWeb,
    );
  }
}
