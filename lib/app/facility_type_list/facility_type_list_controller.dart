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
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/state.dart';
import '../../domain/models/state_model.dart';

class FacilityTypeListController extends GetxController {
  FacilityTypeListController(
    this.facilityTypeListPresenter,
  );
  FacilityTypeListPresenter facilityTypeListPresenter;
  final HomeController homecontroller = Get.find();

  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isChecked = true.obs;
  Rx<String> selectedCountry = ''.obs;
  Rx<bool> isSelectedCountry = true.obs;
  int countryId = 0;
  RxList<CountryModel?> countryList = <CountryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  Rx<String> selectedState = ''.obs;
  Rx<bool> isSelectedState = true.obs;
  int stateId = 0;
  RxList<CountryState?> stateList = <CountryState>[].obs;

  Rx<String> selectedCity = ''.obs;
  Rx<bool> isSelectedCity = true.obs;
  int cityId = 0;
  RxList<CityModel?> cityList = <CityModel>[].obs;

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
  var addressCtrlr = TextEditingController();
  var zipcodeCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getCountryList();
        getFacilityTypeList();
        getBusinessList(1);
        getBusinessList(2);
        getBusinessList(3);
        getSpvList();
      });
    });

    super.onInit();
  }

  Future<void> getCountryList() async {
    final list = await facilityTypeListPresenter.getCountryList(
      isLoading: true,
    );

    if (list != null) {
      for (var _countryList in list) {
        countryList.add(_countryList);
      }
    }
  }

  Future<void> getFacilityTypeList() async {
    facilityTypeList.value = <FacilityTypeListModel>[];
    final _facilityTypePermitList =
        await facilityTypeListPresenter.getFacilityTypeList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobSOPId,
      // job_type_id: 36,
    );
    if (_facilityTypePermitList != null) {
      for (var facilityType_list in _facilityTypePermitList) {
        facilityTypeList.add(facilityType_list);
      }
      // selectedSopPermit.value = _facilityTypeList[0].name ?? '';
    }

    // supplierNameList = _supplierNameList;
    facilityTypeListPaginationController = PaginationController(
      rowCount: facilityTypeList.length,
      rowsPerPage: 10,
    );
    update(['facility_type_list']);
  }

  dynamic onValueChangedCountry(RxList<CountryModel?> value, dynamic list) {
    print("onValueChange function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    int indexId = countryList.indexWhere((x) => x?.name == newValue);
    if (indexId > 0) {
      countryId = countryList[indexId]?.id ?? 0;
    }
    print("index received is : $indexId & country id  : $countryId");
    // print(selectedfacility);
    // selectedFacilityId = facilityIds;
    getStateList();
  }

  Future<void> getStateList() async {
    final list = await facilityTypeListPresenter.getStateList(
      country_code: countryId,
    );

    if (list != null) {
      for (var _stateList in list) {
        stateList.add(_stateList);
      }
    }
  }

  Future<void> getBusinessList(ListType) async {
    final list = await facilityTypeListPresenter.getBusinessList(
      ListType: ListType,
      isLoading: true,
    );
    if (ListType == 1) {
      if (list != null) {
        for (var _ownerList in list) {
          ownerList.add(_ownerList);
        }
      }
    } else if (ListType == 2) {
      if (list != null) {
        for (var _customerList in list) {
          customerList.add(_customerList);
        }
      }
    } else if (ListType == 3) {
      if (list != null) {
        for (var _operatorList in list) {
          operatorList.add(_operatorList);
        }
      }
    }
  }

  Future<void> getSpvList() async {
    final list = await facilityTypeListPresenter.getSpvList(
      isLoading: true,
    );
    if (list != null) {
      for (var _spvList in list) {
        SpvList.add(_spvList);
      }
    }
  }

  dynamic onValueChangedState(RxList<CountryState?> value, dynamic list) {
    print("onValueChange function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    int indexId = stateList.indexWhere((x) => x?.name == newValue);
    if (indexId > 0) {
      stateId = stateList[indexId]?.id ?? 0;
    }
    print("index received is : $indexId & country id  : $stateId");
    // print(selectedfacility);
    // selectedFacilityId = facilityIds;
    getCityList();
  }

  Future<void> getCityList() async {
    final list = await facilityTypeListPresenter.getCityList(
      isLoading: true,
      country_code: stateId,
    );

    if (list != null) {
      for (var _stateList in list) {
        cityList.add(_stateList);
      }
    }
  }

  dynamic onValueChangedCity(RxList<CityModel?> value, dynamic list) {
    print("onValueChange function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    int indexId = cityList.indexWhere((x) => x?.name == newValue);
    if (indexId > 0) {
      cityId = cityList[indexId]?.id ?? 0;
    }
    print("index received is : $indexId & city id  : $cityId");
    // print(selectedfacility);
    // selectedFacilityId = facilityIds;
    // getBlockTypeList();
  }

  dynamic onValueChangedOwner(RxList<BusinessListModel?> value, dynamic list) {
    print("onValueChangeOwner function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    int indexId = ownerList.indexWhere((x) => x?.name == newValue);
    if (indexId > 0) {
      ownerId = ownerList[indexId]?.id ?? 0;
    }
    print("index received is : $indexId & owner id  : $ownerId");
  }

  dynamic onValueChangedCustomer(
      RxList<BusinessListModel?> value, dynamic list) {
    print("onValueChangeCustomer function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    int indexId = customerList.indexWhere((x) => x?.name == newValue);
    if (indexId > 0) {
      customerId = customerList[indexId]?.id ?? 0;
    }
    print("index received is : $indexId & customer id  : $customerId");
  }

  dynamic onValueChangedOperator(
      RxList<BusinessListModel?> value, dynamic list) {
    print("onValueChangeOperator function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    int indexId = operatorList.indexWhere((x) => x?.name == newValue);
    if (indexId > 0) {
      operatorId = operatorList[indexId]?.id ?? 0;
    }
    print("index received is : $indexId & operator id  : $operatorId");
  }

  dynamic onValueChangedSpv(RxList<SPVListModel?> value, dynamic list) {
    print("onValueChangeSpv function. list : $list and value is :");
    String newValue = list.toString();
    print(" Selected Facility : ");

    int indexId = SpvList.indexWhere((x) => x?.name == newValue);
    if (indexId > 0) {
      SpvId = SpvList[indexId]?.id ?? 0;
    }
    print("index received is : $indexId & SPV id  : $SpvId");
  }

  Future<bool> createFacilityType() async {
    print(
        "title : ${titleCtrlr.text.trim()} , address: ${addressCtrlr.text.trim()} , zipcode : ${zipcodeCtrlr.text.trim()} , description : ${descriptionCtrlr.text.trim()}, countryid: $countryId , stateId: $stateId, cityId : $cityId, ownerId: $ownerId, customerId : $customerId, operatorId: $operatorId, spvId : $SpvId");
    if (titleCtrlr.text.trim() == '' ||
        addressCtrlr.text.trim() == '' ||
        zipcodeCtrlr.text.trim() == '' ||
        descriptionCtrlr.text.trim() == '' ||
        countryId == 0 ||
        stateId == 0 ||
        cityId == 0 ||
        ownerId == 0 ||
        customerId == 0 ||
        operatorId == 0 ||
        SpvId == 0) {
      // Fluttertoast.showToast(
      //     msg: "Please enter required field", fontSize: 16.0);
      print("Fields are blank, please enter dat ato create");
    } else {
      String _title = titleCtrlr.text.trim();
      String _address = addressCtrlr.text.trim();
      String pin = zipcodeCtrlr.text.trim();
      int _zipcode = int.parse(pin);
      String _description = descriptionCtrlr.text.trim();
      CreateFacilityType createCheckpoint = CreateFacilityType(
        title: _title,
        ownerId: ownerId,
        customerId: customerId,
        operatorId: operatorId,
        spvId: SpvId,
        address: _address,
        city: cityId,
        state: stateId,
        country: countryId,
        zipcode: _zipcode,
        description: _description,
        photoId: 0,
        latitude: 0.0,
        longitude: 0.0,
        timezone: "default_hardcoded",
      );
      var checkpointJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", checkpointJsonString});
      await facilityTypeListPresenter.createFacilityType(
        facilitylistJsonString: checkpointJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {_cleardata()};
  }

  _cleardata() {
    titleCtrlr.text = '';
    addressCtrlr.text = '';
    zipcodeCtrlr.text = '';
    descriptionCtrlr.text = '';
    countryId = 0;
    stateId = 0;
    cityId = 0;
    ownerId = 0;
    customerId = 0;
    operatorId = 0;
    SpvId = 0;
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
}
