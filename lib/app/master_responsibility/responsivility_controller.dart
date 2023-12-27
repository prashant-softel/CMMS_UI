import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/master_responsibility/responsivility_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/CreateDesignationModel.dart';
import '../../domain/models/designation_model.dart';
import '../../domain/models/frequency_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'module_list_presenter.dart';

class ResponsibilityListController extends GetxController {
  ResponsibilityListController(
    this.responsibilityPresenter,
  );

  ResponsibilityListPresenter responsibilityPresenter;
  final HomeController homecontroller = Get.find();

  // final HomeController homecontroller = Get.put( HomeController.new);
  // RxList<InventoryCategoryModel?> equipmentCategoryList =
  //     <InventoryCategoryModel>[].obs;
  // Rx<String> selectedequipment = ''.obs;
  // Rx<bool> isSelectedequipment = true.obs;
  // RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<DesignationModel?>? designationList = <DesignationModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxBool isContainerVisible = false.obs;
  DesignationModel? designationModel;
  final isSuccess = false.obs;

  RxList<String> moduleListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var nameCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;

  DesignationModel? selectedItem = null;
  StreamSubscription<int>? facilityIdStreamSubscription;
  bool isEditMode = false;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getDesignationList(true);
      });
    });
    super.onInit();
  }

  Future<void> getDesignationList(bool isLoading) async {
    designationList?.value = <DesignationModel>[];
    final _moduleList =
        await responsibilityPresenter.getDesignationList(isLoading: isLoading);

    if (_moduleList != null) {
      designationList!.value = _moduleList.cast<DesignationModel?>();
      paginationController = PaginationController(
        rowCount: designationList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (designationList != null && designationList!.isNotEmpty) {
        designationModel = designationList![0];
        var preventiveCheckListJson = designationModel?.toJson();
        moduleListTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          moduleListTableColumns.add(key);
        }
      }
    }
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<bool> createDesignation() async {
    print("CREATE CONTROLLER");
    if (nameCtrlr.text.trim() == '') {
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
    if (nameCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _name = nameCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CreateDesignationModel createModuleList =
          CreateDesignationModel(name: _name, description: _description);

      var moduleListJsonString =
          createModuleList.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", moduleListJsonString});
      await responsibilityPresenter.createDesignation(
        designationJsonString: moduleListJsonString,
        isLoading: true,
      );
      return true;
    }
    getDesignationList(true);
    return true;
  }

  Future<void> issuccessCreatemodulelist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {cleardata()};
  }

  cleardata() {
    nameCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getDesignationList(true);
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
                text: 'Are you sure you want to delete the Designation ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[${module}]",
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
                  deleteDesignation(module_id).then((value) {
                    Get.back();
                    getDesignationList(true);
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

  Future<void> deleteDesignation(String? module_id) async {
    {
      await responsibilityPresenter.deleteDesignation(
        module_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateDesignation(moduleId) async {
    String _name = nameCtrlr.text.trim();
    String _Description = descriptionCtrlr.text.trim();

    DesignationModel createModulelist =
        DesignationModel(id: moduleId, name: _name, description: _Description);
    var designationJsonString =
        createModulelist.toJson(); //createCheckListToJson([createChecklist]);

    print({"designationJsonString", designationJsonString});
    await responsibilityPresenter.updateDesignation(
      designationJsonString: designationJsonString,
      isLoading: true,
    );
    return true;
  }
}
