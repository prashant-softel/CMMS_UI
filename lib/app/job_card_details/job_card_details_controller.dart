import 'dart:convert';

import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/permit_details_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/history_model.dart';
import '../../domain/models/job_details_model.dart';
import '../../domain/usecases/job_details_usecase.dart';
import '../controllers/file_upload_controller.dart';
import '../controllers/history_controller.dart';
import '../job_details/job_details_presenter.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/dropdown.dart';
import 'job_card_details_presenter.dart';

class JobCardDetailsController extends GetxController {
  ///
  JobCardDetailsController(
    this.jobCardDetailsPresenter,
  );
  JobCardDetailsPresenter jobCardDetailsPresenter;

  ///
  late JobDetailsPresenter jobDetailsPresenter;

  /// History
  var historyController = Get.put(HistoryController());
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  /// Employee Table
  Rx<String> selectedEmployeeName = ''.obs;
  Rx<bool> isEmployeeSelected = true.obs;
  RxList<DataRow2> employeeTableRows = <DataRow2>[].obs;
  var responsibilityCtrlr = TextEditingController();
  List<TextEditingController> responsibilityCtrlrs = [];
  RxList<EmployeeModel?> employeeList = <EmployeeModel>[].obs;
  RxList<EmployeeModel>? selectedEmployeeList = <EmployeeModel>[].obs;
  RxList<int> selectedEmployeeIdList = <int>[].obs;
  RxList<String> responsibilityList = <String>[].obs;

  /// Isolation and Loto Assets
  Rx<bool> isNormalized = false.obs;

  RxList<LotoAsset> lotoAppliedAssets = RxList<LotoAsset>([]);
  RxList<IsolationAssetsCategory> isolationAssetsCategoryList =
      RxList<IsolationAssetsCategory>([]);

  /// Permit Details
  int? permitId = 0;
  RxMap permitDetails = {}.obs;
  RxList<AssociatedPermit>? permitList = <AssociatedPermit>[].obs;
  //RxList<AssociatedPermit>? permitList = <AssociatedPermit>[].obs;

  /// Job Details
  Rx<int?> jobId = 0.obs;
  RxMap jobDetails = {}.obs;
  RxString strWorkTypes = ''.obs;
  RxString strToolsRequired = ''.obs;
  RxString strEquipmentCategories = ''.obs;
  List<String> workTypeNames = [];
  List<String> toolsRequiredNames = [];
  List<String> equipmentCategoryNames = [];
  RxList<JobDetailsModel?> jobList = <JobDetailsModel?>[].obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;

  /// Plant Details
  int userId = 35;
  int facilityId = 46;
  RxMap plantDetails = {}.obs;

  /// Job Card
  int? jobCardId = 0;
  Rx<bool> isJobCardStarted = false.obs;
  var comment = '';

  /// Other
  Rx<int> currentIndex = 0.obs;

  ///
  @override
  void onInit() async {
    try {
      Get.put(FileUploadController());

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
      getPermitDetails();
      responsibilityCtrlrs.add(TextEditingController());
      currentIndex.value = -1;
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    for (var i = 0; i < responsibilityCtrlrs.length; i++) {
      responsibilityCtrlrs[i].dispose();
    }
    super.onClose();
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

  Future<void> getHistory() async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 3;
    jobCardId = 1;
    historyList?.value = await jobCardDetailsPresenter.getJobCardHistory(
          moduleType,
          jobCardId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  void createPlantDetailsTableData() {
    if (jobList.isNotEmpty) {
      jobDetailsModel.value = jobList[0];
      equipmentCategoryNames = <String>[];
      for (var eC in jobDetailsModel.value?.equipmentCatList ?? []) {
        equipmentCategoryNames.add(eC.equipmentCatName);
      }
      strEquipmentCategories.value = equipmentCategoryNames.join(', ');
      plantDetails.value = {
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
          "Job Created By": jobDetailsModel.value?.createdByName,
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
          "Permit Issued By": permit?.issuedByName,
          "Permit Approved By": '',
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

  void updateJobCard() async {
    // isolation asset categories
    try {
      var _isolatedAssetCatList = [];
      for (IsolationAssetsCategory isolationAssetsCategory
          in isolationAssetsCategoryList) {
        _isolatedAssetCatList.add({
          "isolation_id": isolationAssetsCategory.isolationAssetsCatId,
          "normalisedStatus": isolationAssetsCategory.isNormalized ?? 0,
        });
      }
      // lots assets
      var _lotoAssetList = [];
      for (LotoAsset lotoAsset in lotoAppliedAssets) {
        _lotoAssetList.add({
          "loto_id": lotoAsset.lotoId,
          "lotoRemovedStatus": lotoAsset.removedStatus,
        });
      }
      // selected employees
      var _employeeList = [];

      for (EmployeeModel employee in selectedEmployeeList ?? []) {
        int _index = selectedEmployeeList?.indexOf(employee) ?? 0;
        final _responsibility = getResponsibility(_index);
        _employeeList.add({
          "empId": employee.id,
          "employeeId": employee.id,
          "responsibility": _responsibility,
        });
      }
      // create jobcard object
      var jobCard = {
        "id": jobCardId,
        "comment": "Job Card Updated",
        "status": 1,
        "is_isolation_required": true,
        "isolated_list": _isolatedAssetCatList,
        "loto_list": _lotoAssetList,
        "employee_list": _employeeList
      };
      //await jobCardDetailsPresenter.createJobCard();
      Map<String, dynamic>? response =
          await jobCardDetailsPresenter.updateJobCard(
        json.encode(jobCard),
        false,
      );
      print('Response = $response');
    } //
    catch (e) {
      print(e);
    }
  }

  void onValueChanged() {}

  void startStopJobCard() async {
    isJobCardStarted.value = !isJobCardStarted.value;
    // Map<String, dynamic> responseMap =
    //     await jobCardDetailsPresenter.createJobCard() ?? Map();
    // jobCardId = responseMap["id"];

    /// Get History
    getHistory();
    //jobCardDetailsPresenter.getJobCardDetails(jobCardId: jobCardId);
  }

  void toggleIsNormalizedSwitch(bool value, int index) {
    //isolationAssetsCategoryList[index].isNormalized = (value == true) ? 1 : 0;
    List<IsolationAssetsCategory> isolationList =
        List.from(isolationAssetsCategoryList);
    isolationList[index].isNormalized = (value == true) ? 1 : 0;

    isolationAssetsCategoryList.value = isolationList;
    update(["isolationAssetsCategoryList"]);
  }

  void checkForm() {
    if (selectedEmployeeName.value == '') {
      isEmployeeSelected.value = false;
    }
  }

  void getPermitDetails() async {
    // TODO: CHANGE THIS LATER
    permitId = 59616;
    final _permitDetails =
        await jobCardDetailsPresenter.getPermitDetails(permitId: permitId);
    var x = _permitDetails;
    isolationAssetsCategoryList.value = _permitDetails?.lstIsolation ?? [];
    lotoAppliedAssets.value = _permitDetails?.lstLoto ?? [];
  }

  void carryForwardJob(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Title'),
          content: Text('Text at the center'),
          actions: [
            CustomElevatedButton(
              text: 'Permit Details',
              onPressed: () {
                // Action for button 1
              },
              backgroundColor: ColorValues.appGreenColor,
            ),
            CustomElevatedButton(
              text: 'Job Card Details',
              onPressed: () {
                // Action for button 2
              },
              backgroundColor: ColorValues.appDarkBlueColor,
            ),
            CustomElevatedButton(
              text: 'Job Details',
              onPressed: () {
                // Action for button 3
              },
              backgroundColor: ColorValues.appLightBlueColor,
            ),
          ],
        );
      },
    );
  }

  void approveJob() async {
    final response = await jobCardDetailsPresenter.approveJobCard(
      jobCardId: jobCardId,
      comment: comment,
      isLoading: true,
    );
  }

  void rejectJob() async {
    final response =
        await jobCardDetailsPresenter.rejectJobCard(jobCardId, comment, true);
  }

  void addNewTextEditingController() {
    responsibilityCtrlrs.add(TextEditingController());
    //currentIndex.value = responsibilityCtrlrs.length - 1;
  }

  deleteEmployee() {}

  String? getResponsibility(index) {
    final responsibitlity = responsibilityCtrlrs[index].text;
    return responsibitlity;
  }

  void onEmployeeSelected(String selectedValueText, int rowIndex) {
    currentIndex.value = rowIndex;
    // Update the selected employee value for the corresponding row
    final rowToUpdate = employeeTableRows[rowIndex];
    rowToUpdate.cells[0] = DataCell(
      Container(
        padding: Dimens.edgeInsets5,
        child: DropdownWidget(
          controller: this,
          dropdownList: employeeList,
          isValueSelected: true,
          selectedValue: selectedValueText,
          onValueChanged: (list, selectedValueText) {
            onEmployeeSelected(selectedValueText, rowIndex);
          },
        ),
      ),
    );
    // Update the observable variables for the selected employee
    isEmployeeSelected.value = true;
    final _selectedEmployee = employeeList.firstWhere(
        (employee) => employee?.name == selectedValueText,
        orElse: () => null);
    if (_selectedEmployee != null) {
      final exists = selectedEmployeeList
              ?.any((employee) => employee.id == _selectedEmployee.id) ??
          false;
      if (!exists) {
        selectedEmployeeList?.add(_selectedEmployee);
      }
    }
  }

  ///
}
