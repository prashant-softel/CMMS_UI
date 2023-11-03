import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/business_type_model.dart';
import '../../domain/models/create_business_type_list_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'business_type_list_presenter.dart';

class BusinessTypeListController extends GetxController {
  BusinessTypeListController(
      this.businessTypepresenter,
      );
  BusinessTypeListPresenter businessTypepresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<BusinessTypeModel?>? businessTypeList =
      <BusinessTypeModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  BusinessTypeModel? businessTypeListModel;
  RxList<BusinessTypeModel?> filteredData = <BusinessTypeModel?>[].obs;
  Rx<bool> isFormInvalid = false.obs;

  RxList<String> businessTypeListTableColumns = <String>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var nameCtrlr = TextEditingController();
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;

  BusinessTypeModel? selectedItem;
  var descriptionCtrlr = TextEditingController();
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  @override
  void onInit() async {

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getBusinessTypeList(facilityId, type, true);
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      businessTypeList!.value = filteredData;
      return;
    }


    businessTypeList!.value = filteredData
        .where((item) =>
        item!.name!.toString().contains(keyword))
        .toList();
  }

  Future<void> getBusinessTypeList(
      int facilityId, int type, bool isLoading) async {
    businessTypeList?.value = <BusinessTypeModel>[];
    final _businessTypeList =
    await businessTypepresenter.getBusinessTypeList(
        businessType: facilityId,  isLoading: isLoading);

    if (_businessTypeList != null) {
      businessTypeList!.value = _businessTypeList;
      filteredData.value = _businessTypeList;
      paginationController = PaginationController(
        rowCount: businessTypeList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (filteredData.isNotEmpty) {
        businessTypeListModel = filteredData[0];
        var preventiveCheckListJson = businessTypeListModel?.toJson();
        businessTypeListTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          businessTypeListTableColumns.add(key);
        }
      }
    }
  }

  Future<void> createChecklist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }


  void checkForm() {
    if(isTitleInvalid.value == true || isDescriptionInvalid.value == true){
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
  Future<bool> createBusinessType() async {
    if (nameCtrlr.text.trim() == '' ) {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
      // isDescriptionInvalid.value = true;
    }
    if (descriptionCtrlr.text.trim() == '' ) {
      // isTitleInvalid.value = true;
      isFormInvalid.value = true;
      isDescriptionInvalid.value = true;
    }
    checkForm();
    if (isFormInvalid.value == true) {
      return false;
    }
    if (nameCtrlr.text.trim() == '' ||
        descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _name = nameCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CreateBusinessTypeListModel createBusinessType = CreateBusinessTypeListModel(
          name: _name,
          description : _description
      );
      var businessTypeJsonString =
        createBusinessType.toJson(); //createCheckListToJson([createChecklist]);

      print({"businessTypeJsonString", businessTypeJsonString});
      await businessTypepresenter.createBusinessType(
        businessTypeJsonString: businessTypeJsonString,
        isLoading: true,
      );
      return true;
    }
    getBusinessTypeList(facilityId, type, true);
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();

    await {cleardata()};
  }

  cleardata() {
    nameCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getBusinessTypeList(facilityId, type, true);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? businesstype_id, String? businesstype}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Business Type ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: businesstype,
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
                  deleteBusinessType(businesstype_id).then((value) {
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

  Future<void> deleteBusinessType(String? businesstype_id) async {
    {
      await businessTypepresenter.deleteBusinessType(
        businesstype_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateBusinessType(checklistId) async {
    String _name = nameCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    BusinessTypeModel createChecklist = BusinessTypeModel(
        id: checklistId,
        name : _name,
        description: _description
    );
    var businessTypeJsonString =
      createChecklist.toJson();

    print({"businessTypeJsonString", businessTypeJsonString});
    await businessTypepresenter.updateBusinessType(
      businessTypeJsonString: businessTypeJsonString,
      isLoading: true,
    );
    return true;
  }
}
