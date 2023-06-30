import 'package:cmms/app/app.dart';
import 'package:cmms/app/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/master_dashboard/master_presenter.dart';
import 'package:cmms/app/navigators/navigators.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
// import 'package:cmms/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/job_list_usecase.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../../domain/models/inventory_category_model.dart';

class MastersController extends GetxController {
  MastersController(
    this.mastersPresenter,
  );

  final HomeController controller = Get.find();

  MastersPresenter mastersPresenter;
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

    super.onInit();
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await mastersPresenter.getFacilityList();

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
  Future<void> goToPermitTypeScreen() async {
    Get.toNamed(
      Routes.permitTypeScreen,
    );
  }

  Future<void> gotToSafetyQuestionsList() async {
    Get.toNamed(
      Routes.safetyQuestionsList,
    );
  }

  Future<void> goToJobTypeList() async {
    Get.toNamed(
      Routes.tbtTypeListScreen,
    );
  }

  Future<void> goToJobSOPList() async {
    Get.toNamed(
      Routes.tbtSOPListScreen,
    );
  }

  //goToAssetTypeList
  Future<void> goToAssetTypeList() async {
    Get.toNamed(
      Routes.assetTypeListScreen,
    );
  }

  //goToInventoryTypeList
  Future<void> goToInventoryTypeList() async {
    Get.toNamed(
      Routes.inventoryTypeListScreen,
    );
  }

  Future<void> goToInventoryStatusList() async {
    Get.toNamed(
      Routes.inventoryStatusListScreen,
    );
  }

  //goToFacilityTypeList
  Future<void> goToFacilityTypeList() async {
    Get.toNamed(
      Routes.facilityTypeListScreen,
    );
  }

  Future<void> goToSPVList() async {
    Get.toNamed(
      Routes.SPVListScreen,
    );
  }

  //goToBlockTypeList
  Future<void> goToBlockTypeList() async {
    Get.toNamed(
      Routes.blockTypeListScreen,
    );
  }

  Future<void> goToModuleTypeList() async {
    Get.toNamed(
      Routes.moduleTypeListScreen,
    );
  }

  Future<void> goToBusinessList() async {
    Get.toNamed(
      Routes.businessListScreen,
    );
  }

  Future<void> goToBusinessTypeList() async {
    Get.toNamed(
      Routes.businessTypeListScreen,
    );
  }

  Future<void> goToBloodTypeList() async {
    Get.toNamed(
      Routes.bloodTypeListScreen,
    );
  }

  Future<void> goToRoleTypeList() async {
    Get.toNamed(
      Routes.roleListScreen,
    );
  }

  Future<void> goToRoleAccess() async {
    Get.toNamed(
      Routes.roleAccess,
    );
  }

  Future<void> goToCountryTypeList() async {
    Get.toNamed(
      Routes.countryTypeListScreen,
    );
  }

  Future<void> goToStateTypeList() async {
    Get.toNamed(
      Routes.stateTypeListScreen,
    );
  }

  Future<void> goToFrequencyList() async {
    Get.toNamed(
      Routes.frequencyListScreen,
    );
  }

  Future<void> goToAssetMasterList() async {
    Get.toNamed(
      Routes.assetMasterList,
    );
  }

  Future<void> goToAddAssetMaster() async {
    Get.toNamed(
      Routes.addassetMaster,
    );
  }

  Future<void> goToDocumentManager() async {
    Get.toNamed(
      Routes.documentManager,
    );
  }

  Future<void> goToDesignationScreen() async {
    Get.toNamed(
      Routes.designationScreen,
    );
  }

  Future<void> goToCompetencyScreen() async {
    Get.toNamed(
      Routes.competencyScreen,
    );
  }

}
