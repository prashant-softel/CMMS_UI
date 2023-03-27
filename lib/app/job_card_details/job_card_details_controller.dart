import 'package:cmms/domain/models/employee_model.dart';
import 'package:get/get.dart';

import '../../domain/models/history_model.dart';
import '../../domain/models/job_details_model.dart';
import '../../domain/usecases/job_details_usecase.dart';

import '../controllers/file_upload_controller.dart';
import '../controllers/history_controller.dart';
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
  var historyController = Get.put(HistoryController());

  ///
  RxList<JobDetailsModel?> jobList = <JobDetailsModel?>[].obs;
  RxList<HistoryModel?> historyList = <HistoryModel?>[].obs;
  RxList<EmployeeModel?> employeeList = <EmployeeModel>[].obs;
  Rx<String> selectedEmployee = ''.obs;
  Rx<bool> isEmployeeSelected = true.obs;
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
  Rx<bool> isJobCardStarted = false.obs;
  Rx<bool> isNormalized = false.obs;

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
      getEmployeeList();
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getEmployeeList() async {
    final _employeeList =
        await jobCardDetailsPresenter.getAssignedToList(facilityId: facilityId);

    if (_employeeList != null) {
      for (var employee in _employeeList) {
        employeeList.add(employee);
      }
      update(["employeeList"]);
    }
  }

  Future<void> getJobCardHistory() async {
    final _moduleType = 1;
    final _id = 1;
    final _jobCardHistoryList =
        await historyController.getHistory(_moduleType, _id);

    if (_jobCardHistoryList != null) {
      for (var history in _jobCardHistoryList) {
        historyList.add(history);
      }
      update(["historyList"]);
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

  void onValueChanged() {}

  void startStopJobCard() {
    isJobCardStarted.value = !isJobCardStarted.value;
  }

  void toggleIsNormalizedSwitch(bool value) {
    isNormalized.value = value;
  }

  void checkForm() {
    if (selectedEmployee.value == '') {
      isEmployeeSelected.value = false;
    }
  }

  ///
}
