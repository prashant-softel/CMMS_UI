import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/close_permit_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/permit_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:cmms/domain/models/transferItems_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import '../../domain/models/comment_model.dart';
import '../../domain/models/history_model.dart';
import '../../domain/models/job_card_details_model.dart';
import '../controllers/file_upload_controller.dart';
import '../controllers/history_controller.dart';
import '../navigators/app_pages.dart';
import '../utils/utility.dart';
import 'job_card_details_presenter.dart';

class JobCardDetailsController extends GetxController {
  JobCardDetailsController(this.jobCardDetailsPresenter);

  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<bool> isFacilitySelected = true.obs;
  final HomeController homeController = Get.find();
  JobCardDetailsPresenter jobCardDetailsPresenter;

  var historyController = Get.put(HistoryController());
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<FilesModel?> file_list = <FilesModel?>[].obs;
  RxList<FilesModel?> file_list_new = <FilesModel?>[].obs;
  RxList<FilesModel?> allFiles = <FilesModel?>[].obs;
  RxList<InventoryModel>? workingAreaList = <InventoryModel>[].obs;

  Rx<String> selectedEmployeeName = ''.obs;
  Rx<bool> isEmployeeSelected = true.obs;

  RxList<DataRow2> employeeTableRows = <DataRow2>[].obs;
  final responsibilityCtrlr = TextEditingController();
  List<TextEditingController> responsibilityCtrlrs = [];
  RxList<EmployeeModel?> employeeList = <EmployeeModel>[].obs;
  RxList<EmployeeModel>? selectedEmployeeList = <EmployeeModel>[].obs;
  Rx<EmployeeModel> selectedEmployee = EmployeeModel().obs;
  RxList<int> selectedEmployeeIdList = <int>[].obs;
  RxList<String> responsibilityList = <String>[].obs;

  RxList<EmployeeModel> employee = <EmployeeModel>[].obs;
  EmployeeModel selectedEmployees = EmployeeModel();
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  int selectedEmployeeId = 0;
  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;

  Rx<bool> isNormalized = false.obs;

  RxList<LotoAsset> lotoAppliedAssets = RxList<LotoAsset>([]);
  RxList<IsolationAssetsCategory> isolationAssetsCategoryList =
      RxList<IsolationAssetsCategory>([]);

  int? permitId = 0;
  RxMap permitDetails = {}.obs;
  RxList<LstPermitDetailList>? permitList = <LstPermitDetailList>[].obs;
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;
  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  RxMap<dynamic, dynamic> dropdownMapperDataworkingArea = {}.obs;

  Rx<int?> jobId = 0.obs;
  Rx<int> permitIdclose = 0.obs;
  RxMap jobDetails = {}.obs;
  RxString strWorkTypes = ''.obs;
  RxString strWorkAreasOrEquipments = ''.obs;
  RxString strToolsRequired = ''.obs;
  RxString strEquipmentCategories = ''.obs;
  List<String?> workTypeNames = [];
  List<String> assignNames = [];
  RxString strAssignName = ''.obs;

  List<String> toolsRequiredNames = [];
  List<String> equipmentCategoryNames = [];
  RxList<JobCardDetailsModel?> jobCardList = <JobCardDetailsModel?>[].obs;
  Rx<JobCardDetailsModel?> jobCardDetailsModel = JobCardDetailsModel().obs;
  RxList<LstCmjcJobDetailList> lstCmjcJobDetailList =
      <LstCmjcJobDetailList>[].obs;

  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  RxList<WorkingAreaList?>? materialUsedAssets = <WorkingAreaList?>[].obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  int userId = 35;
  int facilityId = 0;
  RxMap plantDetails = {}.obs;

  Rx<int> jobCardId = 0.obs;
  Rx<bool> isJobCardStarted = false.obs;
  var comment = '';

  Rx<int> currentIndex = 0.obs;
  final unescape = HtmlUnescape();
  var descriptionOfWorkDoneCtrlr = TextEditingController();
  RxMap<dynamic, dynamic> deployedEmployeeMapperData = {}.obs;
  RxList<MRSListByJobIdModel?>? listMrsByTaskId = <MRSListByJobIdModel?>[].obs;
  RxList<CmmrsItems?>? cmmrsItems = <CmmrsItems?>[].obs;
  Rx<bool> allTrue = false.obs;
  Rx<bool> isformInvalid = false.obs;
  var returnitemExists = <int>[].obs;
  var itemExistsWithZeroDifference = <bool>[].obs;

  RxString selectedOption = ''.obs;
  RxList<List<Map<String, String>>> employeesDeployed =
      <List<Map<String, String>>>[].obs;

  void addEmployeesDeployed() {
    employeesDeployed.add([
      {
        "key": "Employee Name",
        "value": "Please Select",
      },
      {
        "key": "Designation",
        "value": "",
      },
      {
        'key': "Action",
        "value": '',
      },
    ]);
  }

  void updateSelectedOption(String newValue) {
    selectedOption.value = newValue;
  }

  void clearStoreData() {
    jobCardDetailsPresenter.clearStoreData();
  }

  void clearTypeStoreData() {
    jobCardDetailsPresenter.clearTypeValue();
  }

  void clearisCheckedtoreData() {
    jobCardDetailsPresenter.clearisCheckedValue();
  }

  void clearjobmodelValue() {
    jobCardDetailsPresenter.clearjobmodelValue();
  }

  void clearpmTaskValue() {
    jobCardDetailsPresenter.clearpmTaskValue();
  }

  void addRowItem() {
    rowItem.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {"key": "Drop_down_eq", "value": 'Please Select'},
      {'key': "Sr_No", "value": ''},
      {'key': "code", "value": ''},
      {'key': "Material_Type", "value": ''},
      {'key': "Issued_Qty", "value": ''},
      {'key': "Used_Qty", "value": ''},
      {'key': "Consumed_Qty", "value": '', "intialQty": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  @override
  void onInit() async {
    try {
      Get.put(FileUploadController());

      await setJcId();
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          isFacilitySelected.value = true;
          await getEmployeeList();
        }
      });

      if (jobCardId.value != 0) {
        jobCardList.value = await jobCardDetailsPresenter.getJobCardDetails(
              jobCardId: jobCardId.value,
              isLoading: true,
            ) ??
            [];
        getHistory(facilityId);
        jobCardDetailsModel.value = jobCardList.value[0];
        jobId.value = jobCardDetailsModel.value?.jobId;
        createPlantDetailsTableData();
        createJobDetailsTableData();
        createPermitDetailsTableData();
        getLocation();

        if (jobCardDetailsModel != null) {
          jobCardDetailsModel.value?.lstCmjcEmpList?.forEach((element) {
            employeesDeployed.value.add([
              {
                "key": "Employee Name",
                "value": "${element.name}",
              },
              {
                "key": "Designation",
                "value": "${element.designation ?? "No Designation"}",
              },
              {
                "key": "Action",
                "value": "",
              }
            ]);
            deployedEmployeeMapperData[element.name ?? ""] = element;
          });
        }
      }

      responsibilityCtrlrs.add(TextEditingController());
      currentIndex.value = -1;
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMrsListByModule({required int jobId}) async {
    rowItem.value = [];
    cmmrsItems!.value = <CmmrsItems>[];
    materialUsedAssets!.value = <WorkingAreaList>[];

    // Fetching the list of Mrs by Module
    listMrsByTaskId?.value = await jobCardDetailsPresenter.getMrsListByModule(
          jobId,
          facilityId,
          false,
        ) ??
        [];
    if (listMrsByTaskId?.value.length != 0) {
      var _assetsList = listMrsByTaskId!.last!.cmmrsItems ?? [];
      for (var asset in _assetsList!) {
        cmmrsItems!.add(asset);
      }

      // Populating materialUsedAssets
      var _usedassetsList =
          listMrsByTaskId!.value.last!.material_used_by_assets!;
      for (var usedasset in _usedassetsList) {
        materialUsedAssets!.add(usedasset);
      }
      if (materialUsedAssets!.value.length == 0) {
        addRowItem();
      }

      // Ensure workingAreaList is populated and not null
      if (workingAreaList != null && workingAreaList!.isNotEmpty) {
        Set<String> seenEntries = {}; // Set to keep track of unique entries

        for (var workingArea in workingAreaList!) {
          if (workingArea != null) {
            var matchedUsedAssets = materialUsedAssets!
                .where((usedAsset) => usedAsset!.asset_id == workingArea.id)
                .toList();

            for (var matchedUsedAsset in matchedUsedAssets) {
              for (var item in matchedUsedAsset!.items!) {
                var consumedQty = '';
                var dropDownEqValue = matchedUsedAsset.name ?? '';

                var cmmrsItem = cmmrsItems!.firstWhere(
                    (e) => e!.id == item.mrs_Item_Id,
                    orElse: () => null);

                if (cmmrsItem != null) {
                  consumedQty = item.used_qty.toString();

                  // Define unique criteria
                  String entryKey =
                      '${cmmrsItem.name}-${dropDownEqValue}-${cmmrsItem.serial_number}';

                  // Only add if this entry is not already seen
                  if (!seenEntries.contains(entryKey)) {
                    seenEntries.add(entryKey);

                    rowItem.add([
                      {"key": "Drop_down", "value": '${cmmrsItem.name}'},
                      {"key": "Drop_down_eq", "value": dropDownEqValue},
                      {'key': "Sr_No", "value": cmmrsItem.serial_number ?? ''},
                      {'key': "code", "value": cmmrsItem.asset_MDM_code ?? ''},
                      {
                        'key': "Material_Type",
                        "value": cmmrsItem.asset_type ?? ''
                      },
                      {
                        'key': "Issued_Qty",
                        "value": cmmrsItem.issued_qty.toString()
                      },
                      {
                        'key': "Used_Qty",
                        "value": cmmrsItem.used_qty.toString()
                      },
                      {
                        'key': "Consumed_Qty",
                        "value": consumedQty,
                        "intialQty": consumedQty
                      },
                      {'key': "Action ", "value": ''},
                    ]);

                    dropdownMapperData[cmmrsItem.name ?? ""] = cmmrsItem;
                    dropdownMapperDataworkingArea[dropDownEqValue] =
                        workingAreaList!.firstWhere(
                      (e) => e.name == dropDownEqValue,
                      orElse: () => null!,
                    );
                  }
                }
              }
            }
          }
        }
        // Debugging: Print row items
        print('Row items: $rowItem');
      }
      _processJsonData();
      allTrue.value = itemExistsWithZeroDifference.every((element) => element);
    }
    // Populating cmmrsItems
  }

  void _processJsonData() {
    itemExistsWithZeroDifference.value = cmmrsItems!.map((element) {
      double issued_qty = element!.issued_qty ?? 0;
      double used_qty = element.used_qty ?? 0;
      return (issued_qty - used_qty) == 0;
    }).toList();
    returnitemExists.value = cmmrsItems!.map((element) {
      return element!.mrs_return_ID ?? 0;
    }).toList();
  }

  Future<void> setJcId() async {
    try {
      final _jobCardId = await jobCardDetailsPresenter.getValue();

      if (_jobCardId == null || _jobCardId == '' || _jobCardId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        jobCardId.value = dataFromPreviousScreen['JcId'];
        jobCardDetailsPresenter.saveValue(
            jobCardId: jobCardId.value.toString());
      } else {
        jobCardId.value = int.tryParse(_jobCardId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'JcId');
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
    if (facilityId > 0) {
      final _employeeList = await jobCardDetailsPresenter.getAssignedToList(
          facilityId: facilityId,
          featureId: UserAccessConstants.kJobCardFeatureId);
      if (_employeeList != null) {
        for (var employee in _employeeList) {
          employeeList.add(employee);
        }
        update(["employeeList"]);
      }
      if (jobCardDetailsModel.value!.lstCmjcEmpList!.isEmpty) {
        addEmployeesDeployed();
      }
    }
  }

  Future<void> getHistory(int facilityId) async {
    int moduleType = 4;
    historyList?.value = await jobCardDetailsPresenter.getJobCardHistory(
          moduleType,
          jobCardId.value,
          facilityId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  void createPlantDetailsTableData() {
    if (jobCardList.isNotEmpty) {
      jobCardDetailsModel.value = jobCardList[0];
      equipmentCategoryNames = <String>[];
      for (var eC in jobCardDetailsModel.value?.lstPermitDetailList ?? []) {}
      strEquipmentCategories.value = equipmentCategoryNames.join(', ');
      plantDetails.value = {
        "Plant": jobCardDetailsModel.value?.plantName,
        "Block": jobCardDetailsModel.value?.blockName,
      };
    }
    file_list.value = jobCardDetailsModel.value?.fileList ?? [];
    file_list_new.value = jobCardDetailsModel.value?.fileListJc ?? [];
    allFiles.clear();
    allFiles.addAll(file_list);
    allFiles.addAll(file_list_new);
  }

  Future<void> transferItem() async {
    List<TranferItems> items = [];
    rowItem.forEach((element) {
      TranferItems item = TranferItems(
          assetItemID:
              dropdownMapperData[element[0]["value"]]?.asset_item_ID ?? 0,
          facilityID: facilityId,
          fromActorID: jobCardId.value,
          fromActorType: AppConstants.kJobCard,
          mrsID: listMrsByTaskId![0]!.mrsId ?? 0,
          mrsItemID: dropdownMapperData[element[0]["value"]]?.id ?? 0,
          qty: int.tryParse(element[7]["value"] ?? '0') ?? 0,
          refID: jobCardId.value,
          refType: AppConstants.kJobCard,
          remarks: "remarks",
          toActorID: dropdownMapperDataworkingArea[element[1]["value"]] != null
              //  &&
              //         dropdownMapperDataworkingArea[element[1]["value"]]
              //                 .workingAreaId !=
              //             null &&
              //         dropdownMapperDataworkingArea[element[1]["value"]]
              //                 .workingAreaId !=
              //             0
              ? dropdownMapperDataworkingArea[element[1]["value"]].asset_id
              : 0,
          toActorType:
              dropdownMapperDataworkingArea[element[1]["value"]] != null
                  ? AppConstants.kInventory
                  : 0,
          transaction_id:
              dropdownMapperData[element[0]["value"]]?.transaction_id ?? 0,
          latitude: latitude.value,
          longitude: longitude.value);

      items.add(item);
    });

    var transferItemJsonString = items;
    var responsetransferItem = await jobCardDetailsPresenter.transferItem(
      transferItemJsonString: transferItemJsonString,
      isLoading: true,
    );
  }

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    print('Current Position: ${position.toString()}');
  }

  void createJobDetailsTableData() {
    try {
      if (jobCardList.isNotEmpty) {
        getJobDetails(jobCardList[0]!.jobId, facilityId);
        List<String> toolsRequiredNames = jobCardDetailsModel.value?.toolList
                ?.map((tool) => tool.toolName ?? '')
                .toList() ??
            [];
        strToolsRequired.value = toolsRequiredNames.join(', ');

        workTypeNames = <String?>[];
        for (var workTypenames
            in jobCardDetailsModel.value?.lstCmjcJobDetailList ?? []) {
          if (workTypenames != null) {
            workTypeNames.add(workTypenames.workType);
          }
        }
        strWorkTypes.value = workTypeNames.join(', ');

        if (strWorkTypes.value.length > 0) {
          strWorkTypes.value = strWorkTypes.substring(
            0,
            strWorkTypes.value.length,
          );
        }
        assignNames = <String>[];
        for (var assignName
            in jobCardDetailsModel.value?.lstCmjcJobDetailList ?? []) {
          assignNames.add(assignName.jobAssignedEmployeeName);
        }
        strAssignName.value = assignNames.join(', ');

        if (strAssignName.value.length > 0) {
          strAssignName.value = strAssignName.substring(
            0,
            strAssignName.value.length,
          );
        }

        jobDetails.value = {
          "Job ID": "JOB" + jobCardDetailsModel.value!.jobId.toString(),
          "Job Title": jobCardDetailsModel.value?.title,
          "Job Description": jobCardDetailsModel.value?.description,
          "Job Assigned To": strAssignName.value,
          "Fault": strWorkTypes.value,
          "Linked Tool To Fault": strToolsRequired.value,
          "Job Created By": jobCardDetailsModel.value?.created_by,
          "Job Status": jobCardDetailsModel.value?.status_short,
        };
        getMrsListByModule(jobId: jobCardDetailsModel.value?.jobId ?? 0);
      }
    } catch (e) {
      print(e);
    }
  }

  void getJobDetails(int? jobId, int facilityId) async {
    try {
      final _jobDetailsList = await jobCardDetailsPresenter.getJobDetails(
          facilityId: facilityId, jobId: jobId, isLoading: false);

      if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
        jobDetailsModel.value = _jobDetailsList[0];
        workingAreaList?.value = jobDetailsModel.value?.workingAreaList ?? [];
        update(["jobDetailsModel"]);
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'getJobDetails');
    }
  }

  void createPermitDetailsTableData() {
    try {
      if (jobCardList.isNotEmpty) {
        jobCardDetailsModel.value = jobCardList[0];

        permitList?.value =
            jobCardDetailsModel.value!.lstPermitDetailList ?? [];

        if (permitList!.value.isNotEmpty) {
          LstPermitDetailList permit = permitList!.value
              .firstWhere((element) => element.permitId != null);
          permitIdclose.value = permit.permitId ?? 0;
          permitDetails.value = {
            "Permit ID": "PTW" + permit.permitId.toString(),
            "Permit Type": permit.permitType,
            "Permit Description": permit.permitDescription,
            "Permit Requested By": permit.permitIssuedByName ?? "",
            "Permit Approved By": permit.permitApprovedByName ?? "",
            "Permit Status": permit.status_short ?? ""
          };
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void updateJobCard({List<dynamic>? fileIds}) async {
    try {
      var _isolatedAssetCatList = [];
      for (IsolationAssetsCategory isolationAssetsCategory
          in isolationAssetsCategoryList) {
        _isolatedAssetCatList.add({
          "isolation_id": isolationAssetsCategory.isolationAssetsCatId,
          "normalisedStatus": isolationAssetsCategory.isNormalized ?? 0,
        });
      }

      List<EmployeeModel> employees = [];
      employeesDeployed.forEach((element) {
        EmployeeModel item = EmployeeModel(
          id: int.parse(
              deployedEmployeeMapperData[element[0]["value"]]?.id.toString() ??
                  '0'),
          designation: element[1]["value"] ?? '0',
        );
        employees.add(item);
      });

      var _lotoAssetList = [];
      for (LotoAsset lotoAsset in lotoAppliedAssets) {
        _lotoAssetList.add({
          "loto_id": lotoAsset.lotoId,
          "lotoRemovedStatus": lotoAsset.removedStatus,
        });
      }
      var _comment = descriptionOfWorkDoneCtrlr.text.trim();
      var jobCard = {
        "id": jobCardId.value,
        "comment": _comment,
        "status": 1,
        "is_isolation_required": true,
        "isolated_list": _isolatedAssetCatList,
        "loto_list": _lotoAssetList,
        "employee_list": employees,
        "uploadfile_ids": fileIds,
      };

      Map<String, dynamic>? responseMapJobCardUpdated =
          await jobCardDetailsPresenter.updateJobCard(
        jobCard,
        true,
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
      }
    } catch (e) {
      print(e);
    }
  }

  void onDropdownValueChanged(dropdownList, selectedValue) {
    selectedEmployeeName.value = selectedValue;
    int employeeId =
        employeeList.indexWhere((element) => element!.name == selectedValue);
    selectedEmployeeId = employeeList[employeeId]!.id ?? 0;
  }

  startStopJobCard() {
    isJobCardStarted.value = !isJobCardStarted.value;
  }

  Future<void> createJobCard(int jobId) async {
    await startStopJobCard();
    if (isJobCardStarted.value == true) {
      Map<String, dynamic>? responseMapJobCardStarted =
          await jobCardDetailsPresenter.createJobCard(
        jobId: jobId,
        isLoading: true,
      );

      if (responseMapJobCardStarted != null &&
          responseMapJobCardStarted.length > 0) {
        final _jobCardId = responseMapJobCardStarted["id"][0];
        jobCardId.value = _jobCardId;
      }
    }
    getHistory(facilityId);
  }

  Future<void> startJobCard(
      {required int jcCard, List<dynamic>? fileIds}) async {
    await startStopJobCard();

    List<EmployeeModel> employees = [];
    employeesDeployed.forEach((element) {
      EmployeeModel item = EmployeeModel(
        id: deployedEmployeeMapperData[element[0]["value"]]?.id,
        designation: element[1]["value"] ?? '0',
      );
      employees.add(item);
    });

    var jobCard = {
      "jc_id": jcCard,
      "request": {"uploadfile_ids": fileIds, "LstCMJCEmpList": employees}
    };

    if (isJobCardStarted.value == true) {
      Map<String, dynamic>? responseMapJobCardStarted =
          await jobCardDetailsPresenter.startJobCard(
        jcCard: jcCard,
        jobCard: jobCard,
        isLoading: true,
      );

      if (responseMapJobCardStarted != null &&
          responseMapJobCardStarted.length > 0) {
        jobCardList.value = await jobCardDetailsPresenter.getJobCardDetails(
              jobCardId: jobCardId.value,
              isLoading: true,
            ) ??
            [];
        await getHistory(facilityId);
      }
    }
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

  void getPermitDetails(int facilityId, int? permitId) async {
    final _permitDetails = await jobCardDetailsPresenter.getPermitDetails(
        permitId: permitId, facilityId: facilityId);

    isolationAssetsCategoryList.value = _permitDetails?.lstIsolation ?? [];
    lotoAppliedAssets.value = _permitDetails?.lstLoto ?? [];
  }

  void closeJob({List<dynamic>? fileIds}) async {
    int isolationId = 0;
    for (IsolationAssetsCategory isolationAssetsCategory
        in isolationAssetsCategoryList) {
      isolationId = isolationAssetsCategory.isolationAssetsCatId ?? 0;
    }

    int lotoStatus = 0;
    int lotoId = 0;

    for (LotoAsset lotoAsset in lotoAppliedAssets) {
      lotoStatus = lotoAsset.removedStatus ?? 0;
      lotoId = lotoAsset.lotoId ?? 0;
    }
    int _employeeId = 0;

    for (EmployeeModel employee in selectedEmployeeList ?? []) {
      _employeeId = employee.id ?? 0;
    }

    var _comment = descriptionOfWorkDoneCtrlr.text.trim();
    ClosePermitModel ptwClose = ClosePermitModel(
        id: permitIdclose.value,
        comment: _comment,
        conditionIds: [1, 2, 3, 4],
        fileIds: []);
    var jobCard = {
      "id": jobCardId.value,
      "isolationId": isolationId,
      "lotoId": lotoId,
      "comment": _comment,
      "employee_id": _employeeId,
      "normalisedStatus": 1,
      "lotoStatus": lotoStatus,
      "uploadfile_ids": fileIds,
    };
    var closePtwJsonString = ptwClose.toJson();

    Map<String, dynamic>? responseCarryForwardJCModel =
        await jobCardDetailsPresenter.closeJob(
      jobCard,
      true,
      closePtwJsonString,
    );

    if (responseCarryForwardJCModel == null) {}
  }

  void appcommentcheckform() {
    if (approveCommentTextFieldCtrlr.text == '') {
      isformInvalid.value = true;
    } else {
      isformInvalid.value = false;
    }
  }

  void rejcommentcheckform() {
    if (rejectCommentTextFieldCtrlr.text == '') {
      isformInvalid.value = true;
    } else {
      isformInvalid.value = false;
    }
  }

  void carryForwardJob({List<dynamic>? fileIds}) async {
    int isolationId = 0;
    for (IsolationAssetsCategory isolationAssetsCategory
        in isolationAssetsCategoryList) {
      isolationId = isolationAssetsCategory.isolationAssetsCatId ?? 0;
    }

    int lotoStatus = 0;
    int lotoId = 0;

    for (LotoAsset lotoAsset in lotoAppliedAssets) {
      lotoStatus = lotoAsset.removedStatus ?? 0;
      lotoId = lotoAsset.lotoId ?? 0;
    }

    List<EmployeeModel> employees = [];
    employeesDeployed.forEach((element) {
      EmployeeModel item = EmployeeModel(
        id: deployedEmployeeMapperData[element[0]["value"]]?.id,
        designation: element[1]["value"] ?? '0',
      );
      employees.add(item);
    });

    var _comment = descriptionOfWorkDoneCtrlr.text.trim();

    var jobCard = {
      "id": jobCardId.value,
      "isolationId": isolationId,
      "lotoId": lotoId,
      "comment": _comment,
      "employee_list": employees,
      "normalisedStatus": 1,
      "lotoStatus": lotoStatus,
      "uploadfile_ids": fileIds,
    };
    Map<String, dynamic>? responseCarryForwardJCModel =
        await jobCardDetailsPresenter.carryForwardJob(
      jobCard,
      true,
    );

    if (responseCarryForwardJCModel == null) {}
  }

  void approveJobCards() async {
    {
      appcommentcheckform();
      if (isformInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please enter Comment!");
        return;
      }
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: jobCardId.value, comment: _comment);

      var approveJsonString = commentCalibrationModel.toJson();
      final response = await jobCardDetailsPresenter.approveJobCards(
        approveJsonString: approveJsonString,
        isLoading: true,
      );
      if (response == true) {
        try {
          Get.put(FileUploadController());

          final _flutterSecureStorage = const FlutterSecureStorage();

          jobCardList.value = await jobCardDetailsPresenter.getJobCardDetails(
                jobCardId: jobCardId.value,
                isLoading: true,
              ) ??
              [];
          getHistory(facilityId);
          createPlantDetailsTableData();

          createJobDetailsTableData();
          createPermitDetailsTableData();
          getEmployeeList();

          responsibilityCtrlrs.add(TextEditingController());
          currentIndex.value = -1;
        } catch (e) {
          print(e);
        }
      }
    }
  }

  void rejectJobCard() async {
    {
      rejcommentcheckform();
      if (isformInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: jobCardId.value, comment: _comment);

      var rejectJsonString = commentCalibrationModel.toJson();
      final response = await jobCardDetailsPresenter.rejectJobCard(
        rejectJsonString: rejectJsonString,
        isLoading: true,
      );
      if (response == true) {}
    }
  }

  void approvecloseJob() async {
    {
      appcommentcheckform();
      if (isformInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please enter Comment!");
        return;
      }
      String _comment = approveCommentTextFieldCtrlr.text.trim();
      int ptwId = jobCardDetailsModel.value?.ptwId ?? 0;
      CommentModel commentCalibrationModel =
          CommentModel(id: jobCardId.value, comment: _comment);
      ClosePermitModel ptwClose = ClosePermitModel(
          id: ptwId, comment: comment, conditionIds: [1, 2, 3, 4], fileIds: []);
      var closePtwJsonString = ptwClose.toJson();
      var approveJsonString = commentCalibrationModel.toJson();
      final response = await jobCardDetailsPresenter.approvecloseJob(
        approveJsonString: approveJsonString,
        closePtwJsonString: closePtwJsonString,
        isLoading: true,
      );
      if (response == true) {
        try {
          Get.put(FileUploadController());

          jobCardList.value = await jobCardDetailsPresenter.getJobCardDetails(
                jobCardId: jobCardId.value,
                isLoading: true,
              ) ??
              [];
          getHistory(facilityId);
          createPlantDetailsTableData();

          createJobDetailsTableData();
          createPermitDetailsTableData();
          getEmployeeList();

          responsibilityCtrlrs.add(TextEditingController());
          currentIndex.value = -1;
        } catch (e) {
          print(e);
        }
      }
    }
  }

  void rejectcloseJob() async {
    {
      rejcommentcheckform();
      if (isformInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: jobCardId.value, comment: _comment);

      var rejectJsonString = commentCalibrationModel.toJson();
      final response = await jobCardDetailsPresenter.rejectcloseJob(
        rejectJsonString: rejectJsonString,
        isLoading: true,
      );
      if (response == true) {}
    }
  }

  String? getResponsibility(index) {
    final responsibitlity = responsibilityCtrlrs[index].text;
    return responsibitlity;
  }

  goToJobCardListScreen() {
    Get.back();
    final _flutterSecureStorage = const FlutterSecureStorage();
    _flutterSecureStorage.delete(key: "jobId");
    Get.offAllNamed(Routes.jobList);
  }

  void goToJobCardScreen() {
    Get.back();
  }

  goToAddJobScreen() {
    Get.offAllNamed(Routes.jobDetails,
        arguments: {'jobId': jobDetailsModel.value?.id});
  }

  void addNewEmployee(EmployeeModel selectedEmployee, String responsibility) {
    final uniqueKey = UniqueKey();
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
                deleteEmployee(uniqueKey);
              }),
        ),
      ],
    );

    selectedEmployees = EmployeeModel(
      id: selectedEmployeeId,
      designation: responsibility,
    );
    employee.add(selectedEmployees);
    employeeTableRows.add(newRow);

    responsibilityCtrlr.clear();
    selectedEmployeeName.value = '';
  }

  void deleteEmployee(Key key) {
    final index = employeeTableRows.indexWhere((row) => row.key == key);
    if (index != -1) {
      employeeTableRows.removeAt(index);
      employee.removeAt(index);
    }
  }

  void showAlertDialog({
    int? jobId,
    String? message,
    String? title,
    Function()? onPress,
    Widget? dialog,
  }) async {
    await Get.dialog<void>(dialog ?? SizedBox());
  }
}
