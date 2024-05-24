import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/targeted_group/targeted_group_presenter.dart';
import 'package:cmms/domain/models/course_category_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TargetedGroupController extends GetxController {
  TargetedGroupController(
    this.targetedgroupPresenter
  );
  TargetedGroupPresenter targetedgroupPresenter;
  final HomeController homecontroller = Get.find();
  CourseCategoryModel? selectedItem;
  CourseCategoryModel? selectedItemupdate;
  Rx<bool> isFormInvalid = false.obs;
  RxBool isCheckedRequire = false.obs;
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
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // PreventiveCheckListModel? preventiveCheckListModel;

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///SOP Permit List
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<CourseCategoryModel> TargetedGroup = <CourseCategoryModel>[].obs;
  RxList<CourseCategoryModel> BufferTargetedGroup = <CourseCategoryModel>[].obs;
  Rx<bool> isTargetedGroupSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<CourseCategoryModel> filteredData = <CourseCategoryModel>[].obs;

  PaginationController CourseCategoryPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      TargetedGroup.value = BufferTargetedGroup.value;
      return;
    }
    List<CourseCategoryModel> filteredList = BufferTargetedGroup.where((item) =>
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.description
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) // Add this condition to filter by searchId
        ).toList();
    TargetedGroup.value = filteredList;
  }
  // void search(String keyword) {
  //   print('Keyword: $keyword');

  //   if (keyword.isEmpty) {
  //     TargetedGroup.value = filteredData.toList();
  //     print('TargetedGroup length (empty keyword): ${TargetedGroup.length}');
  //     return;
  //   }

  //   TargetedGroup.value = filteredData
  //       .where((item) =>
  //           item.name
  //               ?.toString()
  //               .toLowerCase()
  //               .contains(keyword.toLowerCase()) ??
  //           false)
  //       .toList();

  //   print('TargetedGroup length (non-empty keyword): ${TargetedGroup.length}');
  // }

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  FocusNode titleFocus = FocusNode();
  ScrollController titleScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getTargetedGroup();
      });
    });
    titleFocus.addListener(() {
      if (!titleFocus.hasFocus) {
        titleScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> getTargetedGroup() async {
    TargetedGroup.value = <CourseCategoryModel>[];
    BufferTargetedGroup.value = <CourseCategoryModel>[];
    final _CousreCategory = await targetedgroupPresenter.getTargetedGroup(
      isLoading: isLoading.value,
      // categoryIds: categoryIds,
      job_type_id: selectedJobSOPId,
      // job_type_id: 36,
    );
    isLoading.value = false;
    for (var facilityType_list in _CousreCategory) {
    TargetedGroup.add(facilityType_list);
    BufferTargetedGroup.add(facilityType_list);
  }
      // selectedSopPermit.value = _SPVList[0].name ?? '';

    // supplierNameList = _supplierNameList;
    CourseCategoryPaginationController = PaginationController(
      rowCount: TargetedGroup.length,
      rowsPerPage: 10,
    );
    update(['Course_Controller']);
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createTargetedGroup() async {
    print("CREATE CONTROLLER");
    if (titleCtrlr.text.trim() == '') {
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
    if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CourseCategoryModel createCheckpoint =
          CourseCategoryModel(name: _title, description: _description);
      print("OUT ");
      var CourseCategoryJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", CourseCategoryJsonString});
      await targetedgroupPresenter.createTargetedGroup(
        CourseCategoryJsonString: CourseCategoryJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {cleardata()};
  }

  cleardata() {
    titleCtrlr.text = '';
    descriptionCtrlr.text = '';
    // selectedStateId = 0;
    // selectedCountryId = 0;
    // selectedCityId = 0;
    // ownerId = 0;
    selectedItem = null;
    // customerId = 0;
    // operatorId = 0;
    // SpvId = 0;

    Future.delayed(Duration(seconds: 1), () {
      getTargetedGroup();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateTargetedGroup(checklistId) async {
    String _name = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    CourseCategoryModel createChecklist = CourseCategoryModel(
      id: checklistId,
      name: _name,
      description: _description,
    );
    var CourseCategoryJsonString = createChecklist.toJson();

    print({"CourseCategoryJsonString", CourseCategoryJsonString});
    await targetedgroupPresenter.updateTargetedGroup(
      CourseCategoryJsonString: CourseCategoryJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({String? category_id, String? categoey}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Tagte ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$categoey]",
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
                  deleteTargetedGroup(category_id).then((value) {
                    Get.back();
                    getTargetedGroup();
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

  Future<void> deleteTargetedGroup(String? category_id) async {
    {
      await targetedgroupPresenter.deleteTargetedGroup(
        category_id,
        isLoading: true,
      );
    }
  }

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
