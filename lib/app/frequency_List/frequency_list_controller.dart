import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'frequency_list_presenter.dart';

class FrequencyListController extends GetxController {
  FrequencyListController(
    this.frequencyListPresenter,
  );
  FrequencyListPresenter frequencyListPresenter;
  final HomeController homecontroller = Get.find();
  FocusNode nameFocus = FocusNode();
  ScrollController nameScroll = ScrollController();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  RxBool isContainerVisible = false.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<FrequencyModel?>? frequencyList = <FrequencyModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  FrequencyModel? frequencyListModel;

  RxList<String> frequencyListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var freqNameCtrlr = TextEditingController();
  FrequencyModel? selectedItem;
  var manpowerCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();

  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getFrequencyList();
      });
    });
    nameFocus.addListener(() {
      if (!nameFocus.hasFocus) {
        nameScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> getFrequencyList() async {
    frequencyList?.value = <FrequencyModel>[];
    final _moduleList =
        await frequencyListPresenter.getFrequencyList(isLoading: isLoading.value);

    if (_moduleList != null) {
      frequencyList!.value = _moduleList.cast<FrequencyModel?>();
      isLoading.value = false;
      paginationController = PaginationController(
        rowCount: frequencyList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (frequencyList != null && frequencyList!.isNotEmpty) {
        frequencyListModel = frequencyList![0];
        var preventiveCheckListJson = frequencyListModel?.toJson();
        frequencyListTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          frequencyListTableColumns.add(key);
        }
      }
    }
  }

  cleardata() {
    freqNameCtrlr.text = '';
    manpowerCtrlr.text = '';
    // selectedStateId = 0;
    // selectedCountryId = 0;
    // selectedCityId = 0;
    // ownerId = 0;
    selectedItem = null;
    // customerId = 0;
    // operatorId = 0;
    // SpvId = 0;

    Future.delayed(Duration(seconds: 1), () {
      getFrequencyList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  // Future<void> getInventoryCategoryList() async {
  //   final list = await frequencyListPresenter.getInventoryCategoryList();
  //
  //   if (list != null) {
  //     for (var _equipmentCategoryList in list) {
  //       equipmentCategoryList.add(_equipmentCategoryList);
  //     }
  //   }
  // }
  //
  // Future<void> getPreventiveCheckList(
  //     int facilityId, int type, bool isLoading) async {
  //   preventiveCheckList?.value = <FrequencyModel>[];
  //   final _preventiveCheckList =
  //   await frequencyListPresenter.getPreventiveCheckList(
  //       facilityId: facilityId, type: type, isLoading: isLoading);
  //
  //   if (_preventiveCheckList != null) {
  //     preventiveCheckList!.value = _preventiveCheckList.cast<FrequencyModel?>();
  //     paginationController = PaginationController(
  //       rowCount: preventiveCheckList?.length ?? 0,
  //       rowsPerPage: 10,
  //     );
  //
  //     if (preventiveCheckList != null && preventiveCheckList!.isNotEmpty) {
  //       frequencyListModel = preventiveCheckList![0];
  //       var preventiveCheckListJson = frequencyListModel?.toJson();
  //       preventiveCheckListTableColumns.value = <String>[];
  //       for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
  //         preventiveCheckListTableColumns.add(key);
  //       }
  //     }
  //   }
  // }

  Future<void> createChecklist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }

  // void onValueChanged(dynamic list, dynamic value) {
  //   switch (list.runtimeType) {
  //     case RxList<InventoryCategoryModel>:
  //       {
  //         int equipmentIndex =
  //         equipmentCategoryList.indexWhere((x) => x?.name == value);
  //         selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
  //       }
  //
  //       break;
  //     case RxList<FrequencyModel>:
  //       {
  //         int frequencyIndex =
  //         frequencyList.indexWhere((x) => x?.name == value);
  //         selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
  //       }
  //       break;
  //     default:
  //       {
  //         //statements;
  //       }
  //       break;
  //   }
  // }
  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<bool> createfreq() async {
    if (freqNameCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
      // isDescriptionInvalid.value = true;
    }
    if (manpowerCtrlr.text.trim() == '') {
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
    if (freqNameCtrlr.text.trim() == '' || manpowerCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _checklistNumber = freqNameCtrlr.text.trim();
      // String _duration = durationCtrlr.text.trim();
      String _manpowerString = manpowerCtrlr.text.trim();
      int? _manpower =
          int.tryParse(_manpowerString); // Converting string to integer

      if (_manpower == null) {
        // Handle case where string cannot be parsed into integer
        Fluttertoast.showToast(
            msg: "Manpower should be a valid number", fontSize: 16.0);
        return false;
      }

      FrequencyModel createChecklist = FrequencyModel(
        name: _checklistNumber,
        days: _manpower,
      );
      var freqJsonString = [
        createChecklist.toJson()
      ]; //createCheckListToJson([createChecklist]);

      print({"freqJsonString", freqJsonString});
      await frequencyListPresenter.createfreq(
        freqJsonString: freqJsonString,
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
    freqNameCtrlr.text = '';
    durationCtrlr.text = '';
    manpowerCtrlr.text = '';

    selectedequipment.value = '';

    selectedfrequency.value = '';
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getFrequencyList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  // void isDeleteDialog({String? checklist_id, String? checklist}) {
  //   Get.dialog(
  //     AlertDialog(
  //       content: Column(mainAxisSize: MainAxisSize.min, children: [
  //         Icon(Icons.delete, size: 35, color: ColorValues.redColor),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         RichText(
  //           text: TextSpan(
  //               text: 'Are you sure you want to delete the checkpoint ',
  //               style: Styles.blackBold16,
  //               children: [
  //                 TextSpan(
  //                   text: checklist,
  //                   style: TextStyle(
  //                     color: ColorValues.orangeColor,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ]),
  //         ),
  //       ]),
  //       actions: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             TextButton(
  //               onPressed: () {
  //                 Get.back();
  //               },
  //               child: Text('NO'),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 deleteCkecklist(checklist_id).then((value) {
  //                   Get.back();
  //                   getPreventiveCheckList(facilityId, type, true);
  //                 });
  //               },
  //               child: Text('YES'),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // Future<void> deleteCkecklist(String? checklist_id) async {
  //   {
  //     await frequencyListPresenter.deleteCkecklist(
  //       checklist_id,
  //       isLoading: true,
  //     );
  //   }
  // }
  //
  // Future<bool> updateChecklistNumber(checklistId) async {
  //   String _checklistNumber = checklistNumberCtrlr.text.trim();
  //   String _duration = durationCtrlr.text.trim();
  //   String _manpower = manpowerCtrlr.text.trim();
  //
  //   CreateChecklist createChecklist = CreateChecklist(
  //       category_id: selectedEquipmentId,
  //       duration: int.tryParse(_duration) ?? 0,
  //       manPower: int.tryParse(_manpower) ?? 0,
  //       facility_id: facilityId,
  //       frequency_id: selectedfrequencyId,
  //       status: 1,
  //       type: 1,
  //       id: checklistId,
  //       checklist_number: _checklistNumber);
  //   var checklistJsonString =
  //   createChecklist.toJson(); //createCheckListToJson([createChecklist]);
  //
  //   print({"checklistJsonString", checklistJsonString});
  //   await frequencyListPresenter.updateChecklistNumber(
  //     checklistJsonString: checklistJsonString,
  //     isLoading: true,
  //   );
  //   return true;
}
