import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/add_job_model.dart';
import '../../domain/models/employee_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/tools_model.dart';
import '../job_list/job_list_presenter.dart';
import '../navigators/app_pages.dart';
import 'add_job_presenter.dart';

class AddJobController extends GetxController {
  ///
  AddJobController(
      this.addJobPresenter, this.jobListPresenter, this.homePresenter);
  AddJobPresenter addJobPresenter;
  HomePresenter homePresenter;
  JobListPresenter jobListPresenter;

  ///
  RxList<JobModel?>? jobList = <JobModel?>[].obs;

  //
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = true.obs;
  int selectedFacilityId = 0;
  //
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isBlockSelected = true.obs;
  int selectedBlockId = 0;
  //
  Rx<String> selectedEquipment = ''.obs;
  Rx<bool> isEquipmentSelected = true.obs;
  RxList<EquipmentModel?> equipmentList = <EquipmentModel>[].obs;

  //
  Rx<String> selectedWorkArea = ''.obs;
  Rx<bool> isWorkAreaSelected = true.obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<InventoryModel?> selectedWorkAreaList = <InventoryModel>[].obs;
  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;
  //
  Rx<String> selectedEquipmentCategory = ''.obs;
  Rx<bool> isEquipmentCategorySelected = false.obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  //
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;
  //
  Rx<String> selectedToolRequiredToWorkType = ''.obs;
  Rx<bool> isToolRequiredToWorkTypeSelected = false.obs;
  RxList<ToolsModel?>? toolsRequiredToWorkTypeList = <ToolsModel>[].obs;
  RxList<String?> selectedtoolsRequiredToWorkTypeList = <String>[].obs;
  RxList<int?> selectedtoolsRequiredToWorkTypeIdList = <int>[].obs;

  ///
  int selectedPermitId = 0;
  int facilityId = 45;
  List<int> categoryIds = [];
  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isJobTitleInvalid = false.obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;
  var breakdownTime;
  var jobDescriptionCtrlr = TextEditingController();
  var jobTitleCtrlr = TextEditingController();

  ///
  @override
  void onInit() async {
    await homePresenter.generateToken();
    await getFacilityList();
    await getBlocksList(facilityId);
    await getAssignedToList();
    await getInventoryCategoryList(facilityId.toString());

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await jobListPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      // if (facilityList.isNotEmpty) {
      //   selectedFacility.value = facilityList[0]?.name ?? '';
      // }
    }
  }

  Future<void> getBlocksList(int _facilityId) async {
    final _blockList =
        await addJobPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      update(["jobList"]);
    }
  }

  Future<void> getAssignedToList() async {
    final _assignedToList =
        await addJobPresenter.getAssignedToList(facilityId: facilityId);

    if (_assignedToList != null) {
      for (var block in _assignedToList) {
        assignedToList.add(block);
      }
      update(["assignedToList"]);
    }
  }

  Future<void> getEquipmentList({
    required String facilityId,
  }) async {
    final list = await homePresenter.getEquipmentList(
      isLoading: true,
      facilityId: facilityId,
    );
    equipmentList.value = list;
    selectedEquipment.value = equipmentList[0]?.name ?? '';
  }

  Future<void> getToolsRequiredToWorkTypeList() async {
    final list = await addJobPresenter.getToolsRequiredToWorkTypeList(
      isLoading: true,
    );
    toolsRequiredToWorkTypeList?.value = list ?? [];
    update(['toolsRequiredToWorkTypeList']);
    selectedToolRequiredToWorkType.value =
        toolsRequiredToWorkTypeList?[0]?.name ?? '';
  }

  Future<void> getInventoryCategoryList(String? facilityId) async {
    final _equipmentCategoryList =
        await addJobPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
      // update(['equipmentCategorylist']);
      // selectedEquipmentCategory.value = equipmentCategoryList[0]?.name ?? '';
    }
  }

  Future<void> getInventoryList({
    required int facilityId,
    required int blockId,
  }) async {
    categoryIds = selectedEquipmentCategoryIdList.value;
    String lststrCategoryIds = categoryIds.join(', ').toString();
    final _workAreaList = await homePresenter.getInventoryList(
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: lststrCategoryIds,
      isLoading: true,
    );
    workAreaList.value = _workAreaList;

    update(["workAreaList"]);
    //selectedWorkArea.value = workAreaList[0]?.name ?? '';
  }

  void checkForm() {
    if (selectedFacility.value == '') {
      isFacilitySelected.value = false;
    }
    if (selectedBlock.value == '') {
      isBlockSelected.value = false;
    }
    if (selectedAssignedTo.value == '') {
      isAssignedToSelected.value = false;
    }
    if (jobTitleCtrlr.text.trim().length < 3) {
      isJobTitleInvalid.value = true;
    }
    if (jobDescriptionCtrlr.text.trim().length < 3) {
      isJobDescriptionInvalid.value = true;
    }
    if (isAssignedToSelected.value == false ||
        isFacilitySelected.value == false ||
        isBlockSelected.value == false ||
        isJobTitleInvalid.value == true ||
        isJobDescriptionInvalid == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  void saveJob() async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      //
      int _permitId = selectedPermitId;
      String _title = jobTitleCtrlr.text.trim();
      String _description = jobDescriptionCtrlr.text.trim();
      List<AssetsId> assetIds = [];

      for (var _selectedWorkArea in selectedWorkAreaList) {
        var json = '{"asset_id": ${_selectedWorkArea?.id},'
            '"category_ids": ${_selectedWorkArea?.categoryId}}';

        AssetsId _assetId = addAssetsIdFromJson(json);
        assetIds.add(_assetId);
      }

      AddJobModel addJobModel = AddJobModel(
        facilityId: selectedFacilityId,
        blockId: selectedBlockId,
        permitId: _permitId,
        assignedId: selectedAssignedToId,
        title: _title,
        description: _description,
        status: 2,
        createdBy: "",
        assetsIds: assetIds,
        workTypeIds: selectedWorkAreaIdList,
      );
      var jobJsonString = addJobModelToJson(addJobModel);

      String? response = await addJobPresenter.saveJob(
        job: jobJsonString,
        isLoading: true,
      );
      if (response.isNotEmpty) {
        showAlertDialog();
      }
    }
  }

  void valueChanged(list, value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
          if (selectedFacilityId != 0) {
            isFacilitySelected.value = true;
          }
          selectedFacility.value = value;
          getBlocksList(selectedFacilityId);
        }
        break;

      case RxList<BlockModel>:
        {
          int blockIndex = blockList.indexWhere((x) => x?.name == value);
          selectedBlockId = blockList[blockIndex]?.id ?? 0;
          if (selectedBlockId != 0) {
            isBlockSelected.value = true;
          }
          selectedBlock.value = value;
          getInventoryList(facilityId: facilityId, blockId: selectedBlockId);
        }
        break;
      case RxList<EquipmentModel>:
        {
          int equipmentIndex =
              equipmentList.indexWhere((x) => x?.name == value);
          int selectedEquipmentId = equipmentList[equipmentIndex]?.id ?? 0;
          print(selectedEquipmentId);
        }
        break;
      case RxList<InventoryModel>:
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex = selectedEquipmentCategoryList
                .indexWhere((x) => x?.name == equipCat);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
          }
        }
        break;

      case RxList<EmployeeModel>:
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId != 0) {
            isAssignedToSelected.value = true;
          }
          selectedAssignedTo.value = value;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  void equipmentCategoriesSelected(selectedEquipmentCategories) {
    selectedEquipmentCategoryIdList.value = [];
    for (var _selectedCategory in selectedEquipmentCategories) {
      selectedEquipmentCategoryIdList.add(_selectedCategory.id);
    }
    getInventoryList(facilityId: facilityId, blockId: selectedBlockId);
  }

  void workAreasSelected(_selectedWorkAreaList) {
    selectedWorkAreaList.value = _selectedWorkAreaList.cast<InventoryModel>();
  }

  /// Show alert dialog
  static void showAlertDialog({
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Job Added',
          textAlign: TextAlign.center,
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          //var width = MediaQuery.of(context).size.width;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: height / 6,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorsValue.greyLightColour,
                    thickness: 1,
                  ),
                  Spacer(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: Styles.greenElevatedButtonStyle,
                          onPressed: () => Get.offAndToNamed(Routes.jobList),
                          child: const Text('Job List'),
                        ),
                        Dimens.boxWidth10,
                        ElevatedButton(
                          style: Styles.yellowElevatedButtonStyle,
                          onPressed: () => Get.offAndToNamed(Routes.jobDetails),
                          child: const Text('View Job'),
                        ),
                        Dimens.boxWidth10,
                        ElevatedButton(
                          style: Styles.redElevatedButtonStyle,
                          onPressed: () => Get.offAndToNamed(Routes.addJob),
                          child: const Text('Add New Job'),
                        ),
                      ]),
                ]),
          );
        }),
        actions: [],
      ),
    );
  }

  ///
}
