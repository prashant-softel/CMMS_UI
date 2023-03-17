import 'package:cmms/app/create_preventive_checklist/create_preventive_checklist_presenter.dart';
import 'package:get/get.dart';

import '../../domain/models/inventory_category_model.dart';

class PreventiveCheckListController extends GetxController {
  PreventiveCheckListController(
    this.createpreventivePresenter,
  );
  CreateCheckListPresenter createpreventivePresenter;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = false.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  @override
  void onInit() async {
    //homePresenter.generateToken();
    // Future.delayed(Duration(seconds: 1), () {
    //   getFacilityList();
    // });
    getInventoryCategoryList();
    super.onInit();
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

  Future<void> getInventoryCategoryList() async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await createpreventivePresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }
}
