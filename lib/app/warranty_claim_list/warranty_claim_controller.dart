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
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class WarrantyClaimController extends GetxController {
  WarrantyClaimController(this.warrantyClaimPresenter);
  WarrantyClaimPresenter warrantyClaimPresenter;

  final HomeController homeController = Get.find();

  ///
  var startDateTimeCtrlrWeb = TextEditingController();
  Rx<DateTime> selectedDateTimeWeb = DateTime.now().obs;

  ///
  var startDateTimeCtrlr2 = TextEditingController();
  var startDateTimeCtrlr2Web = TextEditingController();
  Rx<DateTime> selectedBreakdownTime2 = DateTime.now().obs;

  ///
  var startDateTimeCtrlr3 = TextEditingController();
  Rx<DateTime> selectedBreakdownTime3 = DateTime.now().obs;

  Set<String> supplierNameSet = {};

//Warranty Claim
  var warrantyClaimList = <WarrantyClaimModel>[];
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;

  RxList<EquipmentModel?> equipmentModelList = <EquipmentModel>[].obs;
  RxList<int> selectedEquipmentList = <int>[].obs;
  Rx<bool> isInventorySelected = true.obs;
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  RxList<int> selectedEquipmentIdList = <int>[].obs;
  Rx<String> selectedInventory = ''.obs;
  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;

  RxList<BusinessListModel?> supplierNameList = <BusinessListModel>[].obs;
  Rx<bool> isSupplierNameSelected = true.obs;
  Rx<String> selectedSupplier = ''.obs;
  RxList<String?> selectedSupplierNameList = <String>[].obs;
  RxList<int?> selectedSupplierNameIdList = <int>[].obs;
  Rx<bool> isBlockSelected = true.obs;

  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<String> selectedUnitCurrency = ''.obs;
  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;

  RxList<EmployeeListModel> employeeList = <EmployeeListModel>[].obs;
  Rx<bool> isemployeeListSelected = true.obs;
  Rx<String> selectedEmployeeList = ''.obs;
  RxList<String?> selectedEmployeeDataList = <String>[].obs;
  RxList<int?> selectedEmployeeIdList = <int>[].obs;

  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];
  var equipmentList = <EquipmentModel>[];
  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();
  final typeTextController = TextEditingController();
  final categoryTextController = TextEditingController();
  final serialNoTextController = TextEditingController();
  final statusTextController = TextEditingController();
  final assetNameTextController = TextEditingController();
  final enterMultiplierTextController = TextEditingController();
  final assetDescpTextController = TextEditingController();
  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();
  //int facilityId = 45;
  String categoryIds = '';

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

  void equipmentSelected(_selectedEquipmentIds) {
    // selectedEquipmentIdList.value = <int>[];
    // for (var _selectedEquipmentNameId in _selectedEquipmentIds) {
    //   selectedEquipmentIdList.add(_selectedEquipmentNameId);
    // }
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
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      case RxList<InventoryModel>:
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
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
          for (var unitCurrency in selectedUnitCurrencyList) {
            int unitCurrencyIndex =
                unitCurrencyList.indexWhere((x) => x?.code == unitCurrency);
            selectedUnitCurrencyIdList.add(unitCurrencyIndex);
          }
        }
        break;
      case RxList<EmployeeListModel>:
        {
          for (var employeeDataList in selectedEmployeeDataList) {
            int employeeListIndex =
                employeeList.indexWhere((x) => x.name == employeeDataList);
            selectedEmployeeIdList.add(employeeListIndex);
          }
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  ///Create Warranty Claim
  void createWarrantyClaim() async {
    {
      // checkForm();
      // if (isFormInvalid.value) {
      //   return;
      // }
      // String _title = htmlEscape.convert(titleTextFieldCtrlr.text.trim());
      // String _description =
      //     htmlEscape.convert(descriptionTextFieldCtrlr.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');

      CreateWarrantyClaimModel createwarrantyClaimModel =
          CreateWarrantyClaimModel(
              facilityId: 45,
              equipmentId: 13221,
              goodsOrderId: 14205,
              affectedPart: "Switch",
              orderReference: "ORDER14205",
              affectedSrNo: "25518/09/SWITCH",
              costOfReplacement: 5000,
              currencyId: 69,
              warrantyStartAt: "2023-04-01",
              warrantyEndAt: "2027-04-01",
              warrantyClaimTitle: "Burnt Switch Replacement",
              warrantyDescription:
                  "A switch in the ACDB is burnt. Please replace it.",
              correctiveActionByBuyer: "Buyer will have to replace the switch.",
              requestToSupplier: "Please give another switch at a discount.",
              approverId: 1,
              failureTime: "2023-04-05");

      var warrantyClaimJsonString = [createwarrantyClaimModel.toJson()];
      Map<String, dynamic>? responseCreateWarrantyClaim =
          await warrantyClaimPresenter.createWarrantyClaim(
        createWarrantyClaim: warrantyClaimJsonString,
        isLoading: true,
      );

      if (responseCreateWarrantyClaim != null) {
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
