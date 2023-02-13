import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:get/get.dart';

import '../../domain/models/employee_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../home/home_presenter.dart';
import 'add_job_presenter.dart';

class AddJobController extends GetxController {
  ///
  AddJobController(
      this.addJobPresenter, this.facilityPresenter, this.homePresenter);
  AddJobPresenter addJobPresenter;
  HomePresenter homePresenter;
  FacilityPresenter facilityPresenter;

  ///
  RxList<JobModel?>? jobList = <JobModel?>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  RxList<EquipmentModel?> equipmentList = <EquipmentModel>[].obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;

  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isBlockSelected = false.obs;
  //
  Rx<String> selectedEquipment = ''.obs;
  Rx<bool> isEquipmentSelected = false.obs;
  //
  Rx<String> selectedWorkArea = ''.obs;
  Rx<bool> isWorkAreaSelected = false.obs;
  //
  Rx<String> selectedEquipmentCategory = ''.obs;
  Rx<bool> isEquipmentCategorySelected = false.obs;
  //
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = false.obs;
  //

  int facilityId = 45;
  int categoryId = 5;
  var breakdownTime;

  ///
  @override
  void onInit() async {
    await homePresenter.generateToken();
    await getBlocksList();
    await getEquipmentList(facilityId: facilityId.toString());
    await getInventoryCategoryList(facilityId.toString());
    await getInventoryList(
      facilityId: facilityId,
      categoryId: categoryId,
    );
    super.onInit();
  }

  Future<void> getBlocksList() async {
    final _blockList =
        await addJobPresenter.getBlocksList(facilityId: facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      update(["jobList"]);
      selectedBlock.value = blockList[0]?.name ?? '';
    }
  }

  Future<void> getAssignedToList() async {
    final _assignedToList =
        await addJobPresenter.getAssignedToList(facilityId: facilityId);

    if (_assignedToList != null) {
      for (var block in _assignedToList) {
        assignedToList.add(block);
      }
      update(["jobList"]);
      selectedBlock.value = blockList[0]?.name ?? '';
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
    update(['equipmentList']);
    selectedEquipment.value = equipmentList[0]?.name ?? '';
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
      update(['equipmentCategorylist']);
      selectedEquipmentCategory.value = equipmentCategoryList[0]?.name ?? '';
    }
  }

  Future<void> getInventoryList({
    required int facilityId,
    required int categoryId,
  }) async {
    final _workAreaList = await homePresenter.getInventoryList(
      facilityId: facilityId,
      categoryId: categoryId,
      isLoading: true,
    );
    for (var workArea in _workAreaList) {
      var _workArea = InventoryModel(
        id: workArea.id,
        name: workArea.name,
        description: workArea.description,
        categoryName: workArea.categoryName,
        blockName: workArea.blockName,
        parentName: workArea.parentName,
        ownerName: workArea.ownerName,
        operatorName: workArea.operatorName,
        status: workArea.status,
        type: '',
        serialNumber: '',
        customerName: '',
        calibrationDueDate: '',
        facilityName: '',
        specialTool: 0,
        warrantyId: 0,
      );
      workAreaList.add(_workArea);
    }
    update(["workAreaList"]);
    selectedWorkArea.value = workAreaList[0]?.name ?? '';
  }

  Future<void> saveJob() async {}

  ///
}
