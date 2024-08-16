import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../navigators/app_pages.dart';

import '../widgets/custom_elevated_button.dart';

class PreventiveListController extends GetxController {
  PreventiveListController(
    this.preventiveListPresenter,
  );
  PreventiveListPresenter preventiveListPresenter;
  final HomeController homecontroller = Get.find();
  FocusNode checklistFocus = FocusNode();
  ScrollController checklistScroll = ScrollController();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  Rx<bool> ischecklistNumberInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;

  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<PreventiveCheckListModel?>? preventiveCheckList =
      <PreventiveCheckListModel?>[].obs;
  RxList<PreventiveCheckListModel?>? BufferPreventiveCheckList =
      <PreventiveCheckListModel?>[].obs;
  int facilityId = 0;
  Rx<int> type = 0.obs;
  RxBool isContainerVisible = false.obs;
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
  PreventiveCheckListModel? selectedItem;
  var manpowerCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Sr No": true,
    "Checklist Id": true, "Checklist Name": true,

    "Active Status": true,
    "Category": true,
    "Frequency": true,
    "PM Manpower": true, "PM Duration(in Min.)": true,
    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Sr No": 50,
    "Checklist Id": 130,
    "Checklist Name": 220,
    "Active Status": 200,
    "Category": 150,
    "Frequency": 150,
    "PM Manpower": 150,
    "PM Duration(in Min.)": 150,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  RxString srFilterText = ''.obs;
  RxString idFilterText = ''.obs;
  RxString nameFilterText = ''.obs;
  RxString activityFilterText = ''.obs;
  RxString categoryFilterText = ''.obs;
  RxString feqFilterText = ''.obs;
  RxString pmFilterText = ''.obs;
  RxString durFilterText = ''.obs;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    try {
      await setType();
      this.filterText = {
        "Sr No": srFilterText,
        "Checklist Id": idFilterText,
        "Checklist Name": nameFilterText,
        "Active Status": activityFilterText,
        "Category": categoryFilterText,
        "Frequency": feqFilterText,
        "PM Manpower": pmFilterText,
        "PM Duration(in Min.)": durFilterText,
      };
      getInventoryCategoryList();
      getFrequencyList();

      if (type.value != 0) {
        facilityIdStreamSubscription =
            homecontroller.facilityId$.listen((event) {
          facilityId = event;
          Future.delayed(Duration(seconds: 2), () {
            getPreventiveCheckList(facilityId, type.value, false);
          });
        });
        checklistFocus.addListener(() {
          if (!checklistFocus.hasFocus) {
            checklistScroll.jumpTo(0.0);
          }
        });
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<void> setType() async {
    try {
      String? _type = await preventiveListPresenter.getValue();
      if (_type == null || _type == '' || _type == "null") {
        var dataFromPreviousScreen = Get.arguments;

        type.value = dataFromPreviousScreen['type'];
        preventiveListPresenter.saveValue(type: type.value.toString());
      } else {
        type.value = int.tryParse(_type) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'type');
      //  Utility.showDialog(e.toString() + 'type');
    }
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

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      preventiveCheckList!.value = BufferPreventiveCheckList!.value;
      return;
    }
    List<PreventiveCheckListModel?> filteredList = BufferPreventiveCheckList!
        .where((item) =>
            (item!.id
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.category_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.frequency_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.manPower
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.duration
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    preventiveCheckList!.value = filteredList;
  }

  Future<void> getPreventiveCheckList(
      int facilityId, int type, bool isExport) async {
    preventiveCheckList?.value = <PreventiveCheckListModel>[];
    BufferPreventiveCheckList?.value = <PreventiveCheckListModel>[];

    final _preventiveCheckList =
        await preventiveListPresenter.getPreventiveCheckList(
            facilityId: facilityId,
            type: type,
            isLoading: isLoading.value,
            isExport: isExport);

    if (_preventiveCheckList != null) {
      preventiveCheckList!.value = _preventiveCheckList;
      BufferPreventiveCheckList!.value = preventiveCheckList!.value;
      isLoading.value = false;
      // paginationController = PaginationController(
      //   rowCount: preventiveCheckList?.length ?? 0,
      //   rowsPerPage: 10,
      // );

      // if (preventiveCheckList != null && preventiveCheckList!.isNotEmpty) {
      //   preventiveCheckListModel = preventiveCheckList![0];
      //   var preventiveCheckListJson = preventiveCheckListModel?.toJson();
      //   preventiveCheckListTableColumns.value = <String>[];
      //   for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
      //     preventiveCheckListTableColumns.add(key);
      //   }
      // }
    }
  }

  Future<void> createChecklist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<InventoryCategoryModel>):
        {
          if (value != "Please Select") {
            int equipmentIndex =
                equipmentCategoryList.indexWhere((x) => x?.name == value);
            selectedEquipmentId =
                equipmentCategoryList[equipmentIndex]?.id ?? 0;
            isSelectedequipment.value = true;
          } else {
            selectedEquipmentId = 0;
          }
        }

        break;
      case const (RxList<FrequencyModel>):
        {
          if (value != "Please Select") {
            int frequencyIndex =
                frequencyList.indexWhere((x) => x?.name == value);
            selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
            isSelectedfrequency.value = true;
          } else {
            selectedfrequencyId = 0;
          }
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
    // checkFormCheckList();
    // if(isFormInvalid.value){
    //   return false;
    // }
    if (checklistNumberCtrlr.text.trim() == '' ||
        selectedEquipmentId == 0 ||
        selectedfrequencyId == 0) {
      // Fluttertoast.showToast(
      //     msg: "Please enter required field", fontSize: 16.0);
    } else {
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
          type: type.value,
          id: 0,
          checklist_number: _checklistNumber);
      var checklistJsonString = [
        createChecklist.toJson()
      ]; //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", checklistJsonString});
      await preventiveListPresenter.createChecklistNumber(
        checklistJsonString: checklistJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();

    await {_cleardata()};
  }

  cleardata() {
    checklistNumberCtrlr.text = '';
    durationCtrlr.text = '';
    manpowerCtrlr.text = '';

    selectedequipment.value = '';

    selectedfrequency.value = '';
    selectedItem = null;
  }

  _cleardata() {
    checklistNumberCtrlr.text = '';
    durationCtrlr.text = '';
    manpowerCtrlr.text = '';

    selectedequipment.value = '';

    selectedfrequency.value = '';
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getPreventiveCheckList(facilityId, type.value, false);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? checklist_id, String? checklist}) {
    Get.dialog(
      AlertDialog(
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Delete Checklist", style: Styles.blackBold16),
              Divider(
                color: ColorValues.appLightGreyColor,
              ),
              Dimens.boxHeight5,
              RichText(
                text: TextSpan(
                    text: 'Are you sure you want to delete the checklist ',
                    style: Styles.blackBold16,
                    children: [
                      TextSpan(
                        text: checklist,
                        style: TextStyle(
                          color: ColorValues.orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                  backgroundColor: ColorValues.appRedColor,
                  onPressed: () {
                    Get.back();
                  },
                  text: 'No'),
              CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  onPressed: () {
                    deleteCkecklist(checklist_id).then((value) {
                      Get.back();
                      getPreventiveCheckList(facilityId, type.value, false);
                    });
                  },
                  text: 'Yes'),
            ],
          ),
          Dimens.boxHeight5
        ],
      ),
    );
  }

  Future<void> deleteCkecklist(String? checklist_id) async {
    {
      await preventiveListPresenter.deleteCkecklist(
        checklist_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateChecklistNumber(checklistId) async {
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
        type: type.value,
        id: checklistId,
        checklist_number: _checklistNumber);
    var checklistJsonString =
        createChecklist.toJson(); //createCheckListToJson([createChecklist]);

    print({"checklistJsonString", checklistJsonString});
    await preventiveListPresenter.updateChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: true,
    );
    return true;
  }

  void export() {
    getPreventiveCheckList(facilityId, type.value, true);
  }

  void checkFormCheckList() {
    if (checklistNumberCtrlr.text == '') {
      ischecklistNumberInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedEquipmentId == 0) {
      isSelectedequipment.value = false;
      isFormInvalid.value = true;
    }
    if (selectedfrequencyId == 0) {
      isSelectedfrequency.value = false;
      isFormInvalid.value = true;
    }
  }
}
