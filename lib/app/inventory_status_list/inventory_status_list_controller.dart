import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/inventory_status_list/inventory_status_list_presenter.dart';
import 'package:cmms/domain/models/inventory_status_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/create_inventory_status.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InventoryStatusListController extends GetxController {
  InventoryStatusListController(
    this.inventoryStatusListPresenter,
  );
  InventoryStatusListPresenter inventoryStatusListPresenter;
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
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryStatusListModel?>? inventoryStatusList =
      <InventoryStatusListModel?>[].obs;
  RxList<InventoryStatusListModel?> filteredData =
      <InventoryStatusListModel?>[].obs;
  RxBool isContainerVisible = false.obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  InventoryStatusListModel? inventoryStatusListModel;

  RxList<String> inventoryStatusListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var nameCtrlr = TextEditingController();
  InventoryStatusListModel? selectedItem;
  var descriptionCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      inventoryStatusList!.value = filteredData.value;
      return;
    }
    List<InventoryStatusListModel?> filteredList = filteredData
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
    inventoryStatusList!.value = filteredList;
  }

  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getInventoryStatusList(facilityId, type);
      });
    });
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
    final list = await inventoryStatusListPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  // Future<void> getInventoryCategoryList() async {
  //   final list = await inventoryStatusListPresenter.getInventoryCategoryList();
  //
  //   if (list != null) {
  //     for (var _equipmentCategoryList in list) {
  //       equipmentCategoryList.add(_equipmentCategoryList);
  //     }
  //   }
  // }

  Future<void> getInventoryStatusList(int facilityId, int type) async {
    inventoryStatusList?.value = <InventoryStatusListModel>[];
    filteredData.value = <InventoryStatusListModel>[];

    final _inventoryStatusList =
        await inventoryStatusListPresenter.getInventoryStatusList(
            facilityId: facilityId, type: type, isLoading: isLoading.value);

    if (_inventoryStatusList != null) {
      inventoryStatusList!.value = _inventoryStatusList;
      filteredData.value = inventoryStatusList!.value;
      isLoading.value = false;
      paginationController = PaginationController(
        rowCount: inventoryStatusList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (inventoryStatusList != null && inventoryStatusList!.isNotEmpty) {
        inventoryStatusListModel = inventoryStatusList![0];
        var inventoryStatusListJson = inventoryStatusListModel?.toJson();
        inventoryStatusListTableColumns.value = <String>[];
        for (var key in inventoryStatusListJson?.keys.toList() ?? []) {
          inventoryStatusListTableColumns.add(key);
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
          if (value != "Please Select") {
            int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
          } else {
            selectedEquipmentId=0;
          }
        }

        break;
      case RxList<FrequencyModel>:
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

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<bool> createInventoryStatus() async {
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
    if (isFormInvalid.value == true) {
      return false;
    }
    if (nameCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _checklistNumber = nameCtrlr.text.trim();
      // String _duration = durationCtrlr.text.trim();
      String _manpower = descriptionCtrlr.text.trim();

      CreateInventoryStatusListModel createChecklist =
          CreateInventoryStatusListModel(
              name: _checklistNumber, description: _manpower);
      var checklistJsonString =
          createChecklist.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", checklistJsonString});
      await inventoryStatusListPresenter.createInventoryStatus(
        checklistJsonString: checklistJsonString,
        isLoading: true,
      );
      return true;
    }
    getInventoryStatusList(facilityId, type);
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();

    await {cleardata()};
  }

  cleardata() {
    nameCtrlr.text = '';
    // durationCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;
    // selectedequipment.value = '';
    //
    // selectedfrequency.value = '';
    Future.delayed(Duration(seconds: 1), () {
      getInventoryStatusList(facilityId, type);
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
                text: 'Are you sure you want to delete the InventoryStatus ',
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
                  deleteCkecklist(checklist_id).then((value) {
                    Get.back();
                    getInventoryStatusList(facilityId, type);
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

  Future<void> deleteCkecklist(String? checklist_id) async {
    {
      await inventoryStatusListPresenter.deleteInventoryStatus(
        checklist_id,
        isLoading: true,
      );
    }
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> updateInventoryStatus(checklistId) async {
    String _checklistNumber = nameCtrlr.text.trim();
    // String _duration = durationCtrlr.text.trim();
    String _manpower = descriptionCtrlr.text.trim();

    InventoryStatusListModel createChecklist = InventoryStatusListModel(
        id: checklistId, name: _checklistNumber, description: _manpower);
    var checklistJsonString =
        createChecklist.toJson(); //createCheckListToJson([createChecklist]);

    print({"checklistJsonString", checklistJsonString});
    await inventoryStatusListPresenter.updateInventoryStatus(
      checklistJsonString: checklistJsonString,
      isLoading: true,
    );
    return true;
  }
}
