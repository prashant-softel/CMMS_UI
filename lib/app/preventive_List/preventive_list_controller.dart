import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/app/preventive_check_point/preventive_check_point_controller.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../navigators/app_pages.dart';

class PreventiveListController extends GetxController {
  PreventiveListController(
    this.preventiveListPresenter,
  );
  PreventiveListPresenter preventiveListPresenter;

  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<PreventiveCheckListModel?>? preventiveCheckList =
      <PreventiveCheckListModel?>[].obs;
  int facilityId = 45;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  PreventiveCheckListModel? preventiveCheckListModel;
  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  @override
  void onInit() async {
    getInventoryCategoryList();
    getFrequencyList();
    getPreventiveCheckList(facilityId, type);
    super.onInit();
  }

  Future<void> getFrequencyList() async {
    final list = await preventiveListPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  Future<void> getInventoryCategoryList() async {
    final list = await preventiveListPresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }

  Future<void> getPreventiveCheckList(int facilityId, int type) async {
    preventiveCheckList?.value = <PreventiveCheckListModel>[];
    final _preventiveCheckList =
        await preventiveListPresenter.getPreventiveCheckList(
      facilityId: facilityId,
      type: type,
    );

    if (_preventiveCheckList != null) {
      preventiveCheckList!.value = _preventiveCheckList;
      paginationController = PaginationController(
        rowCount: preventiveCheckList!.length,
        rowsPerPage: 10,
      );

      if (preventiveCheckList != null && preventiveCheckList!.isNotEmpty) {
        preventiveCheckListModel = preventiveCheckList![0];
        var preventiveCheckListJson = preventiveCheckListModel?.toJson();
        preventiveCheckListTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          preventiveCheckListTableColumns.add(key);
        }
      }
    }
  }

  Future<void> createChecklist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
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

  void createChecklistNumber() async {
    await preventiveListPresenter.createChecklistNumber(
      isLoading: true,
    );
  }
}
