import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/IncidentRiskTypeModel.dart';
import '../../domain/models/create_modulelist_model.dart';
import '../../domain/models/create_risk_type_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'incident_listContent_presenter.dart';

class IncidentRiskTypeController extends GetxController {
  IncidentRiskTypeController(
    this.moduleListPresenter,
  );
  IncidentRiskTypePresenter moduleListPresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<IncidentRiskTypeModel?>?
  moduleList =
      <IncidentRiskTypeModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );


  IncidentRiskTypeModel? moduleListModel;
  var isToggleOn = false.obs;
  var isToggle1On = false.obs;
  var isToggle2On = false.obs;
  var isToggle3On = false.obs;
  var isToggle4On = false.obs;
  var isToggle5On = false.obs;
  var isToggle6On = false.obs;
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }
  void toggle1() {
    isToggle1On.value = !isToggle1On.value;
  }
  void toggle2() {
    isToggle2On.value = !isToggle2On.value;
  }
  void toggle3() {
    isToggle3On.value = !isToggle3On.value;
  }
  void toggle4() {
    isToggle4On.value = !isToggle4On.value;
  }
  void toggle5() {
    isToggle5On.value = !isToggle5On.value;
  }
  void toggle6() {
    isToggle6On.value = !isToggle6On.value;
  }

  RxList<String> moduleListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  IncidentRiskTypeModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;
  @override
  void onInit() async {

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getIncidentRiskTypeList(facilityId, type, true);
      });
    });
    super.onInit();
  }

  Future<void> getIncidentRiskTypeList(
      int facilityId, int type, bool isLoading)
  async {
    moduleList?.value = <IncidentRiskTypeModel>[];
    final _moduleList =
        await moduleListPresenter.getIncidentRiskTypeList( isLoading: isLoading);

    if (_moduleList != null) {
      moduleList!.value = _moduleList;
      paginationController = PaginationController(
        rowCount: moduleList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (moduleList != null && moduleList!.isNotEmpty) {
        moduleListModel = moduleList![0];
        var preventiveCheckListJson = moduleListModel?.toJson();
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


  Future<bool> createModuleListNumber() async {
    if (titleCtrlr.text.trim() == '' ||
        descriptionCtrlr.text.trim() == ''  ) {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _moduleListNumber = titleCtrlr.text.trim();
      String _featureNumber = descriptionCtrlr.text.trim();

      CreateRiskTypeModel createModuleList = CreateRiskTypeModel(
          name : _moduleListNumber,
          description : _featureNumber,
      );

      var moduleListJsonString =
        createModuleList.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", moduleListJsonString});
      await moduleListPresenter.createRiskType(
        riskTypeJsonString: moduleListJsonString,
        isLoading: true,
      );
      return true;
    }
    getIncidentRiskTypeList(facilityId, type, true);
    return true;
  }

  Future<void> issuccessCreatemodulelist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {_cleardata()};
  }

  _cleardata() {
    titleCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;
    isToggleOn.value = false;
    isToggle1On.value = false;
    isToggle2On.value = false;
    isToggle3On.value = false;
    isToggle4On.value = false;
    isToggle5On.value = false;
    isToggle6On.value = false;
    Future.delayed(Duration(seconds: 1), () {
      getIncidentRiskTypeList(facilityId, type, true);
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
                  deleteRiskType(module_id).then((value) {
                    Get.back();
                    getIncidentRiskTypeList(facilityId, type, true);
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

  Future<void> deleteRiskType(String? module_id) async {
    {
      await moduleListPresenter.deleteRiskType(
        module_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateRiskType(moduleId) async {
    String _modulelistNumber = titleCtrlr.text.trim();
    String _featurelistNumber = descriptionCtrlr.text.trim();

    IncidentRiskTypeModel createModulelist = IncidentRiskTypeModel(
        id:moduleId,
        name: _modulelistNumber,
        description: _featurelistNumber
    );
    var modulelistJsonString =
        createModulelist.toJson(); //createCheckListToJson([createChecklist]);

    print({"modulelistJsonString", modulelistJsonString});
    await moduleListPresenter.updateRiskType(
      riskTypeJsonString: modulelistJsonString,
      isLoading: true,
    );
    return true;
  }
}

