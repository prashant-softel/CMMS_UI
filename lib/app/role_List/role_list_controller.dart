import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/role_List/role_list_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_role_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/role_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'module_list_presenter.dart';

class RoleListController extends GetxController {
  RoleListController(
    this.roleListPresenter,
  );

  RoleListPresenter roleListPresenter;
  final HomeController homecontroller = Get.find();

  // final HomeController homecontroller = Get.put( HomeController.new);
  // RxList<InventoryCategoryModel?> equipmentCategoryList =
  //     <InventoryCategoryModel>[].obs;
  // Rx<String> selectedequipment = ''.obs;
  // Rx<bool> isSelectedequipment = true.obs;
  // RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<RoleModel?>? roleList = <RoleModel?>[].obs;
  RxList<RoleModel?> filteredData = <RoleModel?>[].obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  RoleModel? roleModel;
  final isSuccess = false.obs;

  RxList<String> moduleListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var rolelistNumberCtrlr = TextEditingController();
  FocusNode rolenameFocus = FocusNode();
  ScrollController rolenameScroll = ScrollController();
  Rx<bool> isRoleListInvalid = false.obs;

  Rx<bool> isFormInvalid = false.obs;
  RxBool isContainerVisible = false.obs;

  var featureCtrlr = TextEditingController();
  RoleModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;

  Rx<bool> isLoading = true.obs;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getRoleList();
      });
    });
    rolenameFocus.addListener(() {
      if (!rolenameFocus.hasFocus) {
        rolenameScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> getRoleList() async {
    roleList?.value = <RoleModel>[];
    filteredData.value = <RoleModel>[];

    final _moduleList =
        await roleListPresenter.getRoleList(isLoading: isLoading.value);

    if (_moduleList != null) {
      roleList!.value = _moduleList.cast<RoleModel?>();
      filteredData.value = roleList!.value;
      isLoading.value = false;
      paginationController = PaginationController(
        rowCount: roleList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (roleList != null && roleList!.isNotEmpty) {
        roleModel = roleList![0];
        var preventiveCheckListJson = roleModel?.toJson();
        moduleListTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          moduleListTableColumns.add(key);
        }
      }
    }
  }

  Future<void> createModulelist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }

  void checkForm() {
    if (isRoleListInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<bool> createRoleList() async {
    if (rolelistNumberCtrlr.text.trim() == '') {
      isRoleListInvalid.value = true;
      isFormInvalid.value = true;
    }
    checkForm();
    if (isFormInvalid.value == true) {
      return false;
    }
    if (rolelistNumberCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _role = rolelistNumberCtrlr.text.trim();

      CreateRoleModel createModuleList = CreateRoleModel(
        name: _role,
      );

      var moduleListJsonString =
          createModuleList.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", moduleListJsonString});
      await roleListPresenter.createRoleList(
        modulelistJsonString: moduleListJsonString,
        isLoading: true,
      );
      return true;
    }
    getRoleList();
    return true;
  }

  Future<void> issuccessCreatemodulelist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {cleardata()};
  }

  cleardata() {
    rolelistNumberCtrlr.text = '';
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getRoleList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      roleList?.value = filteredData.value;
      return;
    }
    List<RoleModel?> filteredList = filteredData
        .where((item) => (item?.name
                ?.toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()) ??
            false))
        .toList();
    roleList?.value = filteredList;
  }

  void isDeleteDialog({String? module_id, String? module}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Module ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: module,
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
                  deleteRoleList(module_id).then((value) {
                    Get.back();
                    getRoleList();
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

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<void> deleteRoleList(String? module_id) async {
    {
      await roleListPresenter.deleteRoleList(
        module_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateRoleList(moduleId) async {
    String _name = rolelistNumberCtrlr.text.trim();

    RoleModel createModulelist = RoleModel(id: moduleId, name: _name);
    var modulelistJsonString =
        createModulelist.toJson(); //createCheckListToJson([createChecklist]);

    print({"modulelistJsonString", modulelistJsonString});
    await roleListPresenter.updateRoleList(
      modulelistJsonString: modulelistJsonString,
      isLoading: true,
    );
    return true;
  }
}
