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
import '../../domain/models/modulelist_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'module_list_presenter.dart';

class ModuleListController extends GetxController {
  ModuleListController(
    this.moduleListPresenter,
  );
  ModuleListPresenter moduleListPresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<ModuleListModel?>?
  moduleList =
      <ModuleListModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  ModuleListModel? moduleListModel;

  RxList<String> moduleListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var checklistNumberCtrlr = TextEditingController();
  ModuleListModel? selectedItem;
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
        getModuleList(facilityId, type, true);
      });
    });
    super.onInit();
  }

  Future<void> getFrequencyList() async {
    final list = await moduleListPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  Future<void> getInventoryCategoryList() async {
    final list = await moduleListPresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }


  Future<void> getModuleList(
      int facilityId, int type, bool isLoading) async {
    moduleList?.value = <ModuleListModel>[];
    final _moduleList =
        await moduleListPresenter.getModuleList(
            facilityId: facilityId, type: type, isLoading: isLoading);

    if (_moduleList != null) {
      moduleList!.value = _moduleList.cast<ModuleListModel?>();
      paginationController = PaginationController(
        rowCount: moduleList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (moduleList != null && moduleList!.isNotEmpty) {
        moduleListModel = moduleList![0];
        var preventiveCheckListJson = moduleListModel?.toJson();
        moduleListTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          moduleListTableColumns.add(key);
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
      await moduleListPresenter.createChecklistNumber(
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
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getModuleList(facilityId, type, true);
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
                  deleteChecklist(checklist_id).then((value) {
                    Get.back();
                    getModuleList(facilityId, type, true);
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

  Future<void> deleteChecklist(String? checklist_id) async {
    {
      await moduleListPresenter.deleteCkecklist(
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
    await moduleListPresenter.updateChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: true,
    );
    return true;
  }
}
