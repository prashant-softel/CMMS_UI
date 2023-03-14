import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

import '../../domain/models/block_model.dart';
import '../../domain/models/job_details_model.dart';
import '../../domain/usecases/job_details_usecase.dart';
import '../job_details/job_details_presenter.dart';
import 'job_card_details_presenter.dart';

class JobCardDetailsController extends GetxController {
  ///
  JobCardDetailsController(
    this.jobCardDetailsPresenter,
  );
  JobCardDetailsPresenter jobCardDetailsPresenter;

  ///
  late JobDetailsPresenter jobDetailsPresenter;

  ///
  RxList<JobDetailsModel?> jobList = <JobDetailsModel?>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  List<String> equipmentCategoryNames = [];
  List<String> toolsRequiredNames = [];
  RxList<AssociatedPermit>? permitList = <AssociatedPermit>[].obs;
  List<String> workTypeNames = [];
  RxString strEquipmentCategories = ''.obs;
  RxString strToolsRequired = ''.obs;
  RxString strWorkTypes = ''.obs;
  int facilityId = 46;
  int userId = 35;
  Rx<int?> jobId = 0.obs;
  RxMap productDetails = {}.obs;
  RxMap jobDetails = {}.obs;
  RxMap permitDetails = {}.obs;

  ///
  @override
  void onInit() async {
    try {
      Get.put(DropzoneController());
      jobDetailsPresenter = Get.put(
        JobDetailsPresenter(
          JobDetailsUsecase(
            Get.find(),
          ),
        ),
      );
      jobId.value = Get.arguments ?? 0;

      /// TODO: Remove this line later
      jobId.value = 3158;
      jobList.value = await jobDetailsPresenter.getJobDetails(
            jobId: jobId.value,
            isLoading: true,
          ) ??
          [];
      createPlantDetailsTableData();
      createJobDetailsTableData();
      createPermitDetailsTableData();
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  void createPlantDetailsTableData() {
    if (jobList.isNotEmpty) {
      jobDetailsModel.value = jobList[0];
      equipmentCategoryNames = <String>[];
      for (var eC in jobDetailsModel.value?.equipmentCatList ?? []) {
        equipmentCategoryNames.add(eC.equipmentCatName);
      }
      strEquipmentCategories.value = equipmentCategoryNames.join(', ');
      //remove extra comma at the end
      if (strEquipmentCategories.value.length > 0) {
        strEquipmentCategories.value = strEquipmentCategories.substring(
          0,
          strEquipmentCategories.value.length - 1,
        );
      }
      productDetails.value = {
        "Plant Details": jobDetailsModel.value?.facilityName,
        "Block": jobDetailsModel.value?.blockName,
        "Equipment Categories": strEquipmentCategories.value,
      };
    }
  }

  void createJobDetailsTableData() {
    try {
      if (jobList.isNotEmpty) {
        jobDetailsModel.value = jobList[0];

        // Convert tools required to comma separated list
        toolsRequiredNames = <String>[];
        for (var toolRequired
            in jobDetailsModel.value?.lstToolsRequired ?? []) {
          toolsRequiredNames.add(toolRequired.name);
        }
        strToolsRequired.value = toolsRequiredNames.join(', ');
        //remove extra comma at the end
        if (strToolsRequired.value.length > 0) {
          strToolsRequired.value = strToolsRequired.substring(
            0,
            strToolsRequired.value.length - 1,
          );
        }
        // Convert work type(s) to comma separated list
        workTypeNames = <String>[];
        for (var workType in jobDetailsModel.value?.workType ?? []) {
          workTypeNames.add(workType.name);
        }
        strWorkTypes.value = workTypeNames.join(', ');
        //remove extra comma at the end
        if (strWorkTypes.value.length > 0) {
          strWorkTypes.value = strWorkTypes.substring(
            0,
            strWorkTypes.value.length - 1,
          );
        }
        jobDetails.value = {
          "Job ID": jobDetailsModel.value?.id.toString(),
          "Job Title": jobDetailsModel.value?.jobTitle,
          "Job Description": jobDetailsModel.value?.jobDescription,
          "Job Assigned To": jobDetailsModel.value?.assignedName,
          "Work Type": strWorkTypes.value,
          "Linked Tool To  Work Type": strToolsRequired.value,
          "Standard Action": jobDetailsModel.value?.standardAction,
        };
        //var x = jobDetails.value;
      }
    } //
    catch (e) {
      print(e);
    }
  }

  void createPermitDetailsTableData() {
    try {
      if (jobList.isNotEmpty) {
        jobDetailsModel.value = jobList[0];

        permitList?.value = jobDetailsModel.value?.associatedPermitList ?? [];

        AssociatedPermit? permit = permitList?[0];
        permitDetails.value = {
          "Permit ID": permit?.permitId.toString(),
          "Site Permit No.": permit?.sitePermitNo,
          "Permit Type": permit?.permitTypeName,
          "Permit Description": permit?.title,
          // "Work Type": strWorkTypes.value,
          // "Linked Tool To  Work Type": strToolsRequired.value,
          // "Standard Action": jobDetailsModel.value?.standardAction,
        };
        //var x = jobDetails.value;
      }
    } //
    catch (e) {
      print(e);
    }
  }

  ///
}
