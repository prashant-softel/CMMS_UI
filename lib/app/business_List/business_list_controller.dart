import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/business_list_model.dart';
import '../../domain/models/business_type_model.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/create_business_list_model.dart';
import '../../domain/models/create_modulelist_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'business_list_presenter.dart';


class BusinessListController extends GetxController {
  BusinessListController(
    this.businessListPresenter,
  );
  BusinessListPresenter businessListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<BusinessTypeModel?> countryList =
      <BusinessTypeModel>[].obs;
  RxList<BusinessTypeModel?>  businessCategoryList =
      <BusinessTypeModel>[].obs;
  Rx<String> selectedBusinessType = ''.obs;
  Rx<bool> isSelectedBusinessType = true.obs;
  int selectedBusinessTypeId = 1;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<BusinessListModel?>?
  moduleList =
      <BusinessListModel?>[].obs;
  int facilityId = 0;
  // int businessType = 0;
  int type = 0;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );


  BusinessListModel? moduleListModel;
  var isToggleOn = true.obs;
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  RxList<String> moduleListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var businesslistNumberCtrlr = TextEditingController();
  var emailCtrlr = TextEditingController();
  var contactpersonCtrlr = TextEditingController();
  var contactnumberCtrlr = TextEditingController();
  var websiteCtrlr = TextEditingController();
  var locationCtrlr = TextEditingController();
  var addressCtrlr = TextEditingController();
  var cityCtrlr = TextEditingController();
  var stateCtrlr = TextEditingController();
  var countryCtrlr = TextEditingController();
  var zipCtrlr = TextEditingController();
  var typeCtrlr = TextEditingController();
  var statusCtrlr = TextEditingController();
  var addedAtCtrlr = TextEditingController();
  BusinessListModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;
  @override
  void onInit() async {
    getBusinessTypeList();
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getBusinessList(type, true);
      });
    });
    super.onInit();
  }


  Future<void> getBusinessTypeList() async {
    final list = await businessListPresenter.getBusinessTypeList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        businessCategoryList.add(_equipmentCategoryList);
      }
    }
  }


  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<BusinessTypeModel>:
        {
          int equipmentIndex =
          businessCategoryList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = businessCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      // case RxList<FrequencyModel>:
      //   {
      //     int frequencyIndex =
      //     frequencyList.indexWhere((x) => x?.name == value);
      //     selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
      //   }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> getBusinessList(
      int type , bool isLoading)
  async {
    moduleList?.value = <BusinessListModel>[];
    final _moduleList =
        await businessListPresenter.getBusinessList(
            businessType: type, isLoading: isLoading);

    if (_moduleList != null) {
      moduleList!.value = _moduleList.cast<BusinessListModel?>();
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


  Future<bool> createBusinessListNumber() async {
    if (businesslistNumberCtrlr.text.trim() == '' ||
        emailCtrlr.text.trim() == ''  ||
    contactpersonCtrlr.text.trim() == '' || contactnumberCtrlr.text.trim() == '' ||
    locationCtrlr.text.trim() == '' || addressCtrlr.text.trim() == '' ||
    stateCtrlr.text.trim() == '' || countryCtrlr.text.trim() == '' ||
    cityCtrlr.text.trim() == '' || zipCtrlr.text.trim() == '' ||
    addressCtrlr.text.trim() == ''
    ) {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _businessListNumber = businesslistNumberCtrlr.text.trim();
      String _emailListNumber = emailCtrlr.text.trim();
      String _contactperson = contactpersonCtrlr.text.trim();
      String _contactNumber = contactnumberCtrlr.text.trim();
      String _location = locationCtrlr.text.trim();
      String _address = addressCtrlr.text.trim();
      String _state = stateCtrlr.text.trim();
      String _country = countryCtrlr.text.trim();
      String _city = cityCtrlr.text.trim();
      // String _status = statusCtrlr.text.trim();
      String _zip = zipCtrlr.text.trim();
      // String _type = typeCtrlr.text.trim();
      String _Addedat = addedAtCtrlr.text.trim();
      DateTime dateTime = DateTime.parse(_Addedat);
      String formattedDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
      CreateBusinessListModel createBusinessList = CreateBusinessListModel(
          name : _businessListNumber,
          email: _emailListNumber,
          contactPerson: _contactperson,
          contactnumber: _contactNumber,
          location: _location,
          address: _address,
          // addAt: formattedDateTime,
          state: _state,
          country: _country,
          city: _city,
          zip: _zip,
          type: selectedBusinessTypeId,
          status : 1,
      );

      var businessListJsonString =
      [
      createBusinessList.toJson() //createCheckListToJson([createChecklist]);

      ];

      print({"checklistJsonString", businessListJsonString});
      await businessListPresenter.createBusinesslistNumber(
        businesslistJsonString: businessListJsonString,
        isLoading: true,
      );
      return true;
    }
    getBusinessList(type, true);
    return true;
  }

  Future<void> issuccessCreatebusinesslist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {_cleardata()};
  }

  _cleardata() {
    businesslistNumberCtrlr.text = '';
    emailCtrlr.text = '';
    contactpersonCtrlr.text = '';
    contactnumberCtrlr.text = '';
    websiteCtrlr.text = '';
    locationCtrlr.text = '';
    addressCtrlr.text = '';
    countryCtrlr.text = '';
    stateCtrlr.text = '';
    cityCtrlr.text = '';
    zipCtrlr.text = '';
    selectedBusinessType.value = '';
    addedAtCtrlr.text = '';
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getBusinessList(type, true);
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
                    getBusinessList(type, true);
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
      await businessListPresenter.deleteModulelist(
        module_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateBusinesslistNumber(moduleId) async {
    String _modulelistNumber = businesslistNumberCtrlr.text.trim();
    String _featurelistNumber = emailCtrlr.text.trim();

    BusinessListModel createModulelist = BusinessListModel(
        id:moduleId,
        name: _modulelistNumber,
        email: _featurelistNumber,
        contactPerson : null,
    )  ;
    var modulelistJsonString =
        createModulelist.toJson(); //createCheckListToJson([createChecklist]);

    print({"modulelistJsonString", modulelistJsonString});
    await businessListPresenter.updateModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: true,
    );
    return true;
  }
}

