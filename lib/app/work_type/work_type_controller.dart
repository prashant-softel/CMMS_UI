import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/work_type/work_type_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WorkTypeController extends GetxController {
  WorkTypeController(
    this.worktypepresenter,
  );
  WorkTypePresenter worktypepresenter;
  final HomeController homecontroller = Get.find();
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  FocusNode worktypenameFocus = FocusNode();
  ScrollController worktypenameScroll = ScrollController();
  // FocusNode bodypdescFocus = FocusNode();
  // ScrollController bodypdescScroll = ScrollController();
  WorkTypeModel? selectedItem;
  WorkTypeModel? selectedItemupdate;
  Rx<bool> isFormInvalid = false.obs;
  RxBool isCheckedRequire = false.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxBool isContainerVisible = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isChecked = true.obs;

  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  int facilityId = 0;
  // int categoryId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // PreventiveCheckListModel? preventiveCheckListModel;

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;

  int selectedEquipmentId = 0;
  // int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///SOP Permit List
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<WorkTypeModel?> worktypeList = <WorkTypeModel>[].obs;
  RxList<WorkTypeModel> BufferworktypeList = <WorkTypeModel>[].obs;
  Rx<bool> isworktypeListSelected = true.obs;
  Rx<String> assetc = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<WorkTypeModel> filteredData = <WorkTypeModel>[].obs;
  RxList<InventoryCategoryModel?> assetcategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<bool> isselectedassetc = true.obs;
  Rx<String> selectedassetcategory = ''.obs;

  PaginationController workTypeListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      worktypeList.value = BufferworktypeList.value;
      return;
    }
    List<WorkTypeModel> filteredList = BufferworktypeList.where((item) => (item
                .workType
                ?.toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()) ??
            false)
        // ||
        // (item.description
        //         ?.toString()
        //         .toLowerCase()
        //         .contains(keyword.toLowerCase()) ??
        //     false) // Add this condition to filter by searchId
        ).toList();
    worktypeList.value = filteredList;
  }

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();
  // var descriptionCtrlr = TextEditingController();

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription =
        homecontroller.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
        await getInventoryCategoryList(facilityId.toString());
        await getWorkTypeList();
      }
      // Future.delayed(Duration(seconds: 1), () {
      //   // getWorkTypeList();
      // });
    });
    worktypenameFocus.addListener(() {
      if (!worktypenameFocus.hasFocus) {
        worktypenameScroll.jumpTo(0.0);
      }
    });

    super.onInit();
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
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<bool> updateWorkType(id) async {
    String _name = titleCtrlr.text.trim();

    // String _description = descriptionCtrlr.text.trim();

    UpdateWorkTypeModel createChecklist = UpdateWorkTypeModel(
      id: id,
      categoryid: selectedEquipmentId,
      workType: _name,
      // description: _description,
    );
    var worktypeJsonString = createChecklist.toJson();

    print({"businessTypeJsonString", worktypeJsonString});
    await worktypepresenter.updateWorkType(
      worktypeJsonString: worktypeJsonString,
      isLoading: true,
    );
    return true;
  }

  // Future<void> getWorkTypeList({
  //   List<int>? receivedCategoryIds,
  // }) async {
  //   worktypeList.value = <WorkTypeModel>[];
  //   String lststrCategoryIds = receivedCategoryIds?.join(', ').toString() ?? '';
  //   final _workTypeList = await worktypepresenter.getWorkTypeList(
  //     categoryIds: lststrCategoryIds,
  //     isLoading: false,
  //   );
  //   worktypeList.value = _workTypeList ?? <WorkTypeModel>[];
  // }
  // Future<void> getIncidentRiskType() async {
  //   worktypeList.value = <WorkTypeModel>[];
  //   BufferworktypeList.value = <WorkTypeModel>[];
  //   final _worktypeList = await worktypepresenter.getIncidentRiskType(
  //     isLoading: true,
  //   );
  //   for (var facilityType_list in _worktypeList) {
  //     worktypeList.add(facilityType_list);
  //     BufferworktypeList.add(facilityType_list);
  //   }

  //   workTypeListPaginationController = PaginationController(
  //     rowCount: worktypeList.length,
  //     rowsPerPage: 10,
  //   );
  //   update(['Incidentrisktype_list']);
  // }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createWorkType() async {
    print("CREATE CONTROLLER");
    // if (titleCtrlr.text.trim() == '') {
    //   isTitleInvalid.value = true;
    //   isFormInvalid.value = true;
    // }
    // checkForm();
    // print("FORMVALIDITIY : $isFormInvalid.value");
    // print(
    //     "title : ${titleCtrlr.text.trim()}, assetcategoryId : $selectedEquipmentId");
    // if (isFormInvalid.value == true) {
    //   return false;
    // }
    // if (titleCtrlr.text.trim() == '') {
    //   Fluttertoast.showToast(
    //       msg: "Please enter required field", fontSize: 16.0);
    // } else {
    String _title = titleCtrlr.text.trim();
    print(_title);
    UpdateWorkTypeModel workType = UpdateWorkTypeModel(
        workType: _title, categoryid: selectedEquipmentId, id: 0);
    print("OUT ");
    var worktypelistJsonString =
        workType.toJson(); //createCheckPointToJson([workType]);

    print({"checkpointJsonString", worktypelistJsonString});
    await worktypepresenter.createWorkType(
      worktypeJsonString: worktypelistJsonString,
      isLoading: true,
    );
    return true;
    // }
    // return true;
  }

  Future<void> getWorkTypeList({
    List<int>? receivedCategoryIds,
  }) async {
    worktypeList.value = <WorkTypeModel>[];
    String lststrCategoryIds = receivedCategoryIds?.join(', ').toString() ?? '';
    final _workTypeList = await worktypepresenter.getWorkTypeList(
      categoryIds: lststrCategoryIds,
      isLoading: false,
    );
    worktypeList.value = _workTypeList ?? <WorkTypeModel>[];
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {cleardata()};
  }

  Future<void> getInventoryCategoryList(String? facilityId) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await worktypepresenter.getInventoryCategoryList(
      isLoading: false,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  cleardata() {
    titleCtrlr.text = '';
    selectedEquipmentId = 0;
    // descriptionCtrlr.text = '';
    // selectedStateId = 0;
    // selectedCountryId = 0;
    // selectedCityId = 0;
    // ownerId = 0;
    selectedItem = null;
    // customerId = 0;
    // operatorId = 0;
    // SpvId = 0;

    Future.delayed(Duration(seconds: 1), () {
      getWorkTypeList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? worktype_id, String? worktype}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Work Type?',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$worktype]",
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
                  deleteWorkType(worktype_id).then((value) {
                    Get.back();
                    getWorkTypeList();
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

  Future<void> deleteWorkType(String? worktype_id) async {
    {
      await worktypepresenter.deleteWorkType(
        worktype_id,
        isLoading: true,
      );
    }
  }

  void checkForm() {
    if (selectedassetcategory.value == '') {
      isselectedassetc.value = false;
    }
    if (isTitleInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
