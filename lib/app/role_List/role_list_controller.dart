import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/app/role_List/role_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_modulelist_model.dart';
import '../../domain/models/create_role_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/models/role_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'module_list_presenter.dart';

class RoleListController extends GetxController {
  RoleListController(this.roleListPresenter,);

  RoleListPresenter roleListPresenter;
  final HomeController homecontroller = Get.find();

  // final HomeController homecontroller = Get.put( HomeController.new);
  // RxList<InventoryCategoryModel?> equipmentCategoryList =
  //     <InventoryCategoryModel>[].obs;
  // Rx<String> selectedequipment = ''.obs;
  // Rx<bool> isSelectedequipment = true.obs;
  // RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<RoleModel?>?
  roleList =
      <RoleModel?>[].obs;
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
  var featureCtrlr = TextEditingController();
  RoleModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getRoleList( true);
      });
    });
    super.onInit();
  }

  Future<void> getRoleList(bool isLoading) async {
    roleList?.value = <RoleModel>[];
    final _moduleList =
    await roleListPresenter.getRoleList(isLoading: isLoading);

    if (_moduleList != null) {
      roleList!.value = _moduleList.cast<RoleModel?>();
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


  Future<bool> createRoleList() async {
    if (rolelistNumberCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _role = rolelistNumberCtrlr.text.trim();

      CreateRoleModel createModuleList = CreateRoleModel(
        name : _role,
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
    getRoleList(true);
    return true;
  }

  Future<void> issuccessCreatemodulelist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {_cleardata()};
  }
  _cleardata() {
    rolelistNumberCtrlr.text = '';
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getRoleList(true);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
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
                    getRoleList(true);
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

    RoleModel createModulelist = RoleModel(
      id:moduleId,
      name: _name
    );
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

