import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/inventory_category_model.dart';

class PreventiveListController extends GetxController {
  PreventiveListController(
    this.preventiveListPresenter,
  );
  PreventiveListPresenter preventiveListPresenter;

  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = false.obs;
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

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // Future.delayed(Duration(milliseconds: 500), () {
    getPreventiveCheckList(facilityId, type);
    //  });
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
        await preventiveListPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
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
      print({"preventivemmm", _preventiveCheckList});
      preventiveCheckList!.value = _preventiveCheckList;
      paginationController = PaginationController(
        rowCount: preventiveCheckList!.length,
        rowsPerPage: 10,
      );

      if (preventiveCheckList != null && preventiveCheckList!.isNotEmpty) {
        preventiveCheckListModel = preventiveCheckList![0];
        var preventiveCheckListJson = preventiveCheckListModel?.toJson();
        preventiveCheckListTableColumns.value = <String>[];
        print({"preventiveCheckListJson", preventiveCheckListJson});
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          preventiveCheckListTableColumns.add(key);
        }
      }
    }
  }
}
