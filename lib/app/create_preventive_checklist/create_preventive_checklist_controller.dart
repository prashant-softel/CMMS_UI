import 'package:cmms/app/create_preventive_checklist/create_preventive_checklist_presenter.dart';
import 'package:get/get.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';

class PreventiveCheckListController extends GetxController {
  PreventiveCheckListController(
    this.createpreventivePresenter,
  );
  CreateCheckListPresenter createpreventivePresenter;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  @override
  void onInit() async {
    getInventoryCategoryList();
    getFrequencyList();

    super.onInit();
  }

  Future<void> getInventoryCategoryList() async {
    final list = await createpreventivePresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }

  Future<void> getFrequencyList() async {
    final list = await createpreventivePresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  void createCheckList() async {
    {
      await createpreventivePresenter.createCheckList(
        isLoading: true,
      );
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          int selectedEquipmentId =
              equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          int selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
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
