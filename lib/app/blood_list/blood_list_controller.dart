import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/blood_model.dart';
import '../../domain/models/create_modulelist_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'blood_list_presenter.dart';

class BloodListController extends GetxController {
  BloodListController(
    this.bloodListPresenter,
  );
  BloodListPresenter bloodListPresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<BloodModel?>?
  bloodList =
      <BloodModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );


  BloodModel? bloodModel;
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
  var modulelistNumberCtrlr = TextEditingController();
  var featureCtrlr = TextEditingController();
  BloodModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;
  @override
  void onInit() async {

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getBloodList(facilityId, type, true);
      });
    });
    super.onInit();
  }

  Future<void> getBloodList(
      int facilityId, int type, bool isLoading)
  async {
    bloodList?.value = <BloodModel>[];
    final _bloodList =
        await bloodListPresenter.getBloodList(
             isLoading: isLoading);

    if (_bloodList != null) {
      bloodList!.value = _bloodList.cast<BloodModel?>();
      paginationController = PaginationController(
        rowCount: bloodList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (bloodList != null && bloodList!.isNotEmpty) {
        bloodModel = bloodList![0];
        var preventiveCheckListJson = bloodModel?.toJson();
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
    if (modulelistNumberCtrlr.text.trim() == '' ||
        featureCtrlr.text.trim() == ''  ) {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _moduleListNumber = modulelistNumberCtrlr.text.trim();
      String _featureNumber = featureCtrlr.text.trim();

      CreateModuleListModel createModuleList = CreateModuleListModel
        (
          moduleName : _moduleListNumber,
          featureName : _featureNumber,
          menuImage : null,
          add : isToggleOn.value?1:0,
          edit: isToggle1On.value?1:0,
          delete: isToggle2On.value?1:0,
          view: isToggle3On.value?1:0,
          approve: isToggle4On.value?1:0,
          issue: isToggle5On.value?1:0,
          selfView: isToggle6On.value?1:0,
      );

      var moduleListJsonString =
        createModuleList.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", moduleListJsonString});
      await bloodListPresenter.createModulelistNumber(
        modulelistJsonString: moduleListJsonString,
        isLoading: true,

      );
      return true;
    }
    getBloodList(facilityId, type, true);
    return true;
  }

  Future<void> issuccessCreatemodulelist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {_cleardata()};
  }

  _cleardata() {
    modulelistNumberCtrlr.text = '';
    featureCtrlr.text = '';
    selectedItem = null;
    isToggleOn.value = false;
    isToggle1On.value = false;
    isToggle2On.value = false;
    isToggle3On.value = false;
    isToggle4On.value = false;
    isToggle5On.value = false;
    isToggle6On.value = false;
    Future.delayed(Duration(seconds: 1), () {
      getBloodList(facilityId, type, true);
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
                  deleteModulelist(module_id).then((value) {
                    Get.back();
                    getBloodList(facilityId, type, true);
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

  Future<void> deleteModulelist(String? module_id) async {
    {
      await bloodListPresenter.deleteModulelist(
        module_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateModulelistNumber(moduleId) async {
    String _modulelistNumber = modulelistNumberCtrlr.text.trim();
    String _featurelistNumber = featureCtrlr.text.trim();

    BloodModel createModulelist = BloodModel(
        id:moduleId,
        name:null
        // moduleName: _modulelistNumber,
        // featureName: _featurelistNumber,
        // menuImage : null,
        // add : isToggleOn.value?1:0,
        // edit: isToggle1On.value?1:0,
        // delete: isToggle2On.value?1:0,
        // view: isToggle3On.value?1:0,
        // approve: isToggle4On.value?1:0,
        // issue: isToggle5On.value?1:0,
        // selfView: isToggle6On.value?1:0,
    )  ;
    var modulelistJsonString =
        createModulelist.toJson(); //createCheckListToJson([createChecklist]);

    print({"modulelistJsonString", modulelistJsonString});
    await bloodListPresenter.updateModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: true,
    );
    return true;
  }
}

