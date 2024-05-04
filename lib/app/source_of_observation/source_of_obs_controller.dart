import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/source_of_observation/source_of_obs_presenter.dart';
import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/createSourceOfModel.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SourceOfObsController extends GetxController {
  SourceOfObsController(
    this.moduleListPresenter,
  );
  SourceOfObsPresenter moduleListPresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
   Rx<bool> isTitleInvalid = false.obs;
  RxBool isContainerVisible = false.obs;
   Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  SourceOfObservationListModel? selectedItemupdate;

  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }
  RxList<SourceOfObservationListModel?> sourceObsList =
  <SourceOfObservationListModel>[].obs;


  RxList<ModuleListModel?>? moduleList = <ModuleListModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  SourceOfObservationListModel? sourceObsModel;
  void toggleContainer() {
    isContainerVisible.toggle();
  }

  ModuleListModel? moduleListModel;
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

  RxList<String> sourceCloumn = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  FocusNode rdescFocus = FocusNode();
  ScrollController rdescScroll = ScrollController();
  FocusNode rnameFocus = FocusNode();
  ScrollController rnameScroll = ScrollController();
  SourceOfObservationListModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getSourceObservationList();
      });
      rnameFocus.addListener(() {
        if (!rnameFocus.hasFocus) {
          rnameScroll.jumpTo(0.0);
        }
      });
      rdescFocus.addListener(() {
        if (!rdescFocus.hasFocus) {
          rdescScroll.jumpTo(0.0);
        }
      });
    });
    super.onInit();
  }

  Future<void> getSourceObservationList() async {
    sourceObsList?.value = <SourceOfObservationListModel>[];
    final _sourceObsList = await moduleListPresenter.getSourceObservationList(
        isLoading: isLoading.value);

    if (_sourceObsList != null) {
      sourceObsList.value = _sourceObsList;
      isLoading.value = false;
      paginationController = PaginationController(
        rowCount: moduleList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (sourceObsList != null && sourceObsList!.isNotEmpty) {
        sourceObsModel = sourceObsList![0];
        var preventiveCheckListJson = sourceObsModel?.toJson();
        sourceCloumn.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          sourceCloumn.add(key);
        }
      }
    }
    update(['Source_Of_Obs_list']);
  }


  Future<void> createModulelist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }
   Future<bool> createSourceOfObservationList() async {
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

      CreateSourceOfModel createCheckpoint =
          CreateSourceOfModel(name: _title, description: _description);
      print("OUT ");
      var facilitylistJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await  moduleListPresenter.createSourceOfObslist(
        facilitylistJsonString: facilitylistJsonString,
        isLoading: true,
      );
      cleardata();
       getSourceObservationList();
      return true;
    
    }
    return true;
  }

  //Update

  Future<bool> updatesourceOfObs(checklistId) async {
    String _name = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    SourceOfObservationListModel createChecklist = SourceOfObservationListModel(
      id: checklistId,
      name: _name,
      description: _description,
    );
    var businessTypeJsonString = createChecklist.toJson();

    print({"businessTypeJsonString", businessTypeJsonString});
    await moduleListPresenter.updatesourceOfObs(
      modulelistJsonString: businessTypeJsonString,
      isLoading: true,
    );
    return true;
    
  }
  // delete
  
  void isDeleteDialog({String? business_id, String? business}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Source_Of_Observatio ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$business]",
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
                  deleteSourceOfObs(business_id).then((value) {
                    Get.back();
                    getSourceObservationList();
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

  Future<void> deleteSourceOfObs(String? business_id) async {
      await moduleListPresenter.deleteSourceOfObs(
        business_id,
        isLoading: true,
      );
    
  }
  

  


  // Future<bool> createModuleListNumber() async {
  //   if (modulelistNumberCtrlr.text.trim() == '' ||
  //       featureCtrlr.text.trim() == '') {
  //     Fluttertoast.showToast(
  //         msg: "Please enter required field", fontSize: 16.0);
  //   } else {
  //     String _moduleListNumber = modulelistNumberCtrlr.text.trim();
  //     String _featureNumber = featureCtrlr.text.trim();

  //     CreateModuleListModel createModuleList = CreateModuleListModel(
  //       moduleName: _moduleListNumber,
  //       featureName: _featureNumber,
  //       menuImage: null,
  //       add: isToggleOn.value ? 1 : 0,
  //       edit: isToggle1On.value ? 1 : 0,
  //       delete: isToggle2On.value ? 1 : 0,
  //       view: isToggle3On.value ? 1 : 0,
  //       approve: isToggle4On.value ? 1 : 0,
  //       issue: isToggle5On.value ? 1 : 0,
  //       selfView: isToggle6On.value ? 1 : 0,
  //     );

  //     var moduleListJsonString =
  //         createModuleList.toJson(); //createCheckListToJson([createChecklist]);

  //     print({"checklistJsonString", moduleListJsonString});
  //     await moduleListPresenter.createModulelistNumber(
  //       modulelistJsonString: moduleListJsonString,
  //       isLoading: true,
  //     );
  //     return true;
  //   }
  //   getSourceObservationList();
  //   return true;
  // }

  Future<void> issuccessCreatemodulelist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {cleardata()};
  }
    Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {cleardata()};
  }

  cleardata() {
  
    selectedItem = null;
    titleCtrlr.clear();
    descriptionCtrlr.clear();
    Future.delayed(Duration(seconds: 1), () {
      getSourceObservationList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  // void isDeleteDialog({String? module_id, String? module}) {
  //   Get.dialog(
  //     AlertDialog(
  //       content: Column(mainAxisSize: MainAxisSize.min, children: [
  //         Icon(Icons.delete, size: 35, color: ColorValues.redColor),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         RichText(
  //           text: TextSpan(
  //               text: 'Are you sure you want to delete the Module ',
  //               style: Styles.blackBold16,
  //               children: [
  //                 TextSpan(
  //                   text: module,
  //                   style: TextStyle(
  //                     color: ColorValues.orangeColor,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ]),
  //         ),
  //       ]),
  //       actions: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             TextButton(
  //               onPressed: () {
  //                 Get.back();
  //               },
  //               child: Text('NO'),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 deleteModulelist(module_id).then((value) {
  //                   Get.back();
  //                   getSourceObservationList();
  //                 });
  //               },
  //               child: Text('YES'),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Future<void> deleteModulelist(String? module_id) async {
  //   {
  //     await moduleListPresenter.deleteModulelist(
  //       module_id,
  //       isLoading: true,
  //     );
  //   }
  // }

  // Future<bool> updateModulelistNumber(moduleId) async {
  //   String _modulelistNumber = modulelistNumberCtrlr.text.trim();
  //   String _featurelistNumber = featureCtrlr.text.trim();

  //   ModuleListModel createModulelist = ModuleListModel(
  //     id: moduleId,
  //     name: _modulelistNumber,
  //     featureName: _featurelistNumber,
  //     menuImage: null,
  //     add: isToggleOn.value ? 1 : 0,
  //     edit: isToggle1On.value ? 1 : 0,
  //     delete: isToggle2On.value ? 1 : 0,
  //     view: isToggle3On.value ? 1 : 0,
  //     approve: isToggle4On.value ? 1 : 0,
  //     issue: isToggle5On.value ? 1 : 0,
  //     selfView: isToggle6On.value ? 1 : 0,
  //   );
  //   var modulelistJsonString =
  //       createModulelist.toJson(); //createCheckListToJson([createChecklist]);

  //   print({"modulelistJsonString", modulelistJsonString});
  //   await moduleListPresenter.updateModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: true,
  //   );
  //   return true;
  // }

  void checkForm(){
    if(isTitleInvalid.value == true || isDescriptionInvalid.value ==true){
      isFormInvalid.value = true;
    }else{
       isFormInvalid.value = false;
    }
  }
}
