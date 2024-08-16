import 'package:cmms/app/app.dart';
import 'package:cmms/app/document_version_dashboard/doc_version_presenter.dart';
import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:cmms/app/navigators/navigators.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
// import 'package:cmms/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class DocVersionDashbordController extends GetxController {
  DocVersionDashbordController(
    this.docVersionPresenter,
  );

  final HomeController controller = Get.find();

  DocVersionPresenter docVersionPresenter;
  late JobListController jobListController;

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
    final _facilityList = await docVersionPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> documentUpload() async {
    Get.toNamed(
      Routes.documentUploadScreen,
    );
  }
    Future<void> goToDocumentManager() async {
    Get.toNamed(
      Routes.documentManager,
    );
  }

}
