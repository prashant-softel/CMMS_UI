import 'dart:async';

import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/checkpoint_list_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/type_of_obs_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_checkpoint_model.dart';
import '../home/home_controller.dart';
import '../theme/color_values.dart';
import '../theme/styles.dart';
import 'preventive_check_point_presenter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PreventiveCheckPointController extends GetxController {
  PreventiveCheckPointController(
    this.preventiveCheckPointPresenter,
  );
  PreventiveCheckPointPresenter preventiveCheckPointPresenter;
  final HomeController homecontroller = Get.find();
  FocusNode chckFocus = FocusNode();
  ScrollController chckScroll = ScrollController();
  FocusNode reqFocus = FocusNode();
  ScrollController reqScroll = ScrollController();
  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  Rx<String> selectedchecklist = 'Please Select'.obs;
  Rx<bool> isSelectedchecklist = true.obs;
  int facilityId = 0;
  Rx<int> type = 0.obs;
  var checkPointCtrlr = TextEditingController();
  var minRangeCtrlr = TextEditingController();
  var maxRangeCtrlr = TextEditingController();
  RxBool isContainerVisible = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isCheckPointInvalid = false.obs;
  Rx<bool> isRequiremetInvalid = false.obs;
  Rx<bool> isFailureInvalid = false.obs;

  var requirementCtrlr = TextEditingController();
  var failurewtgCtrlr = TextEditingController();
  int selectedEquipmentId = 0;

  RxList<RiskTypeModel> incidentrisktypeList = <RiskTypeModel>[].obs;
  Rx<bool> isRiskTypeListSelected = true.obs;
  Rx<bool> isCostTypeListSelected = true.obs;
  Rx<String> selectedRiskTypeList = ''.obs;
  Rx<String> selectedCostTypeList = ''.obs;
  Rx<String> selectedchecklistId = "".obs;
  int typeOfObsId = 0;
  int incidenttypeId = 0;
  int selectedCostTypeId = 0;
  Rx<bool> isTypeOfObsListSelected = true.obs;
  RxList<TypeOfObsListModel?> typeOfObsList = <TypeOfObsListModel>[].obs;
  Rx<bool> isSelectedTypeOfObs = true.obs;
  Rx<String> selectedTypeOfObs = ''.obs;
  RxList<CheckPointModel?>? preventiveCheckpoint = <CheckPointModel?>[].obs;

  RxList<TypeModel> costType = <TypeModel>[
    TypeModel(name: 'Capex', id: "1"),
    TypeModel(name: 'Opex', id: "2"),
  ].obs;
  RxList<CheckPointModel?>? BufferPreventiveCheckPoint =
      <CheckPointModel?>[].obs;
  CheckPointModel? preventiveCheckpointmodel;
  CheckPointModel? selectedItem;

  RxList<String> preventiveCheckPointTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // var preventiveCheckPointModelListDetails;
  StreamSubscription<int>? facilityIdStreamSubscription;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Sr No": true,
    "Check Point Id": true,
    "Check List Name": true,
    "Check Point": true,
    "Requirement": true,
    "Upload Image?": true,
    "Failure Weightage": true,
    "Type": true,
    "Type of Observation": true,
    "Risk Type": true,
    "Cost Type": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Sr No": 50,
    "Check Point Id": 120,
    "Check List Name": 250,
    "Check Point": 250,
    "Requirement": 300,
    "Upload Image?": 200,
    "Failure Weightage": 170,
    "Type": 200,
    "Type of Observation": 200,
    "Risk Type": 200,
    "Cost Type": 200,
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
  RxString checkListFilterText = ''.obs;
  RxString checkpointFilterText = ''.obs;
  RxString reqFilterText = ''.obs;
  RxString failerFilterText = ''.obs;
  RxString imageFilterText = ''.obs;
  RxString typeFilterText = ''.obs;
  RxString typeObsFilterText = ''.obs;
  RxString typeRiskFilterText = ''.obs;
  RxString typeCostFilterText = ''.obs;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    try {
      await setType();
      this.filterText = {
        "Sr No": srFilterText,
        "Check Point Id": idFilterText,
        "Check List Name": checkListFilterText,
        "Check Point": checkpointFilterText,
        "Requirement": reqFilterText,
        "Upload Image?": imageFilterText,
        "Failure Weightage": failerFilterText,
        "Type": typeFilterText,
        "Type of Observation": typeObsFilterText,
        "Risk Type": typeRiskFilterText,
        "Cost Type": typeCostFilterText,
      };

      // if (type.value != 0) {
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 2), () {
          getPreventiveCheckList(facilityId, type.value);
          getCheckPointlist(
              selectedchecklistId: 0.toString(),
              facilityId: facilityId,
              type: type.value);
        });
        Future.delayed(Duration(seconds: 1), () {
          getIncidentRiskType(facilityId);
        });
        Future.delayed(Duration(seconds: 1), () {
          getTypeOfObservationList();
        });
      });
      // }
      chckFocus.addListener(() {
        if (!chckFocus.hasFocus) {
          chckScroll.jumpTo(0.0);
        }
      });
      reqFocus.addListener(() {
        if (!reqFocus.hasFocus) {
          reqScroll.jumpTo(0.0);
        }
      });

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<void> setType() async {
    final String? _type = Get.parameters['type'];
    type.value = int.tryParse(_type ?? "") ?? 0;

    // try {
    //   // Read jobId
    //   String? _type = await preventiveCheckPointPresenter.getValue();
    //   if (_type == null || _type == '' || _type == "null") {
    //     var dataFromPreviousScreen = Get.arguments;

    //     type.value = dataFromPreviousScreen['type'];
    //     preventiveCheckPointPresenter.saveValue(type: type.value.toString());
    //   } else {
    //     type.value = int.tryParse(_type) ?? 0;
    //   }
    // } catch (e) {
    //   print(e.toString() + 'type');
    //   //  Utility.showDialog(e.toString() + 'type');
    // }
  }

  var checkpointType = ''.obs;

  void updatecheCkpointType(String value) {
    checkpointType.value = value;
  }

  var isToggleOn = false.obs;
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      preventiveCheckpoint!.value = BufferPreventiveCheckPoint!.value;
      return;
    }
    List<CheckPointModel?> filteredList = BufferPreventiveCheckPoint!
        .where((item) =>
            (item!.id
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.checklist_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.check_point
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.requirement
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.checkpoint_type
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.failure_weightage
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    preventiveCheckpoint!.value = filteredList;
  }

  Future<void> getPreventiveCheckList(
    facilityId,
    type,
  ) async {
    checkList.value = <PreventiveCheckListModel>[];
    cleardata();

    final list = await preventiveCheckPointPresenter.getPreventiveCheckList(
        facilityId: facilityId, type: type, isLoading: true);

    if (list != null) {
      isLoading.value = false;
      // checkList.clear();

      for (var _checkList in list) {
        checkList.add(_checkList);
      }
    }
    // selectedchecklist.value = checkList[0]?.name.toString() ?? '';
    // selectedchecklistId.value = checkList[0]?.id.toString() ?? "";
    // getCheckPointlist(
    //     selectedchecklistId: selectedchecklistId.value, facilityId: facilityId);
  }

  Future<bool> createCheckpoint() async {
    // checkFormCheck();
    // if(isFormInvalid.value){
    //   return true;
    // }
    int _failurewtg = int.tryParse(failurewtgCtrlr.text.trim()) ?? 0;
    String _checkPoint = checkPointCtrlr.text.trim();
    String _requirement = requirementCtrlr.text.trim();
    dynamic _max = double.tryParse(maxRangeCtrlr.text.trim()) ?? 0.0;
    dynamic _min = double.tryParse(minRangeCtrlr.text.trim()) ?? 0.0;

    int _checklistId = int.tryParse(selectedchecklistId.value) ?? 0;
    if (checkPointCtrlr.text.trim() == '' ||
        requirementCtrlr.text.trim() == '' ||
        failurewtgCtrlr.text.trim() == '' ||
        _failurewtg > 100 ||
        _failurewtg == 0 ||
        checkpointType.value == '') {
      Fluttertoast.showToast(
          msg:
              "Please enter required field and Failure waightage must be number beetween 1-100",
          fontSize: 16.0,
          timeInSecForIosWeb: 5);
    } else {
      CheckpointType checkpoint_type = CheckpointType(
          id: checkpointType.value == "Text"
              ? 0
              : checkpointType.value == "Bool"
                  ? 1
                  : checkpointType.value == "Range"
                      ? 2
                      : checkpointType.value == "Input Range"
                          ? 3
                          : 4,
          max: _max,
          min: _min);

      CreateCheckpoint createCheckpoint = CreateCheckpoint(
        check_point: _checkPoint,
        requirement: _requirement,
        checklist_id: _checklistId,
        failure_weightage: _failurewtg,
        checkpoint_type: checkpoint_type,
        is_document_required: isToggleOn.value ? 1 : 0,
        id: 0,
        status: 1,
        type: type.value,
        type_of_observation: typeOfObsId,
        risk_type: incidenttypeId,
        cost_type: selectedCostTypeId,
      );
      var checkpointJsonString = [
        createCheckpoint.toJson()
      ]; //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", checkpointJsonString});
      var rsponse = preventiveCheckPointPresenter.createCheckPoint(
        checkpointJsonString: checkpointJsonString,
        isLoading: true,
      );
      return true;
    }
    return false;
  }

  void export() {
    getCheckPointlist(
      selectedchecklistId: 0.toString(),
      facilityId: facilityId,
      isExport: true,
      type: type.value,
      isExportOnly: true,
    );
  }

  Future<void> getCheckPointlist(
      {required String selectedchecklistId,
      required int facilityId,
      bool? isExport,
      int? type,
      bool isExportOnly = false}) async {
    if (!isExportOnly) {
      preventiveCheckpoint?.value = <CheckPointModel>[];
      BufferPreventiveCheckPoint?.value = <CheckPointModel>[];
    }

    final _preventiveCheckpoint =
        await preventiveCheckPointPresenter.getCheckPointlist(
            selectedchecklistId: int.tryParse(
              selectedchecklistId,
            ),
            isLoading: isLoading.value,
            facilityId: facilityId,
            isExport: isExport,
            type: type);

    if (_preventiveCheckpoint != null && !isExportOnly) {
      preventiveCheckpoint!.value = _preventiveCheckpoint;
      BufferPreventiveCheckPoint!.value = preventiveCheckpoint!.value;
      isLoading.value = false;

      // Uncomment and configure pagination logic if necessary
      // paginationController = PaginationController(
      //   rowCount: preventiveCheckpoint!.length,
      //   rowsPerPage: 10,
      // );

      // Optional: Add column generation logic if necessary
      // if (preventiveCheckpoint != null && preventiveCheckpoint!.isNotEmpty) {
      //   preventiveCheckpointmodel = preventiveCheckpoint![0];
      //   var preventiveCheckListJson = preventiveCheckpointmodel?.toJson();
      //   preventiveCheckPointTableColumns.value = <String>[];
      //   for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
      //     preventiveCheckPointTableColumns.add(key);
      //   }
      // }
    }
  }

  cleardata() {
    checkPointCtrlr.text = '';
    requirementCtrlr.text = '';
    isToggleOn.value = false;
    selectedItem = null;
    failurewtgCtrlr.text = '';
    maxRangeCtrlr.text = '';
    minRangeCtrlr.text = '';
    checkpointType.value = '';
    selectedchecklist.value = 'Please Select';
    isSelectedchecklist.value = true;
  }

  void issuccessCreatecheckpont() {
    isSuccess.toggle();
    checkPointCtrlr.text = '';
    requirementCtrlr.text = '';
    isToggleOn.value = false;
    selectedItem = null;
    failurewtgCtrlr.text = '';
    maxRangeCtrlr.text = '';
    minRangeCtrlr.text = '';
    checkpointType.value = '';
    Future.delayed(Duration(seconds: 1), () {
      getCheckPointlist(
          selectedchecklistId: 0.toString(),
          facilityId: facilityId,
          type: type.value);
    });
    Future.delayed(Duration(seconds: 4), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? check_point_id, String? check_point}) {
    Get.dialog(
      AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Delete Checkpoint", style: Styles.blackBold16),
              Divider(
                color: ColorValues.appLightGreyColor,
              ),
              Dimens.boxHeight5,
              RichText(
                text: TextSpan(
                    text: 'Are you sure you want to delete the checkpoint ',
                    style: Styles.blackBold16,
                    children: [
                      TextSpan(
                        text: check_point,
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
                    deleteCkeckpoint(check_point_id).then((value) {
                      Get.back();
                      getCheckPointlist(
                          selectedchecklistId: 0.toString(),
                          facilityId: facilityId,
                          type: type.value);
                    });
                  },
                  text: 'Yes'),
            ],
          )
        ],
      ),
    );
  }

  Future<void> getIncidentRiskType(int facilityId) async {
    incidentrisktypeList.value = <RiskTypeModel>[];
    final _irisktypeList = await preventiveCheckPointPresenter.getRiskTypeList(
      facility_id: facilityId,
      isLoading: true,
    );
    for (var facilityType_list in _irisktypeList) {
      incidentrisktypeList.add(facilityType_list);
    }
  }

  Future<void> getTypeOfObservationList() async {
    typeOfObsList.clear();
    final list = await preventiveCheckPointPresenter.getTypeOfObservationList(
      isLoading: isLoading.value,
    );
    if (list != null) {
      isLoading.value = false;
      for (var _typeOfObsList in list) {
        typeOfObsList.add(_typeOfObsList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<PreventiveCheckListModel>):
        {
          if (value != "Please Select") {
            int checklistIndex = checkList.indexWhere((x) => x?.name == value);
            selectedchecklistId.value =
                checkList[checklistIndex]?.id.toString() ?? "";
            isSelectedchecklist.value = true;
            cleardata();
            getCheckPointlist(
                selectedchecklistId: selectedchecklistId.value,
                facilityId: facilityId,
                type: type.value);
          } else {
            // selectedchecklistId=0;
          }
        }
      case const (RxList<TypeModel>):
        {
          if (value != "Please Select") {
            int costTypeIndex = costType.indexWhere((x) => x.name == value);
            selectedCostTypeId =
                int.tryParse(costType[costTypeIndex].id ?? '0') ?? 0;
            selectedCostTypeList.value = value;
            isCostTypeListSelected.value = true;
          } else {
            selectedCostTypeId = 0;
          }
        }
        break;
      case const (RxList<TypeOfObsListModel>):
        {
          if (value != "Please Select") {
            int typeOfObsIndex =
                typeOfObsList.indexWhere((x) => x?.name == value);
            typeOfObsId = typeOfObsList[typeOfObsIndex]?.id ?? 0;
            selectedTypeOfObs.value = value;
            isTypeOfObsListSelected.value = true;
            isSelectedTypeOfObs.value = true;
            print(
                "selectedBusinessTypeId: ${typeOfObsId} \n ${selectedTypeOfObs}");
          } else {
            typeOfObsId = 0;
          }
        }
        break;
      case const (RxList<RiskTypeModel>):
        {
          if (value != "Please Select") {
            int statusIndex =
                incidentrisktypeList.indexWhere((x) => x?.name == value);
            incidenttypeId = incidentrisktypeList[statusIndex]?.id ?? 0;
            selectedRiskTypeList.value = value;
            isRiskTypeListSelected.value = true;
            print(
                "selectedBusinessTypeId: ${incidenttypeId} \n ${selectedRiskTypeList}");
          } else {
            incidenttypeId = 0;
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

  Future<void> deleteCkeckpoint(String? check_point_id) async {
    {
      await preventiveCheckPointPresenter.deleteCkeckpoint(
        check_point_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateCheckPoint(checkPontId) async {
    checkFormCheck();
    if (isFormInvalid.value) {
      return true;
    }
    String _checkPoint = checkPointCtrlr.text.trim();
    String _requirement = requirementCtrlr.text.trim();
    int _checklistId = int.tryParse(selectedchecklist.value) ?? 0;
    int _failurewtg = int.tryParse(failurewtgCtrlr.text.trim()) ?? 0;
    double _max = double.tryParse(maxRangeCtrlr.text.trim()) ?? 0.0;
    double _min = double.tryParse(minRangeCtrlr.text.trim()) ?? 0.0;

    CheckpointType checkpoint_type = CheckpointType(
        id: checkpointType.value == "Text"
            ? 0
            : checkpointType.value == "Bool"
                ? 1
                : checkpointType.value == "Range"
                    ? 2
                    : checkpointType.value == "Input Range"
                        ? 3
                        : 4,
        max: _max,
        min: _min);

    CreateCheckpoint createCheckpoint = CreateCheckpoint(
      check_point: _checkPoint,
      requirement: _requirement,
      checklist_id: _checklistId,
      id: checkPontId,
      is_document_required: isToggleOn.value ? 1 : 0,
      failure_weightage: _failurewtg,
      checkpoint_type: checkpoint_type,
      status: 1,
      type: type.value,
      type_of_observation: typeOfObsId,
      risk_type: incidenttypeId,
      cost_type: selectedCostTypeId,
    );
    var checkpointJsonString =
        createCheckpoint.toJson(); //createCheckPointToJson([createCheckpoint]);

    print({"checkpointJsonString", checkpointJsonString});
    await preventiveCheckPointPresenter.updateCheckPoint(
      checkpointJsonString: checkpointJsonString,
      isLoading: true,
    );
    return true;
  }

  void checkFormCheck() {
    if (selectedchecklist == '') {
      isSelectedchecklist.value = false;
      isFormInvalid.value = true;
    }
    if (checkPointCtrlr.text == '') {
      isCheckPointInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (checkPointCtrlr.text.trim().length < 0) {
      isCheckPointInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (requirementCtrlr.text == '') {
      isRequiremetInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedTypeOfObs == '') {
      isSelectedTypeOfObs.value = false;
      isFormInvalid.value = true;
    }
    if (selectedRiskTypeList == '') {
      isRiskTypeListSelected.value = false;
      isFormInvalid.value = true;
    }
    if (selectedCostTypeList == '') {
      isCostTypeListSelected.value = false;
      isFormInvalid.value = true;
    }

    if (failurewtgCtrlr.text == '') {
      isFailureInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
