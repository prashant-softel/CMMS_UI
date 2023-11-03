import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/warranty_certificate/warranty_certificate_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/warranty_certificate_model.dart';


class WarrantyCertificateController extends GetxController {
  WarrantyCertificateController(
    this.warrantyPresenter,
  );
  WarrantyCertificatePresenter warrantyPresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<WarrantyCertificateModel?>?
  warrantyList =
      <WarrantyCertificateModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );


  WarrantyCertificateModel? warrantyCertificateModel;


  RxList<String> moduleListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var modulelistNumberCtrlr = TextEditingController();
  var featureCtrlr = TextEditingController();
  WarrantyCertificateModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;
  @override
  void onInit() async {

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getWarrantyCertificate( type, true);
      });
    });
    super.onInit();
  }

  Future<void> getWarrantyCertificate( int type, bool isLoading)
  async {
    warrantyList?.value = <WarrantyCertificateModel>[];
    final _moduleList =
        await warrantyPresenter.getWarrantyCertificate( type: type, isLoading: isLoading);

    if (_moduleList != null) {
      warrantyList!.value = _moduleList.cast<WarrantyCertificateModel?>();
      paginationController = PaginationController(
        rowCount: warrantyList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (warrantyList != null && warrantyList!.isNotEmpty) {
        warrantyCertificateModel = warrantyList![0];
        var preventiveCheckListJson = warrantyCertificateModel?.toJson();
        moduleListTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          moduleListTableColumns.add(key);
        }
      }
    }
  }

  // Future<void> createModulelist() async {
  //   Get.toNamed(
  //     Routes.createCheckList,
  //   );
  // }
  //
  //
  // Future<bool> createModuleListNumber() async {
  //   if (modulelistNumberCtrlr.text.trim() == '' ||
  //       featureCtrlr.text.trim() == ''  ) {
  //     Fluttertoast.showToast(
  //         msg: "Please enter required field", fontSize: 16.0);
  //   } else {
  //     String _moduleListNumber = modulelistNumberCtrlr.text.trim();
  //     String _featureNumber = featureCtrlr.text.trim();
  //
  //     CreateModuleListModel createModuleList = CreateModuleListModel(
  //         moduleName : _moduleListNumber,
  //         featureName : _featureNumber,
  //         menuImage : null,
  //         add : isToggleOn.value?1:0,
  //         edit: isToggle1On.value?1:0,
  //         delete: isToggle2On.value?1:0,
  //         view: isToggle3On.value?1:0,
  //         approve: isToggle4On.value?1:0,
  //         issue: isToggle5On.value?1:0,
  //         selfView: isToggle6On.value?1:0,
  //     );
  //
  //     var moduleListJsonString =
  //       createModuleList.toJson(); //createCheckListToJson([createChecklist]);
  //
  //     print({"checklistJsonString", moduleListJsonString});
  //     await warrantyPresenter.createModulelistNumber(
  //       modulelistJsonString: moduleListJsonString,
  //       isLoading: true,
  //     );
  //     return true;
  //   }
  //   getModuleList(facilityId, type, true);
  //   return true;
  // }
  //
  // Future<void> issuccessCreatemodulelist() async {
  //   isSuccess.toggle();
  //
  //   // isToggleOn.value = false;
  //   await {_cleardata()};
  // }
  //
  // _cleardata() {
  //   modulelistNumberCtrlr.text = '';
  //   featureCtrlr.text = '';
  //   selectedItem = null;
  //   isToggleOn.value = false;
  //   isToggle1On.value = false;
  //   isToggle2On.value = false;
  //   isToggle3On.value = false;
  //   isToggle4On.value = false;
  //   isToggle5On.value = false;
  //   isToggle6On.value = false;
  //   Future.delayed(Duration(seconds: 1), () {
  //     getModuleList(facilityId, type, true);
  //   });
  //   Future.delayed(Duration(seconds: 5), () {
  //     isSuccess.value = false;
  //   });
  // }
  //
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
  //                   getModuleList(facilityId, type, true);
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
  //
  // Future<void> deleteModulelist(String? module_id) async {
  //   {
  //     await warrantyPresenter.deleteModulelist(
  //       module_id,
  //       isLoading: true,
  //     );
  //   }
  // }
  //
  // Future<bool> updateModulelistNumber(moduleId) async {
  //   String _modulelistNumber = modulelistNumberCtrlr.text.trim();
  //   String _featurelistNumber = featureCtrlr.text.trim();
  //
  //   WarrantyCertificateModel createModulelist = WarrantyCertificateModel(
  //       id:moduleId,
  //       moduleName: _modulelistNumber,
  //       featureName: _featurelistNumber,
  //       menuImage : null,
  //       add : isToggleOn.value?1:0,
  //       edit: isToggle1On.value?1:0,
  //       delete: isToggle2On.value?1:0,
  //       view: isToggle3On.value?1:0,
  //       approve: isToggle4On.value?1:0,
  //       issue: isToggle5On.value?1:0,
  //       selfView: isToggle6On.value?1:0,
  //   )  ;
  //   var modulelistJsonString =
  //       createModulelist.toJson(); //createCheckListToJson([createChecklist]);
  //
  //   print({"modulelistJsonString", modulelistJsonString});
  //   await warrantyPresenter.updateModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: true,
  //   );
  //   return true;
  // }
}

