import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/permit_details_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import '../../domain/models/history_model.dart';
import '../../domain/models/job_details_model.dart';
import '../../domain/usecases/job_details_usecase.dart';
import '../controllers/file_upload_controller.dart';
import '../controllers/history_controller.dart';
import '../job_details/job_details_presenter.dart';
import '../navigators/app_pages.dart';
import '../theme/color_values.dart';
import '../widgets/custom_elevated_button.dart';
import 'job_card_details_presenter.dart';
import 'views/widgets/job_card_updated_dialog.dart';

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
  final responsibilityCtrlr = TextEditingController();
  // List<TextEditingController> responsibilityCtrlrs = [];
  RxList<EmployeeModel?> employeeList = <EmployeeModel>[].obs;
  RxList<EmployeeModel>? selectedEmployeeList = <EmployeeModel>[].obs;
  Rx<EmployeeModel> selectedEmployee = EmployeeModel().obs;
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

  /// Job Details
  Rx<int?> jobId = 0.obs;
  RxMap jobDetails = {}.obs;
  RxString strWorkTypes = ''.obs;
  RxString strWorkAreasOrEquipments = ''.obs;
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
  Rx<int> jobCardId = 0.obs;
  Rx<bool> isJobCardStarted = false.obs;
  var comment = '';

  /// Other
  Rx<int> currentIndex = 0.obs;
  final unescape = HtmlUnescape();
  var descriptionOfWorkDoneCtrlr = TextEditingController();

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
      await setJobId();

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
      // responsibilityCtrlrs.add(TextEditingController());
      currentIndex.value = -1;
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setJobId() async {
    final _flutterSecureStorage = const FlutterSecureStorage();
    // Read jobId
    String? _jobId = await _flutterSecureStorage.read(key: "jobId");
    if (_jobId == null || _jobId == '' || _jobId == "null") {
      var dataFromPreviousScreen = Get.arguments;

      jobId.value = dataFromPreviousScreen['jobId'];
      await _flutterSecureStorage.write(
        key: "jobId",
        value: jobId.value == null ? '' : jobId.value.toString(),
      );
    } else {
      jobId.value = int.tryParse(_jobId) ?? 0;
    }
    // return jobId;
  }

  @override
  void onClose() {
    // for (var i = 0; i < responsibilityCtrlrs.length; i++) {
    //   responsibilityCtrlrs[i].dispose();
    // }
    super.onClose();
  }

  Future<void> getEmployeeList() async {
    final _employeeList =
        await jobCardDetailsPresenter.getAssignedToList(facilityId: facilityId);
    if (_employeeList != null) {
      for (var employee in _employeeList) {
        employeeList.add(employee);
      }
      // update(["employeeList"]);
    }
  }

  Future<void> getHistory() async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 4;
    int tempModuleType = 21;
    int tempJobCardId = 5326;
    //
    historyList?.value = await jobCardDetailsPresenter.getJobCardHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          jobCardId.value,
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

        // Convert work area(s)/equipment(s) to comma separated list
        var workAreaNames = <String>[];
        for (var workArea in jobDetailsModel.value?.workingAreaList ?? []) {
          workAreaNames.add(workArea.workingAreaName);
        }
        strWorkAreasOrEquipments.value = workAreaNames.join(', ');
        //remove extra comma at the end
        if (strWorkAreasOrEquipments.value.length > 0) {
          strWorkAreasOrEquipments.value = strWorkAreasOrEquipments.substring(
            0,
            strWorkAreasOrEquipments.value.length - 1,
          );
        }

        jobDetails.value = {
          "Job ID": jobDetailsModel.value?.id.toString(),
          "Job Title": jobDetailsModel.value?.jobTitle,
          "Job Description": jobDetailsModel.value?.jobDescription,
          "Job Assigned To": jobDetailsModel.value?.assignedName,
          "Work Area / Equipments": strWorkAreasOrEquipments.value,
          "Work Type": strWorkTypes.value,
          "Linked Tool To  Work Type": strToolsRequired.value,
          "Job Created By": jobDetailsModel.value?.createdByName,
        };
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

        if (permit != null) {
          permitId = permit.permitId;
        }

        String decodedPermitDescription = unescape.convert(
          permit?.title ?? '',
        );
        permitDetails.value = {
          "Permit ID": permit?.permitId.toString(),
          "Site Permit No.": permit?.sitePermitNo,
          "Permit Type": permit?.permitTypeName,
          "Permit Description": decodedPermitDescription,
          "Permit Issued By": permit?.issuedByName,
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
      var _comment = descriptionOfWorkDoneCtrlr.text.trim();
      // create jobcard object
      var jobCard = {
        "id": jobCardId.value,
        "comment": _comment,
        "status": 1,
        "is_isolation_required": true,
        "isolated_list": _isolatedAssetCatList,
        "loto_list": _lotoAssetList,
        "employee_list": _employeeList
      };

      Map<String, dynamic>? responseMapJobCardUpdated =
          await jobCardDetailsPresenter.updateJobCard(
        jobCard,
        false,
      );

      if (responseMapJobCardUpdated != null) {
        var _jobId = 0;
        var _message = '';
        if (responseMapJobCardUpdated["id"] != null &&
            responseMapJobCardUpdated["id"].isNotEmpty) {
          _jobId = responseMapJobCardUpdated["id"][0];
        }
        if (responseMapJobCardUpdated["message"] != null) {
          _message = responseMapJobCardUpdated["message"];
        }
        showAlertDialog(
            jobId: _jobId, message: _message, dialog: JobCardUpdatedDialog());
      }
    } //
    catch (e) {
      print(e);
    }
  }

  void onDropdownValueChanged(dropdownList, selectedValue) {
    selectedEmployeeName.value = selectedValue;
  }

  startStopJobCard() {
    isJobCardStarted.value = !isJobCardStarted.value;
  }

  Future<void> createJobCard() async {
    await startStopJobCard();

    ///
    if (isJobCardStarted.value == true) {
      Map<String, dynamic>? responseMapJobCardStarted =
          await jobCardDetailsPresenter.createJobCard(
        jobId: jobId.value,
        isLoading: false,
      );

      if (responseMapJobCardStarted != null &&
          responseMapJobCardStarted.length > 0) {
        final _jobCardId = responseMapJobCardStarted["id"][0];
        jobCardId.value = _jobCardId;
      }
    }

    /// Get History
    getHistory();
  }

  void toggleIsNormalizedSwitch(bool value, int index) {
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
    final _permitDetails =
        await jobCardDetailsPresenter.getPermitDetails(permitId: permitId);

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
      jobCardId: jobCardId.value,
      comment: comment,
      isLoading: true,
    );
  }

  void rejectJob() async {
    final response = await jobCardDetailsPresenter.rejectJobCard(
        jobCardId.value, comment, true);
  }

  String? getResponsibility(index) {
    return null;

    // final responsibitlity = responsibilityCtrlrs[index].text;
    // return responsibitlity;
  }

  goToJobCardListScreen() {
    Get.back();
    Get.toNamed(Routes.jobCardList);
  }

  void addNewEmployee(EmployeeModel selectedEmployee, String responsibility) {
    ///
    // Create a new index for this row based on the current number of rows
    final uniqueKey = UniqueKey();
    // Create a new DataRow2 with the selected employee and responsibility
    final newRow = DataRow2(
      key: uniqueKey,
      cells: [
        DataCell(Text('${selectedEmployeeName}')),
        DataCell(
          Tooltip(
            message: responsibility,
            child: Container(
              width: double.infinity,
              child: Text(
                responsibility,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        if (kIsWeb)
          DataCell(
            ElevatedButton(onPressed: () {}, child: Text('View Competencies')),
          ),
        DataCell(
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteEmployee(uniqueKey); // Delete based on the index
              }),
        ),
      ],
    );

    // Add the new row to the list of rows
    employeeTableRows.add(newRow);

    // Add the selected employee to the list of selected employees
    selectedEmployeeList?.add(selectedEmployee);

    responsibilityCtrlr.clear();
    selectedEmployeeName.value = '';
  }

  void deleteEmployee(Key key) {
    // Find the index of the row with this key
    final index = employeeTableRows.indexWhere((row) => row.key == key);
    if (index != -1) {
      // If found, remove the row from the table
      employeeTableRows.removeAt(index);
    }
  }

  /// Show alert dialog
  void showAlertDialog({
    int? jobId,
    String? message,
    String? title,
    Function()? onPress,
    Widget? dialog,
  }) async {
    await Get.dialog<void>(dialog ?? SizedBox());
  }

  ///
}

// class DataRow2 {
//   final List<DataCell> cells;
//   final int index;

//   DataRow2({required this.cells, this.index = -1});
// }
