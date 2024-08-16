import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/facility_type_list/facility_type_list_presenter.dart';
import 'package:cmms/domain/models/city_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/SPV_list_model.dart';
import '../../domain/models/business_list_model.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/create_facility_type_model.dart';
import '../../domain/models/state.dart';

class FacilityTypeListController extends GetxController {
  FacilityTypeListController(
    this.facilityTypeListPresenter,
  );
  FacilityTypeListPresenter facilityTypeListPresenter;
  final HomeController homecontroller = Get.find();
  FacilityTypeListModel? selectedItem;

  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isContainerVisible = false.obs;
  RxBool isChecked = true.obs;
  RxList<CountryModel?> countryList = <CountryModel>[].obs;
  RxList<CountryState?> stateList = <CountryState>[].obs;
  RxList<CityModel?> cityList = <CityModel>[].obs;
  Rx<bool> isFormInvalid = false.obs;

  // Rx<String> selectedBusinessType = ''.obs;
  Rx<String> selectedCountry = ''.obs;
  Rx<String> selectedState = ''.obs;
  Rx<String> selectedCity = ''.obs;
  Rx<bool> isSelectedCountryType = true.obs;
  Rx<bool> isSelectedStateType = true.obs;
  Rx<bool> isSelectedCityType = true.obs;
  int selectedCountryId = 0;
  int selectedStateId = 0;
  int selectedCityId = 0;
  Rx<String> selectedOwner = ''.obs;
  Rx<bool> isSelectedOwner = true.obs;
  int ownerId = 0;
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;

  Rx<String> selectedCustomer = ''.obs;
  Rx<bool> isSelectedCustomer = true.obs;
  int customerId = 0;
  RxList<BusinessListModel?> customerList = <BusinessListModel>[].obs;

  Rx<String> selectedOperator = ''.obs;
  Rx<bool> isSelectedOperator = true.obs;
  int operatorId = 0;
  RxList<BusinessListModel?> operatorList = <BusinessListModel>[].obs;
  Rx<bool> isNameInvalid = false.obs;
  Rx<String> selectedSpv = ''.obs;
  Rx<bool> isSelectedSpv = true.obs;
  int SpvId = 0;
  RxList<SPVListModel?> SpvList = <SPVListModel>[].obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // PreventiveCheckListModel? preventiveCheckListModel;

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  FacilityModel? selectedFacilityId;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///SOP Permit List
  RxList<FacilityTypeListModel> facilityTypeList =
      <FacilityTypeListModel>[].obs;
  RxList<FacilityTypeListModel> BufferFacilityTypeList =
      <FacilityTypeListModel>[].obs;

  Rx<bool> isfacilityTypeListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;

  PaginationController facilityTypeListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();
  FocusNode nameFocus = FocusNode();
  ScrollController nameScroll = ScrollController();
  //description
  var descriptionCtrlr = TextEditingController();
  var latitudeCtrlr = TextEditingController();
  var longitudeCtrlr = TextEditingController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();
  FocusNode latiFocus = FocusNode();
  ScrollController latiScroll = ScrollController();
  FocusNode longiFocus = FocusNode();
  ScrollController longiScroll = ScrollController();
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> islatiInvalid = false.obs;
  Rx<bool> islongiInvalid = false.obs;

  ///address
  var addressCtrlr = TextEditingController();
  FocusNode addFocus = FocusNode();
  ScrollController addScroll = ScrollController();
  Rx<bool> isAddressInvalid = false.obs;

  ///Pin code
  var zipcodeCtrlr = TextEditingController();
  Rx<bool> isZipCodeInvalid = false.obs;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    // facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
    //   facilityId = event;
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () async {
        if (countryList.isEmpty) {
          await getCountryList();
        }

        // Check if the business lists are already fetched
        if (ownerList.isEmpty) {
          await getBusinessList(1, facilityId);
        }
        if (customerList.isEmpty) {
          await getBusinessList(2, facilityId);
        }
        if (operatorList.isEmpty) {
          await getBusinessList(3, facilityId);
        }
        if (SpvList.isEmpty) {
          await getSpvList();
        }
        // getCountryList();
        getFacilityTypeList();
        // getBusinessList(1);
        // getBusinessList(2);
        // getBusinessList(3);\
      });
    });
    // });

    nameFocus.addListener(() {
      if (!nameFocus.hasFocus) {
        nameScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });
    addFocus.addListener(() {
      if (!addFocus.hasFocus) {
        addScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  // Future<void> getCountryList() async {
  //   final list = await facilityTypeListPresenter.getCountryList(
  //     isLoading: true,
  //   );
  //
  //   if (list != null) {
  //     for (var _countryList in list) {
  //       countryList.add(_countryList);
  //     }
  //   }
  // }

  Future<void> getFacilityTypeList() async {
    facilityTypeList.value = <FacilityTypeListModel>[];
    BufferFacilityTypeList.value = <FacilityTypeListModel>[];

    final _facilityTypePermitList =
        await facilityTypeListPresenter.getFacilityTypeList(
      isLoading: true,
      // categoryIds: categoryIds,
      // job_type_id: selectedJobSOPId,
      // job_type_id: 36,
    );
    for (var facilityType_list in _facilityTypePermitList) {
      facilityTypeList.add(facilityType_list);
      BufferFacilityTypeList.add(facilityType_list);
    }
    // selectedSopPermit.value = _facilityTypeList[0].name ?? '';

    // supplierNameList = _supplierNameList;
    facilityTypeListPaginationController = PaginationController(
      rowCount: facilityTypeList.length,
      rowsPerPage: 10,
    );
    update(['facility_type_list']);
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      facilityTypeList.value = BufferFacilityTypeList.value;
      return;
    }
    List<FacilityTypeListModel> filteredList = BufferFacilityTypeList.where(
        (item) =>
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.spv
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.owner
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.operator
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.customer
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.city
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false)).toList();
    facilityTypeList.value = filteredList;
  }

  Future<void> getCountryList() async {
    countryList.clear();
    final list = await facilityTypeListPresenter.getCountryList();

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
    final list = await facilityTypeListPresenter.getStateList(
        selectedCountryId: selectedCountryId);

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        stateList.add(_equipmentCategoryList);
      }
    }
  }

  Future<void> getCityList(int selectedStateId) async {
    cityList.clear();
    cityList.value = <CityModel>[];
    final list = await facilityTypeListPresenter.getCityList(
        selectedStateId: selectedStateId);

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        cityList.add(_equipmentCategoryList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<CountryModel>):
        {
          int frequencyIndex = countryList.indexWhere((x) => x?.name == value);
          selectedCountryId = countryList[frequencyIndex]?.id ?? 0;
          if (selectedCountryId > 0) {
            isSelectedCountryType.value = true;
          }
          selectedCountry.value = value;
          getStateList(selectedCountryId);
          if (selectedStateId != 0 || selectedCityId != 0) {
            selectedStateId = 0;
            selectedCityId = 0;
            selectedState = ''.obs;
            selectedCity = ''.obs;
            getStateList(selectedCountryId);
            getCityList(selectedStateId);
          }
        }
        break;
      case const (RxList<CountryState>):
        {
          int frequencyIndex = stateList.indexWhere((x) => x?.name == value);
          selectedStateId = stateList[frequencyIndex]?.id ?? 0;
          if (selectedStateId > 0) {
            isSelectedStateType.value = true;
          }
          selectedState.value = value;
          getCityList(selectedStateId);
          if (selectedCityId != 0) {
            // selectedStateId=0;
            selectedCityId = 0;
            // selectedState = ''.obs;
            selectedCity = ''.obs;
            // getStateList(selectedCountryId);
            getCityList(selectedStateId);
          }
        }
        break;
      case const (RxList<CityModel>):
        {
          int frequencyIndex = cityList.indexWhere((x) => x?.name == value);
          selectedCityId = cityList[frequencyIndex]?.id ?? 0;
          if (selectedCityId > 0) {
            isSelectedCityType.value = true;
          }
          selectedCity.value = value;
          print('CityId:${selectedCityId}');
        }
        break;
      case const (RxList<BusinessListModel>):
        {
          int customerIndex = customerList.indexWhere((x) => x?.name == value);
          customerId = customerList[customerIndex]?.id ?? 0;
          if (customerId > 0) {
            isSelectedCityType.value = true;
          }
          selectedCustomer.value = value;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> getBusinessList(ListType, int facilityId) async {
    final list = await facilityTypeListPresenter.getBusinessList(
      facilityId: facilityId,
      ListType: ListType,
      isLoading: true,
    );
    if (ListType == 1) {
      ownerList.clear();
      if (list != null) {
        for (var _ownerList in list) {
          ownerList.add(_ownerList);
        }
      }
    } else if (ListType == 2) {
      customerList.clear();
      if (list != null) {
        for (var _customerList in list) {
          customerList.add(_customerList);
        }
      }
    } else if (ListType == 3) {
      operatorList.clear();
      if (list != null) {
        for (var _operatorList in list) {
          operatorList.add(_operatorList);
        }
      }
    }
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<void> getSpvList() async {
    SpvList.clear();
    final list = await facilityTypeListPresenter.getSpvList(
      isLoading: isLoading.value,
    );
    if (list != null) {
      isLoading.value = false;
      for (var _spvList in list) {
        SpvList.add(_spvList);
      }
    }
  }

  dynamic onValueChangedOwner(RxList<BusinessListModel?> value, dynamic list) {
    print("onValueChangeOwner function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");
//change for check
    if (value != "Please Select") {
      int indexId = ownerList.indexWhere((x) => x?.name == newValue);
      //  if (indexId > 0) {
      ownerId = ownerList[indexId]?.id ?? 0;
      //  }
      selectedOwner.value = list;
      isSelectedOwner.value = true;
      print("index received is : $indexId & owner id  : $ownerId");
    } else {
      ownerId = 0;
    }
  }

  dynamic onValueChangedCustomer(
      RxList<BusinessListModel?> value, dynamic list) {
    print("onValueChangeCustomer function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    if (value != "Please Select") {
      int indexId = customerList.indexWhere((x) => x?.name == newValue);
      // if (indexId > 0) {
      customerId = customerList[indexId]?.id ?? 0;
      // }
      selectedCustomer.value = list;
      isSelectedCustomer.value = true;
      print("index received is : $indexId & customer id  : $customerId");
    } else {
      customerId = 0;
    }
  }

  dynamic onValueChangedOperator(
      RxList<BusinessListModel?> value, dynamic list) {
    print("onValueChangeOperator function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    if (value != "Please Select") {
      int indexId = operatorList.indexWhere((x) => x?.name == newValue);
      // if (indexId > 0) {
      operatorId = operatorList[indexId]?.id ?? 0;
      // }
      selectedOperator.value = list;
      isSelectedOperator.value = true;
      print("index received is : $indexId & operator id  : $operatorId");
    } else {
      operatorId = 0;
    }
  }

  dynamic onValueChangedSpv(RxList<SPVListModel?> value, dynamic list) {
    print("onValueChangeSpv function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    if (value != "Please Select") {
      int indexId = SpvList.indexWhere((x) => x?.name == newValue);
      // if (indexId > 0) {
      SpvId = SpvList[indexId]?.id ?? 0;
      // }
      selectedSpv.value = list;
      isSelectedSpv.value = true;
      print("index received is : $indexId & SPV id  : $SpvId");
    } else {
      SpvId = 0;
    }
  }

  void checkForm() {
    if (selectedSpv.value == '') {
      isSelectedSpv.value = false;
    }

    if (selectedOperator.value == '') {
      isSelectedOperator.value = false;
    }

    if (selectedOwner.value == '') {
      isSelectedOwner.value = false;
    }

    if (selectedCustomer.value == '') {
      isSelectedCustomer.value = false;
    }
    if (selectedCountry.value == '') {
      isSelectedCountryType.value = false;
    }
    if (selectedState.value == '') {
      isSelectedStateType.value = false;
    }
    if (selectedCity.value == '') {
      isSelectedCityType.value = false;
    }

    if (isNameInvalid.value == true ||
        isDescriptionInvalid.value == true ||
        isAddressInvalid.value == true ||
        isSelectedSpv.value == false ||
        isSelectedOwner.value == false ||
        isSelectedCountryType.value == false ||
        isSelectedStateType.value == false ||
        isSelectedCityType.value == false ||
        isSelectedCustomer.value == false ||
        isZipCodeInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<bool> createFacilityType() async {
    if (titleCtrlr.text.trim() == '') {
      isNameInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (descriptionCtrlr.text.trim() == '') {
      isDescriptionInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (latitudeCtrlr.text.trim() == '') {
      islatiInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (longitudeCtrlr.text.trim() == '') {
      islongiInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (addressCtrlr.text.trim() == '') {
      isAddressInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (zipcodeCtrlr.text.trim() == '') {
      isZipCodeInvalid.value = true;
      isFormInvalid.value = true;
    }

    checkForm();
    if (isFormInvalid.value) {
      return false;
    }

    print(
        "title : ${titleCtrlr.text.trim()} , address: ${addressCtrlr.text.trim()} , zipcode : ${zipcodeCtrlr.text.trim()} , description : ${descriptionCtrlr.text.trim()},latitude:${latitudeCtrlr.text.trim()},longitude:${longitudeCtrlr.text.trim()} countryid: $selectedCountry , stateId: $selectedState, cityId : $selectedCity, ownerId: $selectedOwner, customerId : $isSelectedCustomer, operatorId: $selectedOperator, spvId : $selectedSpv");
    if (titleCtrlr.text.trim() == '' ||
        descriptionCtrlr.text.trim() == '' ||
        latitudeCtrlr.text.trim() == '' ||
        longitudeCtrlr.text.trim() == '' ||
        addressCtrlr.text.trim() == '' ||
        zipcodeCtrlr.text.trim() == '' ||
        selectedOwner == '' ||
        selectedCustomer == '' ||
        selectedOperator == '' ||
        selectedSpv == '' ||
        selectedCountry == '' ||
        selectedState == '' ||
        selectedCity == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
      print("Fields are blank, please enter dat ato create");
    } else {
      String _title = titleCtrlr.text.trim();
      String _address = addressCtrlr.text.trim();
      String? pin = zipcodeCtrlr.text.trim();
      pin = (pin != "" ? zipcodeCtrlr.text.trim() : "0");
      int _zipcode = int.parse(pin);
      String _description = descriptionCtrlr.text.trim();
      String _latitude = latitudeCtrlr.text.trim();
      String _longitude = longitudeCtrlr.text.trim();
      CreateFacilityType createCheckpoint = CreateFacilityType(
        id: 0,
        name: _title,
        ownerId: ownerId,
        customerId: operatorId,
        operatorId: customerId,
        spvId: SpvId,
        address: _address,
        cityId: selectedCityId,
        stateId: selectedStateId,
        countryId: selectedCountryId,
        zipcode: _zipcode,
        description: _description,
        photoId: 0,
        latitude: double.tryParse(_latitude) ?? 0.0,
        longitude: double.tryParse(_longitude) ?? 0.0,
        timezone: "default_hardcoded",
      );
      print("OUT ");
      var facilitylistJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await facilityTypeListPresenter.createFacilityType(
        facilitylistJsonString: facilitylistJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {cleardata()};
  }

  cleardata() {
    titleCtrlr.text = '';
    addressCtrlr.text = '';
    zipcodeCtrlr.text = '';
    descriptionCtrlr.text = '';
    latitudeCtrlr.text = '';
    longitudeCtrlr.text = '';
    descriptionCtrlr.text = '';
    // selectedStateId = 0;
    // selectedCountryId = 0;
    // selectedCityId = 0;
    // ownerId = 0;
    selectedItem = null;
    // customerId = 0;
    // operatorId = 0;
    // SpvId = 0;
    selectedState.value = '';
    selectedCity.value = '';
    selectedCountry.value = '';
    selectedCustomer.value = '';
    selectedOperator.value = '';
    selectedOwner.value = '';
    selectedSpv.value = '';

    Future.delayed(Duration(seconds: 1), () {
      getFacilityTypeList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

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
                text: 'Are you sure you want to delete the Facility ',
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
                  deleteFacility(business_id).then((value) {
                    Get.back();
                    getFacilityTypeList();
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

  Future<bool> updateFacilityList(checklistId) async {
    String _title = titleCtrlr.text.trim();
    String _address = addressCtrlr.text.trim();
    String? pin = zipcodeCtrlr.text.trim();
    pin = (pin != "" ? zipcodeCtrlr.text.trim() : "0");
    int _zipcode = int.parse(pin);
    String _description = descriptionCtrlr.text.trim();

    CreateFacilityType createCheckpoint = CreateFacilityType(
      name: _title,
      id: checklistId,
      ownerId: ownerId,
      customerId: operatorId,
      operatorId: customerId,
      spvId: SpvId,
      address: _address,
      cityId: selectedCityId,
      stateId: selectedStateId,
      countryId: selectedCountryId,
      zipcode: _zipcode,
      description: _description,
      photoId: 0,
      latitude: 0.0,
      longitude: 0.0,
      timezone: "default_hardcoded",
    );
    var businessTypeJsonString = createCheckpoint.toJson();

    print({"businessTypeJsonString", businessTypeJsonString});
    await facilityTypeListPresenter.updateFacilityList(
      modulelistJsonString: businessTypeJsonString,
      isLoading: true,
    );
    return true;
  }

  Future<void> deleteFacility(String? business_id) async {
    {
      await facilityTypeListPresenter.deleteFacility(
        business_id,
        isLoading: true,
      );
    }
  }
}
