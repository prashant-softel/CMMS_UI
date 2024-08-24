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
      Utility.showDialog(e.toString(), ' MisController - getFacilityList');
    }
  }

  void goToObsListScreen() {
    Get.toNamed(Routes.observationListScreen);
  }

  void goToChecklistInspectionScreen() {
    Get.toNamed(Routes.checklistInspection);
  }

  void goToPlanListScreen() {
    misDashboardPresenter.clearValue();

    Get.toNamed(Routes.auditListScreen, arguments: {'type': AppConstants.kMis});
  }

  void goToAddCourse() {
    misDashboardPresenter.clearValue();
    Get.toNamed(Routes.addCourse);
  }

  void goToScheduleCourseList() {
    misDashboardPresenter.clearValue();
    Get.toNamed(Routes.scheduleCourseList);
  }

  void goToCourseCategory() {
    misDashboardPresenter.clearValue();
    Get.toNamed(Routes.courseCategory);
  }

  void goToTargetedGroup() {
    misDashboardPresenter.clearValue();
    Get.toNamed(Routes.targetedGroup);
  }

  void goTocreatePlanScreen() {
    misDashboardPresenter.clearValue();
    Get.toNamed(Routes.createAudit, arguments: {"type": AppConstants.kMis});
  }

  void goToMisTaskScreen() {
    misDashboardPresenter.clearValue();

    Get.toNamed(Routes.auditTask, arguments: {'type': AppConstants.kMis});
  }

  void goToCreateObservation() {
    Get.toNamed(Routes.createObservation);
    misDashboardPresenter.clearValue();
  }

  void goToObservationSummary() {
    Get.offNamed(Routes.observationSummary);
  }
    void goToMisSummary() {
    Get.offNamed(Routes.misSummary);
  }

  Future<void> createChecklist() async {
    misDashboardPresenter.clearValue();

    Get.toNamed(Routes.preventiveList, arguments: {'type': AppConstants.kMis});
  }

  Future<void> checkPoint() async {
    misDashboardPresenter.clearValue();

    Get.toNamed(Routes.preventiveCheckPoint,
        arguments: {'type': AppConstants.kMis});
  }

  void goToCheckListOfObservation() {
    Get.toNamed(Routes.checkListOfObservation);
  }

  void goToStatutoryScreen() {
    Get.toNamed(Routes.statutory);
  }

  void trainingCourse() {
    Get.toNamed(Routes.trainingCourse);
  }

  void trainingSummary() {
    Get.toNamed(Routes.trainingSummary);
  }

  void grievanceList() {
    Get.toNamed(Routes.grievanceList);
  }

  void addGrievance() {
    Get.toNamed(Routes.addGrievance);
  }

    void GrievanceSummaryReport() {
    Get.toNamed(Routes.grievanceSummary);
  }

  void goToWasteDataScreen() {
    Get.toNamed(Routes.wasteData);
  }

  void goToHazardousDataScreen() {
    Get.toNamed(
      Routes.wasteData,
      arguments: {
        'hazardous': 1,
      },
    );
  }

  void goToNonHazardousDataScreen() {
    Get.toNamed(
      Routes.wasteData,
      arguments: {
        'hazardous': 0,
      },
    );
  }

  void goToWaterDataScreen() {
    Get.toNamed(Routes.waterDataListScreen);
  }

  Future<void> goToTypeOfObservation() async {
    Get.toNamed(
      Routes.typeofobservation,
    );
  }

  Future<void> goToSourceOfObservation() async {
    Get.toNamed(
      Routes.sourceofobservation,
    );
  }

  Future<void> goToRiskType() async {
    Get.toNamed(
      Routes.risktypemaster,
    );
  }

  Future<void> documentUpload() async {
    Get.toNamed(
      Routes.documentUploadScreen,
    );
  }

  Future<void> documentManager() async {
    Get.toNamed(
      Routes.documentManager,
    );
  }
   void goToCreateOccupationalScreen() {
    Get.toNamed(Routes.createOccupationalScreen);
  }
   void goToOccupationalDataListScreen() {
    Get.toNamed(Routes.occupationalDataListScreen);
  }
   void goToRegulataryDataListScreen() {
    Get.toNamed(Routes.regulataryDataListScreen);
  }
   void goToCreateRegulataryVisitsScreen() {
    Get.toNamed(Routes.createRegulataryVisitsScreen);
  }
   void goToCreatePermitsTBTScreen() {
    Get.toNamed(Routes.createPermitsTBTScreen);
  }
   void goToPermitsTBTDataListScreen() {
    Get.toNamed(Routes.permitsTBTDataListScreen);
  }
    void goToCreateFuelDataScreen() {
    Get.toNamed(Routes.createFuelDataScreen);
  }
    void goToFuelDataListScreen() {
    Get.toNamed(Routes.fueldataListScreen);
  }
    void goToCreatePlantationDataScreen() {
    Get.toNamed(Routes.createplantationdataScreen);
  }
    void goToPlantationListScreen() {
    Get.toNamed(Routes.plantationlistScreen);
  }

  
}
