import 'package:cmms/app/pm_schedule/pm_schedule_presenter.dart';
import 'package:get/get.dart';

import '../../../domain/models/inventory_category_model.dart';

class PmScheduleController extends GetxController {
  PmScheduleController(
    this.pmSchedulePresenter,
  );
  PmSchedulePresenter pmSchedulePresenter;

  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  int selectedEquipmentId = 0;

  @override
  void onInit() async {
    getInventoryCategoryList();

    super.onInit();
  }

  Future<void> getInventoryCategoryList() async {
    final list = await pmSchedulePresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
      selectedequipment.value = equipmentCategoryList[0]?.name.toString() ?? '';
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
