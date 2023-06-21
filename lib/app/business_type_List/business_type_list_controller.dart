import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/business_type_model.dart';
import '../../domain/models/create_business_type.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'business_type_list_presenter.dart';

class BusinessTypeListController extends GetxController {
  BusinessTypeListController(
      this.preventiveListPresenter,
      );
  BusinessTypeListPresenter preventiveListPresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<BusinessTypeModel?>? preventiveCheckList =
      <BusinessTypeModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  BusinessTypeModel? preventiveCheckListModel;

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var descriptionCtrlr = TextEditingController();
  var nameCtrlr = TextEditingController();
  BusinessTypeModel? selectedItem;
  var manpowerCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  @override
  void onInit() async {
    getInventoryCategoryList();
    getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getBusinessTypeList(facilityId, type, true);
      });
    });
    super.onInit();
  }

  Future<void> getFrequencyList() async {
    final list = await preventiveListPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  Future<void> getInventoryCategoryList() async {
    final list = await preventiveListPresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }

  Future<void> getBusinessTypeList(
      int facilityId, int type, bool isLoading) async {
    preventiveCheckList?.value = <BusinessTypeModel>[];
    final _businessTypeList =
    await preventiveListPresenter.getBusinessTypeList(
        businessType: facilityId,  isLoading: isLoading);

    if (_businessTypeList != null) {
        preventiveCheckList!.value = _businessTypeList;
      paginationController = PaginationController(
        rowCount: preventiveCheckList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (preventiveCheckList != null && preventiveCheckList!.isNotEmpty) {
        preventiveCheckListModel = preventiveCheckList![0];
        var preventiveCheckListJson = preventiveCheckListModel?.toJson();
        preventiveCheckListTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          preventiveCheckListTableColumns.add(key);
        }
      }
    }
  }

  Future<void> createChecklist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
          equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
          frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<bool>  createBusinessTypeNumber() async {
    if (nameCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _name = nameCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CreateBusinessTypeModel businestypelist = CreateBusinessTypeModel(
          name : _name,
          description: _description,
          status: 1,
      );
      var businesstypelistJsonString =
        businestypelist.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", businesstypelistJsonString});
      await preventiveListPresenter.createBusinessTypeNumber(
        businesstypelistJsonString: businesstypelistJsonString,
        isLoading: true,
      );
      return true;
    }
      getBusinessTypeList(
          facilityId, type, true);

    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();

    await {_cleardata()};
  }

  _cleardata() {
    descriptionCtrlr.text = '';
    nameCtrlr.text = '';
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getBusinessTypeList(facilityId, type, true);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? checklist_id, String? checklist}) {
    Get.dialog(
      AlertDialog(

        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the checkpoint ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: checklist,
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
                  deleteBusinessTypelist(checklist_id).then((value) {
                    Get.back();
                    getBusinessTypeList(facilityId, type, true);
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

  Future<void> deleteBusinessTypelist(String? checklist_id) async {
    {
      await preventiveListPresenter.deleteBusinessTypelist(
        checklist_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateBusinessTypeNumber(checklistId , status) async {
    String _name = nameCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();
    // String _manpower = manpowerCtrlr.text.trim();

    BusinessTypeModel createBusinessList = BusinessTypeModel(
        id: checklistId,
        name : _name ,
        description: _description,
        status : status
    );
    var businessTypeJsonString =
    createBusinessList.toJson(); //createCheckListToJson([createChecklist]);

    print({"businessTypeJsonString", businessTypeJsonString});
    await preventiveListPresenter.updateBusinessTypeNumber(
      businessTypeJsonString: businessTypeJsonString,
      isLoading: true,
    );
    return true;
  }
}
