import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/tool_type/tool_type_presenter.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/tool_type_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ToolTypeController extends GetxController {
  ToolTypeController(
    this.worktypepresenter,
  );
  ToolTypePresenter worktypepresenter;
  final HomeController homecontroller = Get.find();
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  FocusNode tooltypenameFocus = FocusNode();
  ScrollController tooltypenameScroll = ScrollController();
  ToolTypeModel? selectedItem;
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
  RxList<WorkTypeModel?> worktypeList = <WorkTypeModel>[].obs;
  RxList<ToolTypeModel> BufferworktypeList = <ToolTypeModel>[].obs;
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

  // void search(String keyword) {
  //   print('Keyword: $keyword');
  //   if (keyword.isEmpty) {
  //     worktypeList.value = BuffertooltypeList.value;
  //     return;
  //   }
  //   List<ToolTypeModel> filteredList = BuffertooltypeList.where((item) => (item
  //           .tool_name
  //           ?.toString()
  //           .toLowerCase()
  //           .contains(keyword.toLowerCase()) ??
  //       false)).toList();
  //   tooltypeList.value = filteredList;
  // }

  //Facility list / demo plant
  Rx<bool> isFacilitySelected = true.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();

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
    tooltypenameFocus.addListener(() {
      if (!tooltypenameFocus.hasFocus) {
        tooltypenameScroll.jumpTo(0.0);
      }
    });

    super.onInit();
  }

  // Future<bool> updateWorkType(id) async {
  //   String _name = titleCtrlr.text.trim();

  //   UpdateWorkTypeModel createChecklist = UpdateWorkTypeModel(
  //     id: id,
  //     categoryid: selectedEquipmentId,
  //     workType: _name,
  //   );
  //   var worktypeJsonString = createChecklist.toJson();

  //   print({"businessTypeJsonString", worktypeJsonString});
  //   await worktypepresenter.updateWorkType(
  //     worktypeJsonString: worktypeJsonString,
  //     isLoading: true,
  //   );
  //   return true;
  // }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createToolType() async {
    print("CREATE CONTROLLER");
    String tool_name = titleCtrlr.text.trim();
    print(tool_name);

    print({"tool name is: ", tool_name});
    await worktypepresenter.createToolType(
      tool_name: tool_name,
      isLoading: true,
    );
    return true;
  }

  Future<void> getWorkTypeList() async {
    worktypeList.value = <WorkTypeModel>[];
    final _workTypeList = await worktypepresenter.getWorkTypeList(
      categoryIds:
          selectedEquipmentId == 0 ? "" : selectedEquipmentId.toString(),
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
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      // getWorkTypeList();
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
                  // deleteWorkType(worktype_id).then((value) {
                  //   Get.back();
                  //   getWorkTypeList();
                  // });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Future<void> deleteWorkType(String? worktype_id) async {
  //   {
  //     await worktypepresenter.deleteWorkType(
  //       worktype_id,
  //       isLoading: true,
  //     );
  //   }
  // }

  // void checkForm() {
  //   if (selectedassetcategory.value == '') {
  //     isselectedassetc.value = false;
  //   }
  //   if (isTitleInvalid.value == true) {
  //     isFormInvalid.value = true;
  //   } else {
  //     isFormInvalid.value = false;
  //   }
  // }
  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;

          getWorkTypeList();
        }

        break;
      default:
        {
          //statements;
        }
        break;
    }
  }
}
