import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/inventory_type_list/inventory_type_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/inventory_type_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InventoryTypeListController extends GetxController {
  InventoryTypeListController(
    this.inventoryTypeListPresenter,
  );
  InventoryTypeListPresenter inventoryTypeListPresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryTypeListModel?>? inventoryTypeList =
      <InventoryTypeListModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  InventoryTypeListModel? inventoryTypeListModel;

  RxList<String> inventoryTypeListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var checklistNumberCtrlr = TextEditingController();
  InventoryTypeListModel? selectedItem;
  var manpowerCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  @override
  void onInit() async {
    getInventoryCategoryList();
    getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getInventoryTypeList(facilityId, type, true);
      });
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

  Future<void> getInventoryTypeList(
      int facilityId, int type, bool isLoading) async {
    inventoryTypeList?.value = <InventoryTypeListModel>[];
    final _inventoryTypeList =
        await inventoryTypeListPresenter.getInventoryTypeList(
            facilityId: facilityId, type: type, isLoading: isLoading);

    if (_inventoryTypeList != null) {
      inventoryTypeList!.value = _inventoryTypeList;
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
    if (checklistNumberCtrlr.text.trim() == '' ||
        selectedEquipmentId == 0 ||
        selectedfrequencyId == 0) {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
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
          type: 1,
          id: 0,
          checklist_number: _checklistNumber);
      var checklistJsonString = [
        createChecklist.toJson()
      ]; //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", checklistJsonString});
      await inventoryTypeListPresenter.createChecklistNumber(
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

  _cleardata() {
    checklistNumberCtrlr.text = '';
    durationCtrlr.text = '';
    manpowerCtrlr.text = '';

    selectedequipment.value = '';

    selectedfrequency.value = '';
    Future.delayed(Duration(seconds: 1), () {
      getInventoryTypeList(facilityId, type, true);
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
                  deleteCkecklist(checklist_id).then((value) {
                    Get.back();
                    getInventoryTypeList(facilityId, type, true);
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
      await inventoryTypeListPresenter.deleteCkecklist(
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
        type: 1,
        id: checklistId,
        checklist_number: _checklistNumber);
    var checklistJsonString =
        createChecklist.toJson(); //createCheckListToJson([createChecklist]);

    print({"checklistJsonString", checklistJsonString});
    await inventoryTypeListPresenter.updateChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: true,
    );
    return true;
  }
}
