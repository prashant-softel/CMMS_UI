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
import '../../domain/models/city_model.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/create_business_list_model.dart';
import '../../domain/models/create_modulelist_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/models/state.dart';
import '../../domain/models/state_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../domain/models/update_business_list_model.dart';
import 'business_list_presenter.dart';


class BusinessListController extends GetxController {
  BusinessListController(
    this.businessListPresenter,
  );
  BusinessListPresenter businessListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<CountryModel?> countryList =
      <CountryModel>[].obs;
  RxList<CountryState?> stateList =
      <CountryState>[].obs;
  RxList<CityModel?> cityList =
      <CityModel>[].obs;
  RxList<BusinessTypeModel?>  businessCategoryList =
      <BusinessTypeModel>[].obs;

  Rx<String> selectedBusinessType = ''.obs;
  Rx<String> selectedCountry = ''.obs;
  Rx<String> selectedState = ''.obs;
  Rx<String> selectedCity = ''.obs;
  Rx<bool> isSelectedBusinessType = true.obs;
  Rx<bool> isSelectedCountryType = true.obs;
  Rx<bool> isSelectedStateType = true.obs;
  Rx<bool> isSelectedCityType = true.obs;
  int selectedBusinessTypeId = 1;
  int selectedCountryId = 0;
  int selectedStateId = 0;
  int selectedCityId = 0;
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
    getCountryList();

    // getCityList();
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


  Future<void> getCountryList() async {
    final list = await businessListPresenter.getCountryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        countryList.add(_equipmentCategoryList);
      }
    }

    // selectedCountryId = Get.arguments;
    print(selectedCountryId);
    if (selectedCountryId > 0) {
      isSelectedCountryType.value = true;
      // Future.delayed(Duration(seconds: 1), () async {
      await getStateList(selectedCountryId);
      // getAssignedToList(facilityId);
      // });
    }
    // getStateList(selectedCountryId);
  }

  Future<void> getStateList(int selectedCountryId) async {
    stateList.clear();
    stateList.value = <CountryState>[];
    final list = await businessListPresenter.getStateList(selectedCountryId : selectedCountryId);

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        stateList.add(_equipmentCategoryList);
      }
    }
  }

  Future<void> getCityList(int selectedStateId) async {
    cityList.clear();
    cityList.value = <CityModel>[];
    final list = await businessListPresenter.getCityList(selectedStateId : selectedStateId);

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        cityList.add(_equipmentCategoryList);
      }
    }
  }

    // Future<void> getCityList() async {
    //   final list = await businessListPresenter.getCityList();
    //
    //   if (list != null) {
    //     for (var _equipmentCategoryList in list) {
    //       cityList.add(_equipmentCategoryList);
    //     }
    //   }
    // }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<BusinessTypeModel>:
        {
          int equipmentIndex =
          businessCategoryList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = businessCategoryList[equipmentIndex]?.id ?? 0;
          selectedBusinessType.value = value;
        }

        break;
        case RxList<CountryModel>:
          {
            int frequencyIndex =
            countryList.indexWhere((x) => x?.name == value);
            selectedCountryId = countryList[frequencyIndex]?.id ?? 0;
            if (selectedCountryId > 0) {
              isSelectedCountryType.value = true;
            }
            selectedCountry.value = value;
            getStateList(selectedCountryId);
            if(selectedStateId!=0 || selectedCityId!=0) {
              selectedStateId=0;
              selectedCityId=0;
              selectedState = ''.obs;
              selectedCity = ''.obs;
              getStateList(selectedCountryId);
              getCityList(selectedStateId);
            }
          }
        break;
      case RxList<CountryState>:
        {
          int frequencyIndex =
          stateList.indexWhere((x) => x?.name == value);
          selectedStateId = stateList[frequencyIndex]?.id ?? 0;
          if (selectedStateId > 0) {
            isSelectedStateType.value = true;
          }
          selectedState.value = value;
          getCityList(selectedStateId);
          if(selectedCityId!=0){
            // selectedStateId=0;
            selectedCityId=0;
            // selectedState = ''.obs;
            selectedCity = ''.obs;
            // getStateList(selectedCountryId);
            getCityList(selectedStateId);
          }
        }
        break;
      case RxList<CityModel>:
        {
          int frequencyIndex =
          cityList.indexWhere((x) => x?.name == value);
          selectedCityId = cityList[frequencyIndex]?.id ?? 0;
          selectedCity.value = value;

        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }


  dynamic onFetchNameBusinessTypeFromId(dynamic value) {
          int equipmentIndex =
          businessCategoryList.indexWhere((x) => x?.id == value);
          selectedBusinessType.value =
              businessCategoryList[equipmentIndex]?.name ?? '';
          // selectedBusinessType.value = value;
    return selectedBusinessType.value;
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
    if (
        websiteCtrlr.text.trim()== '' ||
        emailCtrlr.text.trim() == ''  ||
    contactpersonCtrlr.text.trim() == '' || contactnumberCtrlr.text.trim() == '' ||
    locationCtrlr.text.trim() == '' || addressCtrlr.text.trim() == '' ||
     zipCtrlr.text.trim() == '' ||
    addressCtrlr.text.trim() == '' || selectedBusinessType == '' || selectedCity == '' ||
        selectedCountry == '' || selectedState == ''
    ) {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {

      String _businessListNumber = businesslistNumberCtrlr.text.trim();
      String _website = websiteCtrlr.text.trim();
      String _emailListNumber = emailCtrlr.text.trim();
      String _contactperson = contactpersonCtrlr.text.trim();
      String _contactNumber = contactnumberCtrlr.text.trim();
      String _location = locationCtrlr.text.trim();
      String _address = addressCtrlr.text.trim();
      // String _status = statusCtrlr.text.trim();
      String _zip = zipCtrlr.text.trim();
      // String formattedDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);

      CreateBusinessListModel createBusinessList = CreateBusinessListModel(
          name : _businessListNumber,
          email: _emailListNumber,
          contactPerson: _contactperson,
          contactnumber: _contactNumber,
          website: _website,
          location: _location,
          address: _address,
          stateId: selectedStateId,
          countryId: selectedCountryId,
          cityId: selectedCityId,
          zip: _zip,
          type: selectedBusinessTypeId,
          status : 1,
      );

      var businessListJsonString =
      [
        createBusinessList.toJson()//createCheckListToJson([createChecklist]);
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
    zipCtrlr.text = '';
    selectedBusinessType.value = '';
    selectedCountry.value = '';
    selectedCity.value = '';
    selectedState.value = '';
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getBusinessList(type, true);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({
    String? business_id ,
   String? business
  }) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),

          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Business ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: business,
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
                  deleteBusiness(business_id).then((value) {
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


  Future<void> deleteBusiness(String? business_id) async {
    {
      await businessListPresenter.deleteBusiness(
        business_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateBusinesslistNumber(int? businessId ,int? status , String? addedAt) async {
    print("BusinessId- ,$businessId");
    print("Status - ,$status");
    print("Addetd - ,$addedAt");
    // String _businessType = selectedBusinessType.text.trim();
    String _businessName = businesslistNumberCtrlr.text.trim();
    String _email = emailCtrlr.text.trim();
    String _contactPerson = contactpersonCtrlr.text.trim();
    String _contactNumber = contactnumberCtrlr.text.trim();
    String _website = websiteCtrlr.text.trim();
    String _location = locationCtrlr.text.trim();
    String _address = addressCtrlr.text.trim();
    String _zip = zipCtrlr.text.trim();

    UpdateBusinessListModel updateBusinessList = UpdateBusinessListModel(
        id:businessId,
        name: _businessName,
        email: _email,
        contactPerson : _contactPerson,
        contactnumber: _contactNumber,
        website: _website,
        location: _location,
        address: _address,
        zip: _zip,
        type: selectedBusinessTypeId,
        countryId: selectedCountryId,
        stateId : selectedStateId,
        cityId : selectedCityId,
        status : status,
    );
    var modulelistJsonString =
      updateBusinessList.toJson();


    print({"modulelistJsonString", modulelistJsonString});
    await businessListPresenter.updateBusinesslist(
      modulelistJsonString: modulelistJsonString,
      isLoading: true,
    );
    return true;
  }
}

