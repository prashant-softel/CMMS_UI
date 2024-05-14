import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/type_of_observation/type_of_obs_presenter.dart';
import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:cmms/domain/models/type_of_obs_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/createSourceOfModel.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TypeOfObsController extends GetxController {
  TypeOfObsController(
    this.moduleListPresenter,
  );
  TypeOfObsPresenter moduleListPresenter;
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

  RxList<TypeOfObsListModel?> TypeOfObsList = <TypeOfObsListModel>[].obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  TypeOfObsListModel? typeOfObsModel;

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  TypeOfObsListModel? typeOfObsListModel;

  ModuleListModel? moduleListModel;

  final isSuccess = false.obs;

  RxList<String> sourceCloumn = <String>[].obs;

  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  FocusNode rdescFocus = FocusNode();
  ScrollController rdescScroll = ScrollController();
  FocusNode rnameFocus = FocusNode();
  ScrollController rnameScroll = ScrollController();
  TypeOfObsListModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getTypeOfObservationList();
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

  Future<void> getTypeOfObservationList() async {
    TypeOfObsList.value = <TypeOfObsListModel>[];
    final _TypeOfObsList = await moduleListPresenter.getTypeOfObservationList(
        isLoading: isLoading.value);

    TypeOfObsList.value = _TypeOfObsList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: TypeOfObsList.length ?? 0,
      rowsPerPage: 10,
    );

    if (TypeOfObsList.isNotEmpty) {
      typeOfObsModel = TypeOfObsList[0];
      var preventiveCheckListJson = typeOfObsListModel?.toJson();
      sourceCloumn.value = <String>[];
      for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
        sourceCloumn.add(key);
      }
    }
      update(['Type_of_Observation_list']);
  }

  Future<void> createModulelist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }

  Future<bool> createTypeOfObservationList() async {
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
      await moduleListPresenter.createTypeOfObslist(
        facilitylistJsonString: facilitylistJsonString,
        isLoading: true,
      );
      cleardata();
      getTypeOfObservationList();
      return true;
    }
    return true;
  }

  //Update

  Future<bool> updatetypeOfObs(checklistId) async {
    String _name = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    SourceOfObservationListModel createChecklist = SourceOfObservationListModel(
      id: checklistId,
      name: _name,
      description: _description,
    );
    var businessTypeJsonString = createChecklist.toJson();

    print({"businessTypeJsonString", businessTypeJsonString});
    await moduleListPresenter.updatetypeOfObs(
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
                text:
                    'Are you sure you want to delete the Source_Of_Observation',
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
                  deleteTypeOfObs(business_id).then((value) {
                    Get.back();
                    getTypeOfObservationList();
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

  Future<void> deleteTypeOfObs(String? business_id) async {
    await moduleListPresenter.deleteTypeOfObs(
      business_id,
      isLoading: true,
    );
  }

  // //Update

  // Future<bool> updatesourceOfObs(checklistId) async {
  //   String _name = titleCtrlr.text.trim();
  //   String _description = descriptionCtrlr.text.trim();

  //   SourceOfObservationListModel createChecklist = SourceOfObservationListModel(
  //     id: checklistId,
  //     name: _name,
  //     description: _description,
  //   );
  //   var businessTypeJsonString = createChecklist.toJson();

  //   print({"businessTypeJsonString", businessTypeJsonString});
  //   await moduleListPresenter.updatesourceOfObs(
  //     modulelistJsonString: businessTypeJsonString,
  //     isLoading: true,
  //   );
  //   return true;

  // }
  // delete

  // void isDeleteDialog({String? business_id, String? business}) {
  //   Get.dialog(
  //     AlertDialog(
  //       content: Column(mainAxisSize: MainAxisSize.min, children: [
  //         Icon(Icons.delete, size: 35, color: ColorValues.redColor),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         RichText(
  //           text: TextSpan(
  //               text: 'Are you sure you want to delete the Source_Of_Observatio ',
  //               style: Styles.blackBold16,
  //               children: [
  //                 TextSpan(
  //                   text: "[$business]",
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
  //                 deleteSourceOfObs(business_id).then((value) {
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

  // Future<void> deleteSourceOfObs(String? business_id) async {
  //     await moduleListPresenter.deleteSourceOfObs(
  //       business_id,
  //       isLoading: true,
  //     );

  // }

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
      getTypeOfObservationList();
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

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
