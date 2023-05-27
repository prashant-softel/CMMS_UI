import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/create_warranty_claim_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_model2.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WarrantyClaimController extends GetxController {
  WarrantyClaimController(this.warrantyClaimPresenter);
  WarrantyClaimPresenter warrantyClaimPresenter;

  final HomeController homeController = Get.find();

  ///Failure Date Time For Web
  var failureDateTimeCtrlrWeb = TextEditingController();
  var failureDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  ///Warranty Start date Time for web
  var warrantyStartDateTimeCtrlrWeb = TextEditingController();
  var warrantyStartDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedWarrantyStartDateTime = DateTime.now().obs;

  ///Warranty End date time for web
  var warrantyEndDateTimeCtrlrWeb = TextEditingController();
  var warrantyEndDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedWarrantyEndDateTime = DateTime.now().obs;

  Set<String> supplierNameSet = {};

//Warranty Claim
  var warrantyClaimList = <WarrantyClaimModel>[];
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;

  RxList<EquipmentModel?> equipmentModelList = <EquipmentModel>[].obs;
  RxList<int> selectedEquipmentList = <int>[].obs;
  Rx<bool> isInventorySelected = true.obs;
  RxList<int> selectedEquipmentIdList = <int>[].obs;
  Rx<String> selectedInventory = ''.obs;

  ///Equipment name List
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedEquipmentName = ''.obs;
  Rx<bool> isEquipmentNameSelected = true.obs;
  int selectedEquipmentnameId = 0;
  // String? selectedEquipmentName = '';

  //Affected Part Equipemnt Name lIst
  RxList<InventoryModel2?> affectedPartEqipmentNameList =
      <InventoryModel2>[].obs;
  RxList<String?> selectedAffectedpartEquipmentNameList = <String>[].obs;
  RxList<int?> selectedAffectedPartEquipmentIdList = <int>[].obs;
  Rx<String> selectedAffectedPart = ''.obs;
  Rx<bool> isAffectedPartSelected = true.obs;
  int selectedAffectedPartId = 0;
  String? selectedAffectedPartName = '';

  RxList<BusinessListModel?> supplierNameList = <BusinessListModel>[].obs;
  Rx<bool> isSupplierNameSelected = true.obs;
  Rx<String> selectedSupplier = ''.obs;
  RxList<String?> selectedSupplierNameList = <String>[].obs;
  RxList<int?> selectedSupplierNameIdList = <int>[].obs;
  Rx<bool> isBlockSelected = true.obs;

  ///Currency List
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<String> selectedUnitCurrency = ''.obs;
  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;
  int selectedCurrencyId = 0;

  /// Employee List / Approver
  RxList<EmployeeListModel> employeeList = <EmployeeListModel>[].obs;
  Rx<bool> isemployeeListSelected = true.obs;
  Rx<String> selectedEmployeeList = ''.obs;
  RxList<String?> selectedEmployeeDataList = <String>[].obs;
  RxList<int?> selectedEmployeeIdList = <int>[].obs;
  int selectedApproverId = 0;

  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];
  var equipmentList = <EquipmentModel>[];

  ///Text Editing Controller
  final warrantyClaimTitleTextController = TextEditingController();
  final warrantyClaimBriefDescTextController = TextEditingController();
  final immediateCorrectiveActionTextController = TextEditingController();
  final requestManufactureTextController = TextEditingController();
  final costOfReplacementTextController = TextEditingController();
  final orderReferenceNoTextController = TextEditingController();
  final affectedSerialNoTextController = TextEditingController();

  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();

  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();
  //int facilityId = 45;
  String categoryIds = '';
  Rx<bool> isFormInvalid = false.obs;

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  PaginationController paginationWarrantyController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  PaginationController paginationBusinessListController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId => _facilityId.value;

  /// SIDE MENU WEB
  Rx<int> selectedIndex = 0.obs;
  // RxList<MenuItem> menuItems = [
  //   MenuItem(
  //     title: "DashBoard",
  //     icon: "assets/files/home.png",
  //   ),
  //   MenuItem(
  //     title: "Inventory",
  //     icon: "assets/files/warranty.png",
  //   ),
  //   MenuItem(
  //     title: "Breakdown Maintenance",
  //     icon: "assets/files/preventive.png",
  //   ),
  //   MenuItem(
  //     title: "Warranty claim",
  //     icon: "assets/files/warranty.png",
  //   ),
  //   MenuItem(
  //     title: "Preventive Maintenance",
  //     icon: "assets/files/preventive.png",
  //   ),
  //   MenuItem(
  //     title: "Corrective Maintenance",
  //     icon: "assets/files/maint.png",
  //   ),
  //   MenuItem(
  //     title: "Module Cleaning",
  //     icon: "assets/files/maintenance.png",
  //   ),
  //   MenuItem(
  //     title: "Vegetation Control",
  //     icon: "assets/files/preventive.png",
  //   ),
  //   MenuItem(
  //     title: "Incident Report",
  //     icon: "assets/files/reportins.png",
  //   ),
  //   MenuItem(
  //     title: "Calibration",
  //     icon: "assets/files/preventive.png",
  //   ),
  //   MenuItem(
  //     title: "Misc",
  //     icon: "assets/files/misc.png",
  //   ),
  //   MenuItem(
  //     title: "Settings",
  //     icon: "assets/files/setting.png",
  //   ),
  //   MenuItem(
  //     title: "Log Out",
  //     icon: "assets/files/dashboard.png",
  //   ),
  // ].obs;

  ///
// int? wc_id = 0;
  @override
  void onInit() async {
    // wc_id = Get.arguments;
    // print('WC_Id:$wc_id');

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getuserAccessData();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getAffectedPartList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getWarrantyClaimList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryCategoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getBusinessList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getUnitCurrencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getEmployeeList();
    });
    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await warrantyClaimPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList = await warrantyClaimPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

  void affectedPartSelected(_selectedaffectedPartIds) {
    selectedAffectedPartEquipmentIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedaffectedPartIds) {
      selectedAffectedPartEquipmentIdList.add(_selectedCategoryId);
    }

    // for (var _selectedEquipmentNameId in _selectedEquipmentIds) {
    //   selectedEquipmentIdList.add(_selectedEquipmentNameId);
    //   print('Affected part id:$selectedEquipmentIdList');
    // }
    // int affectedpartIndex = affectedPartEqipmentNameList.indexWhere((x) => x?.name == _selectedEquipmentName);
    // selectedAffetctedpart = affectedPartEqipmentNameList[affectedpartIndex]?.name ?? '';
    // print('Affected part :${selectedAffetctedpart}');
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await warrantyClaimPresenter.getInventoryCategoryList(
      isLoading: true,
    );

    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await warrantyClaimPresenter.getInventoryList(
      isLoading: true,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
    //  print('equipment Name List:$inventoryNameList');
    for (var inventory_list in _inventoryList) {
      eqipmentNameList.add(inventory_list);
    }
    inventoryList = _inventoryList;
    paginationController = PaginationController(
      rowCount: eqipmentNameList.length,
      rowsPerPage: 10,
    );
    update(['inventory_list']);
  }

  void getAffectedPartList() async {
    affectedPartEqipmentNameList.value = <InventoryModel2>[];
    final _affectedPartList = await warrantyClaimPresenter.getAffectedPartList(
      isLoading: true,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
    //  print('equipment Name List:$inventoryNameList');
    for (var affected_part_list in _affectedPartList) {
      affectedPartEqipmentNameList.add(affected_part_list);
    }
    // inventoryList = _affectedPartList;
    // paginationController = PaginationController(
    //   rowCount: eqipmentNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['inventory_list']);
  }

  void getBusinessList() async {
    supplierNameList.value = <BusinessListModel>[];
    final _supplierNameList = await warrantyClaimPresenter.getBusinessList(
      isLoading: true,
      //  categoryIds: categoryIds,
      businessType: 5,
    );
    //  print('Supplier Name List:$supplierNameList');
    for (var supplier_list in _supplierNameList) {
      supplierNameList.add(supplier_list);
    }
    // supplierNameList = _supplierNameList;
    // paginationBusinessListController = PaginationController(
    //   rowCount: supplierNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['business_list']);
  }

  void getUnitCurrencyList() async {
    unitCurrencyList.value = <CurrencyListModel>[];
    final _unitCUrrencyList = await warrantyClaimPresenter.getUnitCurrencyList(
      isLoading: true,
      // categoryIds: categoryIds,
      facilityId: facilityId,
    );
    print('Unit Currency List:$unitCurrencyList');
    for (var unit_currency_list in _unitCUrrencyList) {
      unitCurrencyList.add(unit_currency_list);
    }
    // supplierNameList = _supplierNameList;
    // paginationBusinessListController = PaginationController(
    //   rowCount: supplierNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['unit_currency_list']);
  }

  void getEmployeeList() async {
    employeeList.value = <EmployeeListModel>[];
    final _employeeList = await warrantyClaimPresenter.getEmployeeList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: 45,
    );
    print('Employee List:$employeeList');
    for (var employee_list in _employeeList) {
      employeeList.add(employee_list);
    }
    // supplierNameList = _supplierNameList;
    // paginationBusinessListController = PaginationController(
    //   rowCount: supplierNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['employee_list']);
  }

  // void getUnitCurrencyList() async {
  //   unitCurrencyList.value = <CurrencyListModel>[];
  //   final _unitCUrrencyList = await warrantyClaimPresenter.getUnitCurrencyList(
  //     isLoading: true,
  //     // categoryIds: categoryIds,
  //     facilityId: facilityId,
  //   );
  //   print('Unit Currency List:$unitCurrencyList');
  //   for (var unit_currency_list in _unitCUrrencyList) {
  //     unitCurrencyList.add(unit_currency_list);
  //   }
  //   // supplierNameList = _supplierNameList;
  //   // paginationBusinessListController = PaginationController(
  //   //   rowCount: supplierNameList.length,
  //   //   rowsPerPage: 10,
  //   // );
  //   update(['unit_currency_list']);
  // }

  // void getEmployeeList() async {
  //   employeeList.value = <EmployeeListModel>[];
  //   final _employeeList = await warrantyClaimPresenter.getEmployeeList(
  //     isLoading: true,
  //     // categoryIds: categoryIds,
  //     facility_id: 45,
  //   );
  //   print('Employee List:$employeeList');
  //   for (var employee_list in _employeeList) {
  //     employeeList.add(employee_list);
  //   }
  //   // supplierNameList = _supplierNameList;
  //   // paginationBusinessListController = PaginationController(
  //   //   rowCount: supplierNameList.length,
  //   //   rowsPerPage: 10,
  //   // );
  //   update(['employee_list']);
  // }

  void getWarrantyClaimList() async {
    // supplierNameList.value = <WarrantyClaimModel>[];

    final list = await warrantyClaimPresenter.getWarrantyClaimList(
        isLoading: true, categoryIds: categoryIds, facilityId: facilityId);
    print('Supplier Name List:$supplierNameList');
    Set<String> supplierNameSet = {};
    for (var _supplierNameList in list) {
      if (_supplierNameList.supplier_name != null) {
        supplierNameSet.add(_supplierNameList.supplier_name ?? "");
      }
    }
    warrantyClaimList = list;
    paginationWarrantyController = PaginationController(
      rowCount: warrantyClaimList.length,
      rowsPerPage: 10,
    );
    update(['warranty_claim_list']);
  }

  void getBlockList(String facilityId) async {
    final list = await warrantyClaimPresenter.getBlockList(
        isLoading: false, facilityId: facilityId);
    blockList = list;
    update(['block_list']);
  }

  void getEquipmentList({
    required String facilityId,
  }) async {
    final list = await warrantyClaimPresenter.getEquipmentList(
      isLoading: false,
      facilityId: facilityId,
    );
    equipmentList = list;
    update(['equipment_list']);
  }

  void onSelectEquipment(EquipmentModel equipment) {
    selectedEquipment = equipment;
    parentEquipmentTextController.text = selectedEquipment.name ?? '';

    update(['equipment_list']);
  }

  void onSelectBlock(BlockModel block) {
    selectedBlock = block;
    blockTextController.text = selectedBlock.name ?? '';

    update(['block_field']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      case RxList<InventoryModel>:
        {
          // for (var workAreaName in selectedWorkAreaNameList) {
          int equipmentNameIndex =
              eqipmentNameList.indexWhere((x) => x?.name == value);
          selectedEquipmentnameId =
              eqipmentNameList[equipmentNameIndex]?.id ?? 0;

          if (selectedEquipmentnameId > 0) {
            isEquipmentNameSelected.value = true;
          }
          selectedEquipmentName.value = value;

          print('Equipment name Id: $selectedEquipmentnameId');

          // }
        }
        break;
      case RxList<InventoryModel2>:
        {
          // for (var workAreaName in selectedWorkAreaNameList) {
          int affectedPartIndex =
              affectedPartEqipmentNameList.indexWhere((x) => x?.name == value);
          selectedAffectedPartId =
              affectedPartEqipmentNameList[affectedPartIndex]?.id ?? 0;
          selectedAffectedPartName =
              affectedPartEqipmentNameList[affectedPartIndex]?.name ?? '';

          if (selectedAffectedPartId > 0) {
            isAffectedPartSelected.value = true;
          }
          selectedAffectedPart.value = value;
          print('Affected part Id: $selectedAffectedPartId');
          print('Affected part name : $selectedAffectedPartName');

          // }
        }
        break;
      case RxList<BusinessListModel>:
        {
          for (var supplierName in selectedSupplierNameList) {
            int supplierNameIndex =
                supplierNameList.indexWhere((x) => x?.name == supplierName);
            selectedSupplierNameIdList.add(supplierNameIndex);
          }
        }
        break;
      case RxList<CurrencyListModel>:
        {
          // for (var unitCurrency in selectedUnitCurrencyList) {
          int unitCurrencyIndex =
              unitCurrencyList.indexWhere((x) => x?.name == value);
          selectedCurrencyId = unitCurrencyList[unitCurrencyIndex]?.id ?? 0;

          if (selectedCurrencyId > 0) {
            isUnitCurrencySelected.value = true;
          }
          selectedUnitCurrency.value = value;
          print('Unit Currency Id :$selectedCurrencyId');

          // }
        }
        break;
      case RxList<EmployeeListModel>:
        {
          // for (var employeeDataList in selectedEmployeeDataList) {
          int employeeListIndex =
              employeeList.indexWhere((x) => x.name == value);
          selectedApproverId = employeeList[employeeListIndex].id ?? 0;

          if (selectedApproverId > 0) {
            isemployeeListSelected.value = true;
          }
          selectedEmployeeList.value = value;
          print('Approver Id: $selectedApproverId');

          // }
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void checkForm() {
    if (selectedEquipmentName.value == '') {
      isEquipmentNameSelected.value = false;
    }
    if (selectedAffectedPart.value == '') {
      isAffectedPartSelected.value = false;
    }
    if (selectedUnitCurrency.value == '') {
      isUnitCurrencySelected.value = false;
    }
    if (selectedEmployeeList.value == '') {
      isemployeeListSelected.value = false;
    }

    if (warrantyClaimTitleTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Title Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (warrantyClaimBriefDescTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Description Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (affectedSerialNoTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Affected Serial No Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (failureDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Failure Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (warrantyStartDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Warranty Start Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (warrantyEndDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Warranty End Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (orderReferenceNoTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Order Reference No Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (costOfReplacementTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Cost of Replacement Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (immediateCorrectiveActionTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Corrective Action Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (requestManufactureTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Request Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (isEquipmentNameSelected.value == false ||
        isAffectedPartSelected.value == false ||
        isUnitCurrencySelected.value == false ||
        isemployeeListSelected.value == false) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  ///Create Warranty Claim
  void createWarrantyClaim() async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }

      String _warrantyClaimTitle =
          htmlEscape.convert(warrantyClaimTitleTextController.text.trim());
      String _description =
          htmlEscape.convert(warrantyClaimBriefDescTextController.text.trim());
      String _immediateCorrectiveByBuyer = htmlEscape
          .convert(immediateCorrectiveActionTextController.text.trim());
      String _requestToBuyer =
          htmlEscape.convert(requestManufactureTextController.text.trim());
      // String _costOfReplacement =
      //     htmlEscape.convert(costOfReplacementTextController.text.trim());
      String _orderReferenceNo =
          htmlEscape.convert(orderReferenceNoTextController.text.trim());
      String _affectedSerialNo =
          htmlEscape.convert(affectedSerialNoTextController.text.trim());

      int costOfReplacement =
          int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');

      CreateWarrantyClaimModel createwarrantyClaimModel =
          CreateWarrantyClaimModel(
        facilityId: facilityId,
        equipmentId: selectedEquipmentnameId,
        goodsOrderId: 14205,
        affectedPart: selectedAffectedPartName,
        orderReference: _orderReferenceNo,
        affectedSrNo: _affectedSerialNo,
        costOfReplacement: costOfReplacement,
        currencyId: selectedCurrencyId,
        warrantyStartAt: warrantyStartDateTimeCtrlrWebBuffer,
        warrantyEndAt: warrantyEndDateTimeCtrlrWebBuffer,
        warrantyClaimTitle: _warrantyClaimTitle,
        warrantyDescription: _description,
        correctiveActionByBuyer: _immediateCorrectiveByBuyer,
        requestToSupplier: _requestToBuyer,
        approverId: selectedApproverId,
        failureTime: failureDateTimeCtrlrWebBuffer,
      );

      var warrantyClaimJsonString = [createwarrantyClaimModel.toJson()];
      Map<String, dynamic>? responseCreateWarrantyClaim =
          await warrantyClaimPresenter.createWarrantyClaim(
        createWarrantyClaim: warrantyClaimJsonString,
        isLoading: true,
      );

      if (responseCreateWarrantyClaim == null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create Warranty Claim data: $warrantyClaimJsonString');
    }
  }

  Future<void> viewWarrantyClaim({int? wc_id}) async {
    Get.toNamed(Routes.viewWarrantyClaim, arguments: wc_id);
    print('Argument$wc_id');
  }
}
