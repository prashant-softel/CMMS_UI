import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:cmms/app/utils/save_file_web.dart';
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
import 'package:http/http.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
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
              ? dropdownMapperDataworkingArea[element[1]["value"]].id
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
          "Job Created By": jobCardDetailsModel.value?.createdBy,
          "Job Status": jobCardDetailsModel.value?.statusShort,
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
            "Permit Status": permit.statusShort ?? ""
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

  Future<void> generateInvoice() async {
    final PdfDocument document = PdfDocument();

    final PdfPage page = document.pages.add();

    final Size pageSize = page.getClientSize();

    var url = "assets/assets/files/HFE Logo.png";
    // var url = "assets/files/hfeLogo.jpg";

    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;

    PdfBitmap image = PdfBitmap(data);

    final PdfLayoutResult result = drawHeader(page, pageSize, document, image);

    final List<int> bytes = await document.save();

    document.dispose();

    await saveAndLaunchFile(bytes, 'Job Card Report.pdf');
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    final PdfPen borderPen = PdfPen(PdfColor(142, 180, 219), width: 1.0);
    final PdfBrush backgroundBrush = PdfSolidBrush(PdfColor(217, 226, 243));
    final PdfFont headerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);

    double margin = 10; // Margin from all sides
    double currentY =
        100; // Start position for the first section below the image
    double sectionHeight = 20; // Height for each section header
    double pageWidth = pageSize.width - 2 * margin;

    // Draw images
    page.graphics.drawImage(image, Rect.fromLTWH(margin, 10, 100, 80));

    final String centerText = 'Job Card Report';
    final PdfFont centerTextFont =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    final Size centerTextSize = centerTextFont.measureString(centerText);

    // Calculate the X position to center the text
    double centerX = (pageSize.width - centerTextSize.width) / 2;

    // Draw the center text after the image
    page.graphics.drawString(
      centerText,
      centerTextFont,
      bounds: Rect.fromLTWH(
          centerX, 60, centerTextSize.width, centerTextSize.height),
    );

    // Site name section
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString(
        'Site name : ${jobCardDetailsModel.value?.plantName ?? ''}', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // PM Information
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Job Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw PM Information Details (Left Side)
    double labelWidth = 80;
    double valueWidth = 120;
    double labelX = margin + 5;
    double valueX = labelX + labelWidth + 5;

    List<String> pmInfoLabelsLeft = [
      'Job ID',
      'Breakdown start time',
      'Job raised on',
      'Type of Job',
      'Performed by'
    ];
    List<String> pmInfoValuesLeft = [
      'JOB${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.jobId ?? ''}',
      '${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.breakdownStartTime ?? ''}',
      '${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.jobRaisedOn ?? ''}',
      '${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.typeOfJob ?? ''}',
      '${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.performBy ?? ''}',
    ];
    double rowHeight = 15;

    for (int i = 0; i < pmInfoLabelsLeft.length; i++) {
      page.graphics.drawString(pmInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(pmInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw PM Information Details (Right Side)
    double labelWidthRight = 80;
    double valueWidthRight = 120;
    double labelXRight = pageWidth / 2 + margin; // Position on the right side
    double valueXRight = labelXRight + labelWidthRight + 5;

    List<String> pmInfoLabelsRight = [
      'Job title',
      'Breakdown end time',
      'Job closed on',
      'TAT'
    ];
    List<String> pmInfoValuesRight = [
      '${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.jobTitle ?? ''}',
      jobCardDetailsModel.value!.status == 158
          ? '${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.breakdownEndTime ?? ''}'
          : "",
      jobCardDetailsModel.value!.status == 158
          ? '${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.jobClosedOn ?? ''}'
          : "",
      '${jobCardDetailsModel.value?.lstCmjcJobDetailList?.first.turnaroundTimeMinutes ?? ''} Minutes',
    ];

    currentY -= pmInfoLabelsLeft.length *
        rowHeight; // Reset currentY to align with left side

    for (int i = 0; i < pmInfoLabelsRight.length; i++) {
      page.graphics.drawString(pmInfoLabelsRight[i], contentFont,
          bounds: Rect.fromLTWH(
              labelXRight, currentY + 5, labelWidthRight, rowHeight));
      page.graphics.drawString(pmInfoValuesRight[i], contentFont,
          bounds: Rect.fromLTWH(
              valueXRight, currentY + 5, valueWidthRight, rowHeight));
      currentY += rowHeight;
    }

    // Draw Equipment details
    currentY += 20; // Adding some space before the next section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Equipment details', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw Equipment Details Table
    double columnWidth = pageWidth / 3;
    List<String> equipmentHeaders = [
      'S. No',
      'Equipment category',
      'Equipment name'
    ];

    for (int i = 0; i < equipmentHeaders.length; i++) {
      page.graphics.drawString(equipmentHeaders[i], contentFont,
          bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
              columnWidth, rowHeight));
    }

    currentY += rowHeight;

    // Draw each equipment name from the schedules
    for (int i = 0;
        i < (jobCardDetailsModel.value?.assetCategoryName?.length ?? 0);
        i++) {
      var schedule = jobCardDetailsModel.value!.assetCategoryName![i];

      page.graphics.drawString('${i + 1}', contentFont,
          bounds: Rect.fromLTWH(
              margin, currentY + 5, columnWidth, rowHeight)); // S. No
      page.graphics.drawString(
          '${schedule.equipmentCategory ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + columnWidth, currentY + 5, columnWidth,
              rowHeight)); // Equipment category
      page.graphics.drawString('${schedule.equipmentName ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
              columnWidth, rowHeight)); // Equipment name

      currentY += rowHeight;
    }
    // Permit carried by section
    currentY += 10; // Adding some space before the next section

// Draw the permit section with header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Permit carried by', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

// Define static widths for the columns
    double serialNoWidth = 40; // Width for S. No
    double employeeIdWidth = 80; // Width for Employee ID
    double employeeNameWidth = 180; // Width for Employee Name
    double companyWidth = pageWidth -
        (serialNoWidth +
            employeeIdWidth +
            employeeNameWidth); // Remaining width for Company

// Headers for Permit carried by section
    List<String> permitHeaders = [
      'S. No',
      'Employee ID',
      'Employee name',
      'Company'
    ];

// Draw the headers with static widths
    page.graphics.drawString(permitHeaders[0], contentFont,
        bounds: Rect.fromLTWH(margin, currentY + 5, serialNoWidth, rowHeight));
    page.graphics.drawString(permitHeaders[1], contentFont,
        bounds: Rect.fromLTWH(
            margin + serialNoWidth, currentY + 5, employeeIdWidth, rowHeight));
    page.graphics.drawString(permitHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidth + employeeIdWidth,
            currentY + 5, employeeNameWidth, rowHeight));
    page.graphics.drawString(permitHeaders[3], contentFont,
        bounds: Rect.fromLTWH(
            margin + serialNoWidth + employeeIdWidth + employeeNameWidth,
            currentY + 5,
            companyWidth,
            rowHeight));

    currentY += rowHeight;

    if (jobCardDetailsModel.value!.lstCmjcJobDetailList != null &&
        jobCardDetailsModel.value!.lstCmjcJobDetailList!.isNotEmpty) {
      int serialNo = 1;
      for (var permit in jobCardDetailsModel.value!.lstCmjcJobDetailList!) {
        // Draw Permit Data
        page.graphics.drawString('$serialNo', contentFont,
            bounds: Rect.fromLTWH(
                margin, currentY + 5, serialNoWidth, rowHeight)); // S. No
        page.graphics.drawString('${permit.employee_ID ?? ''}', contentFont,
            bounds: Rect.fromLTWH(margin + serialNoWidth, currentY + 5,
                employeeIdWidth, rowHeight)); // Employee ID
        page.graphics.drawString('${permit.employee_name ?? ''}', contentFont,
            bounds: Rect.fromLTWH(
                margin + serialNoWidth + employeeIdWidth,
                currentY + 5,
                employeeNameWidth,
                rowHeight)); // Employee name (assuming it's permitIssuedByName)
        page.graphics.drawString('${permit.company ?? ''}', contentFont,
            bounds: Rect.fromLTWH(
                margin + serialNoWidth + employeeIdWidth + employeeNameWidth,
                currentY + 5,
                companyWidth,
                rowHeight)); // Company (assuming it's permitApprovedByName)

        currentY += rowHeight;
        serialNo++;
      }
    } else {
      // Draw the "No permit carried out" message below the headers
      page.graphics.drawString('No Permit Carried Out', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

    // PTW Information section
    currentY += 10; // Adding some space before the next section

    // Draw the PTW Information section header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('PTW Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Define static widths for the S. No, PTW ID, and Isolation taken columns
    // double serialNoWidth = 40; // Width for S. No
    double ptwIdWidth = 50; // Width for PTW ID
    double isolationTakenWidth = 80; // Width for Isolation taken
    double remainingWidth = pageWidth -
        (ptwIdWidth +
            serialNoWidth +
            isolationTakenWidth); // Calculate remaining width

    // Headers for PTW Information section
    List<String> ptwHeaders = [
      'S. No',
      'PTW ID',
      'Isolation taken',
      'Permit type',
      'Isolated equipment\'s'
    ];

    // Draw the headers with static widths
    page.graphics.drawString(ptwHeaders[0], contentFont,
        bounds: Rect.fromLTWH(margin, currentY + 5, serialNoWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[1], contentFont,
        bounds: Rect.fromLTWH(
            margin + serialNoWidth, currentY + 5, ptwIdWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidth + ptwIdWidth, currentY + 5,
            isolationTakenWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[3], contentFont,
        bounds: Rect.fromLTWH(
            margin + serialNoWidth + ptwIdWidth + isolationTakenWidth,
            currentY + 5,
            remainingWidth / 2,
            rowHeight));
    page.graphics.drawString(ptwHeaders[4], contentFont,
        bounds: Rect.fromLTWH(
            margin +
                serialNoWidth +
                ptwIdWidth +
                isolationTakenWidth +
                remainingWidth / 2,
            currentY + 5,
            remainingWidth / 2,
            rowHeight));

    currentY += rowHeight;

    if (jobCardDetailsModel.value!.lstPermitDetailList != null &&
        jobCardDetailsModel.value!.lstPermitDetailList!.isNotEmpty) {
      int serialNo = 1;
      for (var permit in jobCardDetailsModel.value!.lstPermitDetailList!) {
        // Draw the PTW data
        page.graphics.drawString('$serialNo', contentFont,
            bounds: Rect.fromLTWH(
                margin, currentY + 5, serialNoWidth, rowHeight)); // S. No
        page.graphics.drawString('${permit.permitId ?? ''}', contentFont,
            bounds: Rect.fromLTWH(margin + serialNoWidth, currentY + 5,
                ptwIdWidth, rowHeight)); // PTW ID
        page.graphics.drawString('${permit.isolationTaken ?? ''}', contentFont,
            bounds: Rect.fromLTWH(
                margin + serialNoWidth + ptwIdWidth,
                currentY + 5,
                isolationTakenWidth,
                rowHeight)); // Isolation taken
        page.graphics.drawString('${permit.permitType ?? ''}', contentFont,
            bounds: Rect.fromLTWH(
                margin + serialNoWidth + ptwIdWidth + isolationTakenWidth,
                currentY + 5,
                remainingWidth / 2,
                rowHeight)); // Permit type
        page.graphics.drawString(
            '${permit.isolatedEquipment ?? ''}', contentFont,
            bounds: Rect.fromLTWH(
                margin +
                    serialNoWidth +
                    ptwIdWidth +
                    isolationTakenWidth +
                    remainingWidth / 2,
                currentY + 5,
                remainingWidth / 2,
                rowHeight)); // Isolated equipment's

        currentY += rowHeight;
        serialNo++;
      }
    } else {
      // Draw the "No PTW information available" message below the headers
      page.graphics.drawString('No PTW information available', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

    // TBT section header
    currentY += 25; // Adding some space before the next section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('TBT conducted by', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Define static widths for the TBT table columns
    double tbtConductedByWidth = pageWidth / 4; // Width for 'TBT conducted by'
    double tbtDoneTimeWidth = pageWidth / 4; // Width for 'TBT done time'
    double startTimeWidth = pageWidth / 4; // Width for 'Start time'
    double statusWidth = pageWidth / 4; // Width for 'Status'

    // Headers for TBT section
    List<String> tbtHeaders = [
      'TBT conducted by',
      'TBT done time',
      'Start time',
      'Status'
    ];

    // Draw the headers with static widths
    page.graphics.drawString(tbtHeaders[0], contentFont,
        bounds: Rect.fromLTWH(
            margin, currentY + 5, tbtConductedByWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[1], contentFont,
        bounds: Rect.fromLTWH(margin + tbtConductedByWidth, currentY + 5,
            tbtDoneTimeWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + tbtConductedByWidth + tbtDoneTimeWidth,
            currentY + 5, startTimeWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[3], contentFont,
        bounds: Rect.fromLTWH(
            margin + tbtConductedByWidth + tbtDoneTimeWidth + startTimeWidth,
            currentY + 5,
            statusWidth,
            rowHeight));

    currentY += rowHeight;

    if (jobCardDetailsModel.value!.lstPermitDetailList != null &&
        jobCardDetailsModel.value!.lstPermitDetailList!.isNotEmpty) {
      for (var permit in jobCardDetailsModel.value!.lstPermitDetailList!) {
        if (permit.tbTDoneCheck == 1) {
          // Draw the TBT data
          page.graphics.drawString(
              '${permit.tbTConductedByName ?? ''}', contentFont,
              bounds: Rect.fromLTWH(margin, currentY + 5, tbtConductedByWidth,
                  rowHeight)); // TBT conducted by
          page.graphics.drawString(
              '${permit.tbTDoneTime == "0001-01-01T00:00:00" ? '' : permit.tbTDoneTime ?? ''}',
              contentFont,
              bounds: Rect.fromLTWH(margin + tbtConductedByWidth, currentY + 5,
                  tbtDoneTimeWidth, rowHeight)); // TBT done time
          page.graphics.drawString(
              '${permit.startTime == "0001-01-01T00:00:00" ? '' : permit.startTime ?? ''}',
              contentFont,
              bounds: Rect.fromLTWH(
                  margin + tbtConductedByWidth + tbtDoneTimeWidth,
                  currentY + 5,
                  startTimeWidth,
                  rowHeight)); // Start time
          page.graphics.drawString('${permit.statusShort ?? ''}', contentFont,
              bounds: Rect.fromLTWH(
                  margin +
                      tbtConductedByWidth +
                      tbtDoneTimeWidth +
                      startTimeWidth,
                  currentY + 5,
                  statusWidth,
                  rowHeight)); // Status

          currentY += rowHeight;
        }
      }
    } else {
      // Draw the "No TBT information available" message below the headers
      page.graphics.drawString('No TBT information available', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

    // Work description section
    currentY += 25;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Work description', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Add static description after Work description
    page.graphics.drawString(
        '${jobCardDetailsModel.value?.description ?? ''}', contentFont,
        bounds: Rect.fromLTWH(
            margin + 5, currentY + 5, pageWidth - 10, rowHeight * 2),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));
    currentY += rowHeight * 2;

    // Material consumption section
    currentY += 10;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Material consumption', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Define static widths
    double eqpIdWidth = 50;
    double idWidth = 40;
    double typeWidth = 80;
    double issuedQtyWidth = 60;
    double usedQtyWidth = 60;

    // Calculate remaining width for the name column
    double nameColumnWidth = pageWidth -
        (eqpIdWidth + idWidth + typeWidth + issuedQtyWidth + usedQtyWidth);

    // Draw the headers
    page.graphics.drawString('Eqp ID', contentFont,
        bounds: Rect.fromLTWH(margin, currentY + 5, eqpIdWidth, rowHeight));
    page.graphics.drawString('ID', contentFont,
        bounds: Rect.fromLTWH(
            margin + eqpIdWidth, currentY + 5, idWidth, rowHeight));
    page.graphics.drawString('name', contentFont,
        bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth, currentY + 5,
            nameColumnWidth, rowHeight));
    page.graphics.drawString('type', contentFont,
        bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth + nameColumnWidth,
            currentY + 5, typeWidth, rowHeight));
    page.graphics.drawString('Issued Qty', contentFont,
        bounds: Rect.fromLTWH(
            margin + eqpIdWidth + idWidth + nameColumnWidth + typeWidth,
            currentY + 5,
            issuedQtyWidth,
            rowHeight));
    page.graphics.drawString('Used Qty', contentFont,
        bounds: Rect.fromLTWH(
            margin +
                eqpIdWidth +
                idWidth +
                nameColumnWidth +
                typeWidth +
                issuedQtyWidth,
            currentY + 5,
            usedQtyWidth,
            rowHeight));

    currentY += rowHeight;

    // Draw the material consumption data
    for (int i = 0;
        i < (jobCardDetailsModel.value?.materialConsumption?.length ?? 0);
        i++) {
      var materialConsumption =
          jobCardDetailsModel.value!.materialConsumption![i];

      page.graphics.drawString(
          '${materialConsumption.equipmentId ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin, currentY + 5, eqpIdWidth, rowHeight)); // Equipment ID

      page.graphics.drawString(
          '${materialConsumption.materialId ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth, currentY + 5, idWidth,
              rowHeight)); // Material ID

      page.graphics.drawString(
          '${materialConsumption.materialName ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth, currentY + 5,
              nameColumnWidth, rowHeight)); // Material name

      page.graphics.drawString(
          '${materialConsumption.materialType ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth + nameColumnWidth,
              currentY + 5, typeWidth, rowHeight)); // Material type

      page.graphics.drawString(
          '${materialConsumption.issuedQty ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin + eqpIdWidth + idWidth + nameColumnWidth + typeWidth,
              currentY + 5,
              issuedQtyWidth,
              rowHeight)); // Issued quantity

      page.graphics.drawString(
          '${materialConsumption.usedQty ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  eqpIdWidth +
                  idWidth +
                  nameColumnWidth +
                  typeWidth +
                  issuedQtyWidth,
              currentY + 5,
              usedQtyWidth,
              rowHeight)); // Used quantity

      currentY += rowHeight;
    }

    // Tools carried section
    // Set the starting position for the Tools carried section
    currentY += 25; // Adding some space before the next section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Tools carried', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

// Define column widths for Tools carried section
    double serialNoWidthTools = 40;
    double toolNameWidth = pageWidth / 2;
    double toolCountWidth = pageWidth - serialNoWidthTools - toolNameWidth;

// Draw the column headers for Tools carried section
    List<String> toolsHeaders = ['S. No', 'Tool name', 'No. of tools'];

    page.graphics.drawString(toolsHeaders[0], contentFont,
        bounds:
            Rect.fromLTWH(margin, currentY + 5, serialNoWidthTools, rowHeight));
    page.graphics.drawString(toolsHeaders[1], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidthTools, currentY + 5,
            toolNameWidth, rowHeight));
    page.graphics.drawString(toolsHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidthTools + toolNameWidth,
            currentY + 5, toolCountWidth, rowHeight));

    currentY += rowHeight;

// Loop through each tool in the toolList to draw the rows for Tools carried section
    int toolIndex = 1; // Initialize tool serial number

    for (var tool in jobCardDetailsModel.value!.toolList ?? []) {
      if (tool.toolName != null &&
          tool.noOfTools != null &&
          tool.noOfTools! > 0) {
        page.graphics.drawString('$toolIndex', contentFont,
            bounds: Rect.fromLTWH(
                margin, currentY + 5, serialNoWidthTools, rowHeight)); // S. No

        page.graphics.drawString(tool.toolName ?? '', contentFont,
            bounds: Rect.fromLTWH(margin + serialNoWidthTools, currentY + 5,
                toolNameWidth, rowHeight)); // Tool name

        page.graphics.drawString('${tool.noOfTools}', contentFont,
            bounds: Rect.fromLTWH(margin + serialNoWidthTools + toolNameWidth,
                currentY + 5, toolCountWidth, rowHeight)); // No. of tools

        currentY += rowHeight;
        toolIndex++;
      }
    }

// If no tools are found, add a message indicating that
    if (toolIndex == 1) {
      page.graphics.drawString('No tools carried', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));
      currentY += rowHeight;
    }

    // Remarks field
    currentY += 25;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Remarks', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    page.graphics.drawString(
        '${jobCardDetailsModel.value?.remarkNew ?? ''}', contentFont,
        bounds: Rect.fromLTWH(
            margin + 5, currentY + 5, pageWidth - 10, rowHeight * 2),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));
    currentY += rowHeight * 2;

// PM History section
    double pageHeight = pageSize.height;

// Define static widths for the columns in the history section
    double timeStampWidth = 100; // Width for Time Stamp
    double postedByWidth = 80; // Width for Posted By
    double commentsWidth = 200; // Width for Comments
    // double statusWidth = pageWidth -
    //     (timeStampWidth +
    //         postedByWidth +
    //         commentsWidth); // Remaining width for Status

    for (var history in historyList!.value) {
      // Check if we need to add a new page
      if (currentY + rowHeight > pageHeight - margin) {
        // Add a new page and reset the currentY
        page = document.pages.add();
        currentY = margin; // Reset Y position for the new page

        // Re-draw the "PM History" header on the new page
        page.graphics.drawRectangle(
            pen: borderPen,
            brush: backgroundBrush,
            bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
        page.graphics.drawString('JOB Card History', headerFont,
            bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
        currentY += sectionHeight;

        // Draw column headers for "PM History" with static widths
        List<String> historyHeaders = [
          'Time Stamp',
          'Posted By',
          'Comments',
          'Status'
        ];

        page.graphics.drawString(historyHeaders[0], contentFont,
            bounds:
                Rect.fromLTWH(margin, currentY + 5, timeStampWidth, rowHeight));
        page.graphics.drawString(historyHeaders[1], contentFont,
            bounds: Rect.fromLTWH(margin + timeStampWidth, currentY + 5,
                postedByWidth, rowHeight));
        page.graphics.drawString(historyHeaders[2], contentFont,
            bounds: Rect.fromLTWH(margin + timeStampWidth + postedByWidth,
                currentY + 5, commentsWidth, rowHeight));
        page.graphics.drawString(historyHeaders[3], contentFont,
            bounds: Rect.fromLTWH(
                margin + timeStampWidth + postedByWidth + commentsWidth,
                currentY + 5,
                statusWidth,
                rowHeight));

        currentY += rowHeight; // Move down after drawing headers
      }

      // Render history items with static widths
      if (history != null) {
        String timeStamp = history.createdAt?.result != null
            ? history.createdAt!.result
                .toString()
                .substring(0, 16)
                .replaceFirst('T', ' ')
            : 'N/A';
        String postedBy = history.createdByName ?? 'Unknown';
        String comments = history.comment ?? 'No comments';
        String status = history.status_name ?? 'Unknown status';

        page.graphics.drawString(timeStamp, contentFont,
            bounds:
                Rect.fromLTWH(margin, currentY + 5, timeStampWidth, rowHeight));
        page.graphics.drawString(postedBy, contentFont,
            bounds: Rect.fromLTWH(margin + timeStampWidth, currentY + 5,
                postedByWidth, rowHeight));
        page.graphics.drawString(comments, contentFont,
            bounds: Rect.fromLTWH(margin + timeStampWidth + postedByWidth,
                currentY + 5, commentsWidth, rowHeight));
        page.graphics.drawString(status, contentFont,
            bounds: Rect.fromLTWH(
                margin + timeStampWidth + postedByWidth + commentsWidth,
                currentY + 5,
                statusWidth,
                rowHeight));

        currentY += rowHeight;
      }
    }

    final String signatureText = 'Signature';
    final Size signatureSize = contentFont.measureString(signatureText);
    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageWidth - (signatureSize.width + margin),
            currentY + 20, signatureSize.width, signatureSize.height))!;
  }
}
