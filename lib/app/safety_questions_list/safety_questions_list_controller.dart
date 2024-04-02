import 'dart:async';

import 'package:cmms/app/app.dart';

import 'package:cmms/app/safety_questions_list/safety_questions_presenter.dart';
import 'package:cmms/domain/models/create_safety_measure_model.dart';

import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';

class SafetyQuestionsListController extends GetxController {
  SafetyQuestionsListController(
    this.safetyQuestionsListPresenter,
  );
  SafetyQuestionsListPresenter safetyQuestionsListPresenter;
  final HomeController homecontroller = Get.find();

  ///Permit Type list
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  int? selectedTypePermitId = 0;

  SafetyMeasureListModel? selectedItem;

  var updateType = ''.obs;

  void updateChecklistType(String value) {
    updateType.value = value;
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxBool isContainerVisible = false.obs;
  Rx<bool> isFormInvalid = false.obs;

  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  FocusNode titleFocus = FocusNode();
  ScrollController titleScroll = ScrollController();
  ////
  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  // var type2 = <TypeModel>[
  //   TypeModel(name: "Please Select", id: "0"),
  //   TypeModel(name: 'Dry', id: "1"),
  //   TypeModel(name: 'Wet', id: "2"),
  // ];

  Map<String, TypeModel> typedropdownMapperData = {};

  //checkbox
  RxBool isChecked = true.obs;

  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  RxList<SafetyMeasureListModel> BufferPreventiveseff =
      <SafetyMeasureListModel>[].obs;
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///Safety Measurement Question List
  RxList<SafetyMeasureListModel> safetyMeasureList =
      <SafetyMeasureListModel>[].obs;

  PaginationController safetyQuestionListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      print('FacilityIdSafetyQuestion$facilityId');
      Future.delayed(Duration(seconds: 1), () {
        getTypePermitList();
        // getSafetyMeasureList(true,selectedTypePermitId!);
      });

      // getPreventiveCheckList(facilityId, type, true);
    });

    titleFocus.addListener(() {
      if (!titleFocus.hasFocus) {
        titleScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  void checkForm() {
    if (isTitleInvalid.value == true) {
      //|| isDescriptionInvalid.value == true
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      safetyMeasureList.value = BufferPreventiveseff.value;
      return;
    }
    List<SafetyMeasureListModel> filteredList = BufferPreventiveseff!
        .where((item) =>
            (item.id
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.permitType
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.inputName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    safetyMeasureList.value = filteredList;
  }

  Future<bool> createSafetyMeasure() async {
    if (titleCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
      // isDescriptionInvalid.value = true;
    }
    // if (descriptionCtrlr.text.trim() == '' ) {
    //   // isTitleInvalid.value = true;
    //   isFormInvalid.value = true;
    //   isDescriptionInvalid.value = true;
    // }
    checkForm();
    print("FORMVALIDITIY : $isFormInvalid.value");
    print("TITLE : $isTitleInvalid.value");
    // print("DES : $isDescriptionInvalid.value");
    if (isFormInvalid.value == true) {
      return false;
    }
    if (titleCtrlr.text.trim() == '' || updateType.value == '') {
      //|| descriptionCtrlr.text.trim() == ''
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();
      // String _description = descriptionCtrlr.text.trim();

      CreateSafetyMeasureModel createSafetyMeasure = CreateSafetyMeasureModel(
          title: _title,
          id: 0,
          // description: "",
          permitType: selectedTypePermitId,
          input: updateType.value == "Checkbox"
              ? 1
              : updateType.value == "Radio"
                  ? 2
                  : 3,
          required: isCheckedRequire.value ? 1 : 0,
          isRequiredValue: isCheckedRequire.value);
      print("OUT ");
      var safetyMeasurelistJsonString = createSafetyMeasure
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"safetyMeasureJsonString", safetyMeasurelistJsonString});
      await safetyQuestionsListPresenter.createSafetyMeasure(
        safetyMeasurelistJsonString: safetyMeasurelistJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<bool> updateSafetyMeasure(checkPontId) async {
    // String _checkPoint = checkPointCtrlr.text.trim();
    // String _requirement = requirementCtrlr.text.trim();
    // int _checklistId = int.tryParse(selectedchecklist.value) ?? 0;
    // int _failurewtg = int.tryParse(failurewtgCtrlr.text.trim()) ?? 0;
    // int _max = int.tryParse(maxRangeCtrlr.text.trim()) ?? 0;
    // int _min = int.tryParse(minRangeCtrlr.text.trim()) ?? 0;

    // CheckpointType checkpoint_type = CheckpointType(
    //     id: checkpointType.value == "Text"
    //         ? 0
    //         : checkpointType.value == "Bool"
    //             ? 1
    //             : 2,
    //     max: _max,
    //     min: _min);
    String _title = titleCtrlr.text.trim();

    CreateSafetyMeasureModel createSafetyMeasure = CreateSafetyMeasureModel(
        id: checkPontId,
        title: _title,
        // description: "",
        permitType: selectedTypePermitId,
        input: updateType.value == "Checkbox"
            ? 1
            : updateType.value == "Radio"
                ? 2
                : 3,
        required: isCheckedRequire.value ? 1 : 0,
        isRequiredValue: isCheckedRequire.value);
    var createSafetyMeasureJsonString = createSafetyMeasure
        .toJson(); //createCheckPointToJson([createCheckpoint]);

    print({"updateSafetyMeasureJsonString", createSafetyMeasureJsonString});
    await safetyQuestionsListPresenter.updateSafetyMeasure(
      createSafetyMeasureJsonString: createSafetyMeasureJsonString,
      isLoading: true,
    );
    return true;
  }

  dynamic onFetchNameFromId(dynamic value) {
    int permitTypeIndex = typePermitList.indexWhere((x) => x?.id == value);
    selectedTypePermit.value = typePermitList[permitTypeIndex]?.name ?? '';
    // selectedBusinessType.value = value;
    return selectedTypePermit.value;
  }

  void isDeleteDialog({String? safetyMeasure_id, String? safetyMeasure}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the permit ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: safetyMeasure,
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
                  deleteSafetyMeasure(safetyMeasure_id).then((value) {
                    Get.back();
                    getSafetyMeasureList(selectedTypePermitId!);
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

  Future<void> deleteSafetyMeasure(String? id) async {
    {
      await safetyQuestionsListPresenter.deleteSafetyMeasure(
        id,
        isLoading: true,
      );
      getSafetyMeasureList(selectedTypePermitId!);
    }
  }

  Future<void> getSafetyMeasureList(int selectedTypePermitId) async {
    safetyMeasureList.value = <SafetyMeasureListModel>[];
    final _safetyMeasureList =
        await safetyQuestionsListPresenter.getSafetyMeasureList(
      isLoading: isLoading.value,
      // categoryIds: categoryIds,
      permit_type_id: selectedTypePermitId,
      // job_type_id: 36,
    );
    if (_safetyMeasureList != null) {
      isLoading.value = false;
      for (var safetyMeasure_list in _safetyMeasureList) {
        safetyMeasureList.add(safetyMeasure_list);
      }
      BufferPreventiveseff.value = safetyMeasureList.value;
    }

    // supplierNameList = _supplierNameList;
    safetyQuestionListPaginationController = PaginationController(
      rowCount: safetyMeasureList.length,
      rowsPerPage: 10,
    );
    update(['safety_measure_list']);
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList = await safetyQuestionsListPresenter
        .getTypePermitList(facility_id: facilityId
            // facility_id: 45
            );
    print('FacilityIdForSafetyQuestions$facilityId');

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      selectedTypePermit.value = typePermitList[0]?.name ?? '';
      selectedTypePermitId = typePermitList[0]?.id;
      print('PermitTypeId:$selectedTypePermitId');
      getSafetyMeasureList(0);
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          // int equipmentIndex =
          //     equipmentCategoryList.indexWhere((x) => x?.name == value);
          // selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          // int frequencyIndex =
          // frequencyList.indexWhere((x) => x?.name == value);
          // selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      case RxList<TypePermitModel>:
        {
          int typePermitIndex =
              typePermitList.indexWhere((x) => x?.name == value);
          selectedTypePermitId = typePermitList[typePermitIndex]?.id ?? 0;
          getSafetyMeasureList(selectedTypePermitId!);
          print('Permit Type Id:$selectedTypePermitId');
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> issuccessSafetyMeasurelist() async {
    isSuccess.toggle();
    selectedItem = null;
    isCheckedRequire.value = false;
    await {_cleardata()};
  }

  clearData() {
    titleCtrlr.text = '';
    descriptionCtrlr.text = '';
  }

  _cleardata() {
    titleCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;
    isCheckedRequire.value = false;
    // manpowerCtrlr.text = '';

    // selectedequipment.value = '';

    // selectedfrequency.value = '';
    Future.delayed(Duration(seconds: 1), () {
      getSafetyMeasureList(selectedTypePermitId!);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }
}
