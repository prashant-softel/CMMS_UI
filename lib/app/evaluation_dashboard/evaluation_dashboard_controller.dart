import 'package:cmms/app/audit/audit_presenter.dart';
import 'package:cmms/app/evaluation_dashboard/evaluation_dashboard_presenter.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../domain/models/facility_model.dart';
import '../navigators/app_pages.dart';

class EvaluationController extends GetxController {
  EvaluationController(this.evaluationPresenter);
  EvaluationPresenter evaluationPresenter;

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
    final _facilityList = await evaluationPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  void switchFacility(String? facilityName) {}
  Future<void> createChecklist() async {
    // EvaluationPresenter.clearValue();
    Get.offAllNamed('${Routes.preventiveList}/${AppConstants.kEvaluation}');

    // Get.toNamed(Routes.preventiveList,
    //     arguments: {'type': AppConstants.kAudit});
  }

  Future<void> checkPoint() async {
    evaluationPresenter.clearValue();
    Get.offAllNamed(
        '${Routes.preventiveCheckPoint}/${AppConstants.kEvaluation}');
  }

  Future<void> auditList() async {
    evaluationPresenter.clearValue();
    Get.offAllNamed('${Routes.auditListScreen}/${AppConstants.kEvaluation}');
  }

  // Future<void> auditTask() async {
  //   evaluationPresenter.clearValue();

  //   Get.toNamed(Routes.auditTask, arguments: {'type': AppConstants.kAudit});
  // }
}
