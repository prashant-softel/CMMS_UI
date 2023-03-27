import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
  var checklistNumberCtrlr = TextEditingController();
  var manpowerCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
 final isSuccess = false.obs;
  @override
  void onInit() async {
    getInventoryCategoryList();
    getFrequencyList();
    getPreventiveCheckList(facilityId, type,true);
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

  Future<void> getPreventiveCheckList(int facilityId, int type,bool isLoading) async {
    preventiveCheckList?.value = <PreventiveCheckListModel>[];
    final _preventiveCheckList =
        await preventiveListPresenter.getPreventiveCheckList(
      facilityId: facilityId,
      type: type,
      isLoading: isLoading
    );

    if (_preventiveCheckList != null) {
      preventiveCheckList!.value = _preventiveCheckList;
      paginationController = PaginationController(
        rowCount: preventiveCheckList?.length??0,
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
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<bool> createChecklistNumber() async {
    if(checklistNumberCtrlr.text.trim()==''||selectedEquipmentId==0||selectedfrequencyId==0){
        Fluttertoast.showToast(
            msg: "Please enter required field", fontSize: 16.0);
    }else{
    String _checklistNumber = checklistNumberCtrlr.text.trim();
    String _duration = durationCtrlr.text.trim();
    String _manpower = manpowerCtrlr.text.trim();

    CreateChecklist createChecklist = CreateChecklist(
        category_id: selectedEquipmentId,
        duration: int.tryParse(_duration) ?? 0,
        manPower: int.tryParse(_manpower) ?? 0,
        facility_id: facilityId,
        frequency_id: selectedfrequencyId,
        status: 1,
        type: 1,
        checklist_number: _checklistNumber);
    var checklistJsonString = createCheckListToJson([createChecklist]);

    print({"checklistJsonString", checklistJsonString});
    await preventiveListPresenter.createChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: true,
    );    return true;

    }
    return false;
  }

  Future<void> issuccessCreatechecklist() async {
         isSuccess.toggle();
await { _cleardata()};
 
}

  _cleardata() {checklistNumberCtrlr.text = '';
    durationCtrlr.text = '';
    manpowerCtrlr.text = '';

    selectedequipment.value = '';

    selectedfrequency.value = '';

    getPreventiveCheckList(facilityId, type,true);
    }
   
  }

