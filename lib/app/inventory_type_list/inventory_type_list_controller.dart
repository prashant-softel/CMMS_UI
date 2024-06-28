import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/inventory_type_list/inventory_type_list_presenter.dart';
import 'package:cmms/domain/models/inventory_type_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/create_inventory_status.dart';

import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import ''
class InventoryTypeListController extends GetxController {
  InventoryTypeListController(
    this.inventoryTypeListPresenter,
  );
  InventoryTypeListPresenter inventoryTypeListPresenter;
  final HomeController homecontroller = Get.find();
  FocusNode nameFocus = FocusNode();
  ScrollController nameScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryTypeListModel?>? inventoryTypeList =
      <InventoryTypeListModel?>[].obs;
  RxList<InventoryTypeListModel?> filteredData =
      <InventoryTypeListModel?>[].obs;
  RxBool isContainerVisible = false.obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  InventoryTypeListModel? inventoryTypeListModel;
  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      inventoryTypeList!.value = filteredData.value;
      return;
    }
    List<InventoryTypeListModel?> filteredList = filteredData
        .where((item) =>
                (item!.name
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) ||
                (item.description
                        ?.toString()
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) ??
                    false) // Add this condition to filter by searchId
            )
        .toList();
    inventoryTypeList!.value = filteredList;
  }

  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  RxList<String> inventoryTypeListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var nameCtrlr = TextEditingController();
  InventoryTypeListModel? selectedItem;
  var manpowerCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    getInventoryTypeList(facilityId, type);

    // facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
    //   facilityId = event;
    // Future.delayed(Duration(seconds: 2), () {
    //   // getInventoryTypeList(facilityId, type, true);
    // });
    // });
    nameFocus.addListener(() {
      if (!nameFocus.hasFocus) {
        nameScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });

    super.onInit();
  }

  Future<void> getFrequencyList() async {
    final list = await inventoryTypeListPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  Future<void> getInventoryCategoryList() async {
    final list = await inventoryTypeListPresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<void> getInventoryTypeList(int facilityId, int type) async {
    inventoryTypeList?.value = <InventoryTypeListModel>[];
    filteredData.value = <InventoryTypeListModel>[];

    final _inventoryTypeList =
        await inventoryTypeListPresenter.getInventoryTypeList(
            facilityId: facilityId, type: type, isLoading: isLoading.value);

    if (_inventoryTypeList != null) {
      inventoryTypeList!.value = _inventoryTypeList;
      filteredData.value = inventoryTypeList!.value;
      isLoading.value = false;
      paginationController = PaginationController(
        rowCount: inventoryTypeList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (inventoryTypeList != null && inventoryTypeList!.isNotEmpty) {
        inventoryTypeListModel = inventoryTypeList![0];

        var inventoryTypeListJson = inventoryTypeListModel?.toJson();
        inventoryTypeListTableColumns.value = <String>[];
        for (var key in inventoryTypeListJson?.keys.toList() ?? []) {
          inventoryTypeListTableColumns.add(key);
        }
      }
    }
  }

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
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
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
         } else {
           selectedEquipmentId=0;
         }
        }

        break;
      case const (RxList<FrequencyModel>):
        {
          if (value != "Please Select") {
            int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
          } else {
            selectedfrequencyId=0;
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
    if (nameCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
      // isDescriptionInvalid.value = true;
    }
    if (descriptionCtrlr.text.trim() == '') {
      // isTitleInvalid.value = true;
      isFormInvalid.value = true;
      isDescriptionInvalid.value = true;
    }
    checkForm();
    print("FORMVALIDITIY : $isFormInvalid.value");
    print("TITLE : $isTitleInvalid.value");
    print("DES : $isDescriptionInvalid.value");
    if (isFormInvalid.value == true) {
      return false;
    }
    if (nameCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _checklistNumber = nameCtrlr.text.trim();
      String _duration = descriptionCtrlr.text.trim();

      CreateInventoryStatusListModel createChecklist =
          CreateInventoryStatusListModel(
              // id : checklistId,
              name: _checklistNumber,
              description: _duration);
      var checklistJsonString =
          createChecklist.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", checklistJsonString});
      await inventoryTypeListPresenter.createInventoryType(
        checklistJsonString: checklistJsonString,
        isLoading: true,
      );
      return true;
    }
    getInventoryTypeList(facilityId, type);
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();

    await {cleardata()};
  }

  cleardata() {
    nameCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getInventoryTypeList(facilityId, type);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? checklist_id, String? checklist}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the checkpoint ',
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
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  deleteInventoryType(checklist_id).then((value) {
                    Get.back();
                    getInventoryTypeList(facilityId, type);
                  });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deleteInventoryType(String? checklist_id) async {
    {
      await inventoryTypeListPresenter.deleteInventoryType(
        checklist_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateInventoryType(checklistId) async {
    String _checklistNumber = nameCtrlr.text.trim();
    String _duration = descriptionCtrlr.text.trim();
    String _manpower = manpowerCtrlr.text.trim();

    InventoryTypeListModel createChecklist = InventoryTypeListModel(
        id: checklistId, name: _checklistNumber, description: _duration);
    var checklistJsonString =
        createChecklist.toJson(); //createCheckListToJson([createChecklist]);

    print({"checklistJsonString", checklistJsonString});
    await inventoryTypeListPresenter.updateInventoryType(
      checklistJsonString: checklistJsonString,
      isLoading: true,
    );
    return true;
  }
}
