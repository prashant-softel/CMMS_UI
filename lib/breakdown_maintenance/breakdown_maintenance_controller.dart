import 'package:cmms/app/navigators/navigators.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:cmms/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

import '../app/job_list/job_list_controller.dart';
import '../app/job_list/job_list_presenter.dart';
import '../domain/usecases/job_list_usecase.dart';

class BreakdownMaintenanceController extends GetxController {
  BreakdownMaintenanceController(
    this.breakdownMaintenancePresenter,
  );

  BreakdownMaintenancePresenter breakdownMaintenancePresenter;
  late JobListController jobListController;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;

  @override
  void onInit() async {
    //homePresenter.generateToken();
    //  Future.delayed(Duration(seconds: 1), () {
    getFacilityList();
    //});
    Get.lazyPut(
      () => JobListController(
        Get.put(
          JobListPresenter(
            Get.put(JobListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      //permanent: true,
    );
    super.onInit();
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await breakdownMaintenancePresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  // void switchFacility(String? facilityName) {
  //   facilityId =
  //       facilityList.indexWhere((facility) => facility?.name == facilityName);
  //   getJobList(facilityId, userId);
  // }
  Future<void> createChecklist() async {
    Get.toNamed(
      Routes.jobList,
    );
  }

  Future<void> createNewPermit() async {
    Get.toNamed(
      Routes.new_permit,
    );
  }
}
