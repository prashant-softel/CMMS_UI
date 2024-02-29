import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/tool_type/tool_type_presenter.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/tools_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/models/work_type_tool_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ToolTypeController extends GetxController {
  ToolTypeController(
    this.worktypeToolpresenter,
  );
  ToolTypePresenter worktypeToolpresenter;
  final HomeController homecontroller = Get.find();
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  FocusNode tooltypenameFocus = FocusNode();
  ScrollController tooltypenameScroll = ScrollController();
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
  int selectedWorkTypeId = 0;

  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  Rx<bool> isTitleInvalid = false.obs;
  RxList<WorkTypeModel?> worktypeList = <WorkTypeModel>[].obs;
  RxList<ToolsModel?>? toolsRequiredToWorkTypeList = <ToolsModel>[].obs;

  RxList<ToolsModel?>? BufferworktypetoolList = <ToolsModel>[].obs;
  Rx<bool> isworktypeListSelected = true.obs;
  Rx<String> assetc = ''.obs;
  RxList<InventoryCategoryModel?> assetcategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<bool> isselectedassetc = true.obs;
  Rx<String> selectedassetcategory = ''.obs;
  ToolsModel? selectedItem;
  PaginationController workTypeListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      toolsRequiredToWorkTypeList!.value = BufferworktypetoolList!.value;
      return;
    }
    List<ToolsModel?> filteredList = BufferworktypetoolList!
        .where((item) =>
            (item!.linkedToolName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.Equipment_name?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.workTypeName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    toolsRequiredToWorkTypeList!.value = filteredList;
  }

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
        await getToolsRequiredToWorkTypeList("");
      }
    });
    tooltypenameFocus.addListener(() {
      if (!tooltypenameFocus.hasFocus) {
        tooltypenameScroll.jumpTo(0.0);
      }
    });

    super.onInit();
  }

  Future<void> getToolsRequiredToWorkTypeList(workTypeIds) async {
    print("Work type in controller, $workTypeIds");
    BufferworktypetoolList?.value = <ToolsModel>[];

    final list = await worktypeToolpresenter.getToolsRequiredToWorkTypeList(
      isLoading: false,
      workTypeIds: workTypeIds.toString(),
    );
    toolsRequiredToWorkTypeList!.value = list ?? <ToolsModel>[];
    BufferworktypetoolList!.value = toolsRequiredToWorkTypeList!.value;

    // str = toolsRequiredToWorkTypeList.join(" , ");
    // print({"str", str});
    update(['toolsRequiredToWorkTypeList']);
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

  Future<void> getWorkTypeList() async {
    worktypeList.value = <WorkTypeModel>[];
    final _workTypeList = await worktypeToolpresenter.getWorkTypeList(
      categoryIds: selectedEquipmentId.toString(),
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
        await worktypeToolpresenter.getInventoryCategoryList(
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
    selectedassetcategory.value = '';
    assetc.value = '';
    selectedWorkTypeId = 0;
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getToolsRequiredToWorkTypeList("");
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
                  deleteWorkTypeTool(worktype_id).then((value) {
                    Get.back();
                    cleardata();
                    // getToolsRequiredToWorkTypeList("");
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

  Future<void> deleteWorkTypeTool(String? worktypetool_id) async {
    {
      await worktypeToolpresenter.deleteWorkTypeTool(
        worktypetool_id,
        isLoading: true,
      );
    }
  }

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
      case RxList<WorkTypeModel>:
        {
          int equipmentIndex = worktypeList.indexWhere((x) => x?.name == value);
          selectedWorkTypeId = worktypeList[equipmentIndex]?.id ?? 0;

          getToolsRequiredToWorkTypeList(selectedWorkTypeId);
        }

        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<bool> createWorkTypeTool() async {
    print("CREATE CONTROLLER");
    String _title = titleCtrlr.text.trim();
    print(_title);
    WorkTypeToolModel workTypeTool = WorkTypeToolModel(
        Toolname: _title,
        equipmentCategoryId: selectedEquipmentId,
        id: 0,
        workTypeId: selectedWorkTypeId);
    print("OUT ");
    var worktypetoolJsonString =
        workTypeTool.toJson(); //createCheckPointToJson([workType]);

    print({"checkpointJsonString", worktypetoolJsonString});
    await worktypeToolpresenter.createWorkTypeTool(
      worktypetoolJsonString: worktypetoolJsonString,
      isLoading: true,
    );
    return true;
  }

  Future<bool> updateWorkTypeTool(toolId) async {
    String _title = titleCtrlr.text.trim();
    print(_title);
    WorkTypeToolModel workTypeTool = WorkTypeToolModel(
        Toolname: _title,
        equipmentCategoryId: selectedEquipmentId,
        id: toolId,
        workTypeId: selectedWorkTypeId);
    var worktypetoolJsonString =
        workTypeTool.toJson(); //createCheckPointToJson([workType]);

    print({"checkpointJsonString", worktypetoolJsonString});
    await worktypeToolpresenter.updateWorkTypeTool(
      worktypetoolJsonString: worktypetoolJsonString,
      isLoading: true,
    );
    return true;
  }
}
