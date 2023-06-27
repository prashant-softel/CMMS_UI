import 'dart:async';

import 'package:cmms/app/pm_mapping/pm_mapping_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/pm_mapping_list_model.dart';
import '../../domain/models/preventive_checklist_model.dart';
import '../../domain/models/save_pm_mapping_model.dart';
import '../home/home_controller.dart';
import '../theme/color_values.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PmMappingController extends GetxController {
  PmMappingController(
    this.pmMappingPresenter,
  );
  PmMappingPresenter pmMappingPresenter;
  final HomeController homecontroller = Get.find();

  int facilityId = 0;
  int type = 1;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<PmMappingListModel?> mappingList = <PmMappingListModel>[].obs;
  RxList<PmMappingListModel?> selectedMappingList = <PmMappingListModel>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<String?> equipmentCategoryNameList = <String>[].obs;
  RxList<int> selectedchecklistIdList = <int>[].obs;
  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  RxList<PreventiveCheckListModel?> selectedChecklistList =
      <PreventiveCheckListModel>[].obs;
  List<String> checkListmapdata = [];
  Map<int, dynamic> checklist_map = {};
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        // await getPmMappingList(facilityId);

        await getPreventiveCheckList(facilityId, type, false);
      });
      Future.delayed(Duration(seconds: 2), () async {
        await getPmMappingList(facilityId);

        //  await getPreventiveCheckList(facilityId, type, false);
      });
    });
    super.onInit();
  }

  Future<void> getPreventiveCheckList(facilityId, type, isLoading) async {
    final list = await pmMappingPresenter.getPreventiveCheckList(
        facilityId: facilityId, type: type, isLoading: isLoading);

    if (list != null) {
      equipmentCategoryNameList.clear();
      checkList.clear();
      Set<String> equipmentCategoryNameSet = {};
      for (var _checkList in list) {
        if (_checkList?.category_name != null) {
          equipmentCategoryNameSet.add(_checkList?.category_name ?? "");
          checkList.add(_checkList);
        }
      }
      equipmentCategoryNameList.addAll(equipmentCategoryNameSet.toList());
      // getPmMappingList(facilityId);
    }
  }

  Future<void> getInventoryCategoryList() async {
    final list = await pmMappingPresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }

  Future<void> getPmMappingList(facilityId) async {
    final list = await pmMappingPresenter.getPmMappingList(
        facilityId: facilityId, isLoading: true);
    selectedMappingList.value = list ?? [];
    if (list != null) {
      for (var _mappingList in list) {
        [...(_mappingList?.checklists ?? [])].forEach((element) {
          mappingList.add(_mappingList);
          selectedchecklistIdList.add(element.checklist_id!);

          checkListmapdata.add(element.checklist_name!);
          // print({"checkListmapdata", checkListmapdata});
        });
      }
    }
  }

  void checkListSelected(_selectedCheckList) {
    print({"_selectedCheckList": _selectedCheckList});
    selectedChecklistList.value =
        _selectedCheckList.cast<PreventiveCheckListModel>();
    selectedchecklistIdList.value = <int>[];
    late int cat_id = 0;
    for (var _selectedChecklist in _selectedCheckList) {
      selectedchecklistIdList.add(_selectedChecklist.id);
      cat_id = _selectedChecklist?.category_id;
    }
    checklist_map[cat_id] = selectedchecklistIdList;
  }

  void savePmMapping() async {
    // print({"checklist_map": checklist_map});
    late List<ChecklistMapList> checklist_map_list = [];

    checklist_map.forEach((category_id, checklist_ids) {
      checklist_map_list.add(ChecklistMapList(
          category_id: category_id, status: 0, checklist_ids: checklist_ids));
    });

    SavePmModel savePmModel = SavePmModel(
      facilityId: facilityId,
      checklist_map_list: checklist_map_list,
    );
    var pmJsonString = savePmModel.toJson();
    print({"redddd", pmJsonString});
    if (checklist_map_list.isNotEmpty) {
      Map<String, dynamic>? responsePmMapCreated =
          await pmMappingPresenter.savePmMapping(
        pmJsonString: pmJsonString,
        isLoading: true,
      );
      if (responsePmMapCreated != null) {
        isSuccessDialog();
      }
    } else {
      Fluttertoast.showToast(msg: "Please Map the Checklist", fontSize: 16.0);
    }
  }

  void isSuccessDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('CheckList Mapping'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 7, 161, 17),
              border: Border.all(
                color: Color.fromARGB(255, 7, 161, 17),
                width: 1,
              ),
            ),
            child: Icon(Icons.check, size: 35, color: ColorValues.whiteColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Check List Mapped  Successfully ....",
              style: TextStyle(fontSize: 16, color: ColorValues.blackColor))
        ]),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // List<dynamic> selectedOptionID(String? equipmentCategoryNameList) {
  //   print({
  //     "selectedOption equipmentCategoryNameList": equipmentCategoryNameList
  //   });
  //   late PmMappingListModel? selectedData = selectedMappingList.firstWhere(
  //     (element) => element?.category_name == equipmentCategoryNameList,
  //     orElse: () => null,
  //   );
  //   if (selectedData != null) {
  //     List<dynamic>? selectedOption =
  //         selectedData.checklists?.map((e) => e.checklist_id).toList();
  //     print({
  //       "equipmentCategoryNameList0": equipmentCategoryNameList,
  //       "selectedOption": selectedOption?.length
  //     });
  //     return selectedOption ?? [];
  //   }

  //   return [];
  // }

  selectedOption(String? equipmentCategoryName) {
    late PmMappingListModel? selectedData = selectedMappingList.firstWhere(
      (element) => element?.category_name == equipmentCategoryName,
      orElse: () => null,
    );
    if (selectedData != null) {
      List<int?> selectedOptionList =
          selectedData.checklists?.map((e) => e.checklist_id).toList() ?? [];
      // print({
      //   "equipmentCategoryNameList1": equipmentCategoryName,
      //   "selectedOption": selectedOptionList.length
      // });
      late List<PreventiveCheckListModel?> totalOption =
          (checkList.where((element) {
        print((element?.category_name == equipmentCategoryName) &&
            selectedOptionList.contains(element?.id));
        return (element?.category_name == equipmentCategoryName) &&
            selectedOptionList.contains(element?.id);
      })).toList();
      // print({
      //   "equipmentCategoryNameList2": equipmentCategoryName,
      //   "selectedOption": totalOption.length
      // });
      checklist_map[totalOption[0]?.category_id ?? -1] = selectedOptionList;
      return totalOption;
    } else {}
    return [];
  }
}
