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

  Future<void> getInventoryCategoryList() async {
    final _facilityList =
        await createpreventivePresenter.getInventoryCategoryList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        equipmentCategoryList.add(facility);
      }
      selectedequipment.value = equipmentCategoryList[0]?.name ?? '';
    }
  }

  void createCheckList() async {
    {
      await createpreventivePresenter.createCheckList(
        isLoading: true,
      );
    }
  }
}
