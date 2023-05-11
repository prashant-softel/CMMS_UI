import 'package:cmms/app/app.dart';
import 'package:cmms/app/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:cmms/app/navigators/navigators.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
// import 'package:cmms/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class BreakdownMaintenanceController extends GetxController {
  BreakdownMaintenanceController(
    this.breakdownMaintenancePresenter,
  );

  final HomeController controller = Get.find();

  BreakdownMaintenancePresenter breakdownMaintenancePresenter;
  late JobListController jobListController;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;

  @override
  void onInit() async {
    //homePresenter.generateToken();
    // Future.delayed(Duration(seconds: 1), () {
    getFacilityList();
    // });

    super.onInit();
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityList() async {
    try {
      final _facilityList =
          await breakdownMaintenancePresenter.getFacilityList();

      if (_facilityList != null) {
        for (var facility in _facilityList) {
          facilityList.add(facility);
        }
        selectedFacility.value = facilityList[0]?.name ?? '';
      }
    } catch (e) {
      Utility.showDialog(e.toString() + ' BMController - getFacilityList');
    }
  }

  // void switchFacility(String? facilityName) {
  //   facilityId =
  //       facilityList.indexWhere((facility) => facility?.name == facilityName);
  //   getJobList(facilityId, userId);
  // }
  Future<void> goToJobListScreen() async {
    Get.toNamed(
      Routes.jobList,
    );
  }

  void addNewJob() {
    Get.toNamed(
      Routes.addJob,
    );
  }

  Future<void> newPermitList() async {
    Get.toNamed(
      Routes.newPermitList,
    );
  }

  Future<void> createNewPermit() async {
    Get.toNamed(
      Routes.newPermit,
    );
  }
}
