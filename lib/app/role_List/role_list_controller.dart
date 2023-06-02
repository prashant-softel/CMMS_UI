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

}

