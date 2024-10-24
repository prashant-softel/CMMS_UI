import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/work_type/work_type_presenter.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:flutter/material.dart';
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
  WorkTypeModel? selectedItem;
  Rx<bool> isFormInvalid = false.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxBool isContainerVisible = false.obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  int selectedEquipmentId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  Rx<bool> isTitleInvalid = false.obs;
  RxList<WorkTypeModel?> worktypeList = <WorkTypeModel?>[].obs;
  RxList<WorkTypeModel> BufferworktypeList = <WorkTypeModel>[].obs;
  Rx<bool> isworktypeListSelected = true.obs;
  Rx<String> assetc = ''.obs;
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
      worktypeList.value = BufferworktypeList.toList();
      return;
    }

    List<WorkTypeModel> filteredList = BufferworktypeList.where((item) =>
        (item.name?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
            false) ||
        (item.categoryName
                ?.toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()) ??
            false)).toList();

    worktypeList.value = filteredList;
  }

  //Facility list / demo plant
  Rx<bool> isFacilitySelected = true.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    facilityIdStreamSubscription =
        homecontroller.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
        await getInventoryCategoryList(facilityId.toString());
        await getWorkTypeList();
      }
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
      case const (RxList<InventoryCategoryModel>):
        {
          if (value != "Please Select") {
            int equipmentIndex =
                equipmentCategoryList.indexWhere((x) => x?.name == value);
            selectedEquipmentId =
                equipmentCategoryList[equipmentIndex]?.id ?? 0;
            isselectedassetc.value = true;
          } else {
            selectedEquipmentId = 0;
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

  Future<bool> updateWorkType(id) async {
    if (titleCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedassetcategory.value.isEmpty) {
      isselectedassetc.value = true;
      isFormInvalid.value = true;
    }
    checkForm();
    if (isFormInvalid.value == true) {
      return false;
    }
    String _name = titleCtrlr.text.trim();
    int _catId = selectedEquipmentId;
    UpdateWorkTypeModel createChecklist = UpdateWorkTypeModel(
      id: id,
      categoryid: _catId,
      workType: _name,
    );
    var worktypeJsonString = createChecklist.toJson();

    print({"businessTypeJsonString", worktypeJsonString});
    await worktypepresenter.updateWorkType(
      worktypeJsonString: worktypeJsonString,
      isLoading: true,
    );
    return true;
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createWorkType() async {
    print("CREATE CONTROLLER");
    if (titleCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (selectedassetcategory.value.isEmpty) {
      isselectedassetc.value = true;
      isFormInvalid.value = true;
    }
    checkForm();
    if (isFormInvalid.value == true) {
      return false;
    }
    String _title = titleCtrlr.text.trim();
    print(_title);
    WorkTypeModel name =
        WorkTypeModel(name: _title, categoryid: selectedEquipmentId, id: 0);
    print("OUT ");
    var worktypelistJsonString =
        name.toJson(); //createCheckPointToJson([workType]);

    print({"checkpointJsonString", worktypelistJsonString});
    await worktypepresenter.createWorkType(
      worktypeJsonString: worktypelistJsonString,
      isLoading: true,
    );
    return true;
  }

  Future<void> getWorkTypeList({
    List<int>? receivedCategoryIds,
  }) async {
    worktypeList.value = <WorkTypeModel>[];
    BufferworktypeList.value = <WorkTypeModel>[];
    String lststrCategoryIds = receivedCategoryIds?.join(', ').toString() ?? '';
    final _workTypeList = await worktypepresenter.getWorkTypeList(
      categoryIds: lststrCategoryIds,
      isLoading: isLoading.value,
    );
    worktypeList.value = _workTypeList ?? <WorkTypeModel>[];
    BufferworktypeList.value =
        _workTypeList?.whereType<WorkTypeModel>().toList() ?? <WorkTypeModel>[];
    isLoading.value = false;

    // BufferworktypeList.value = worktypeList.value
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
    selectedassetcategory.value = '';
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getWorkTypeList();
    });
    Future.delayed(Duration(seconds: 3), () {
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
                text: 'Are you sure you want to delete the Fault?',
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
