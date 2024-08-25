import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/edit_warranty_claim/edit_warranty_claim_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/create_warranty_claim_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/update_warranty_claim_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';

class EditWarrantyClaimController extends GetxController {
  EditWarrantyClaimController(this.editWarrantyClaimPresenter);
  EditWarrantyClaimPresenter editWarrantyClaimPresenter;

  final HomeController homeController = Get.find();
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  ///Radio
  RxString selectedSeverity = RxString('');
  void setSelectedSeverity(String severity) {
    selectedSeverity.value = severity;
  }

  ///Supplier Action Part
  var supplierActions = <SupplierActions>[].obs;
  void updateSupplierActionText(
    String name,
    String required_by_data,
    String srNumber,
  ) {
    supplierActions.add(SupplierActions(
      name: name,
      required_by_date: required_by_data,
      // is_required: is_required
      srNumber: srNumber,
    ));
  }

  final TextEditingController supplierActionTextFieldController =
      TextEditingController();
  final TextEditingController supplierActionSrNumberTextFieldController =
      TextEditingController();

  ///External Emails Part
  var externalEmails = <ExternalEmails>[].obs;
  void updateText(String name, String email) {
    externalEmails.add(ExternalEmails(email: email, name: name));
  }

  final TextEditingController serialNoTextFieldController =
      TextEditingController();
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController emailTextFieldController =
      TextEditingController();

  ///Supplier Action Date Time For Web
  var supplierActionDateTimeCtrlrWeb = TextEditingController();
  var supplierActionDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedSupplierActionDateTimeWeb = DateTime.now().obs;

  ///Checkbox
  RxBool isCheckedRequire = false.obs;
  RxBool isCheckedDataRequire = true.obs;

  void requireToggleCheckbox() {
    isCheckedRequire.value = !isCheckedRequire.value;
    isCheckedDataRequire.value = isCheckedRequire.value;
    print('Checkbox value ${isCheckedRequire.value}');
    print(
        'Checkbox Data value ${isCheckedDataRequire.value}'); // Toggle the checkbox state
    // Toggle the checkbox state
  }

  ///Failure Date Time For Web
  var failureDateTimeCtrlrWeb = TextEditingController();
  var failureDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  /// Employees List / Additional Email
  RxList<EmployeeListModel2> employeesList = <EmployeeListModel2>[].obs;
  Rx<bool> isemployeesListSelected = true.obs;
  Rx<String> selectedEmployeesList = ''.obs;
  RxList<int?> selectedEmployeeNameIdList = <int?>[].obs;
  RxList<String?> selectedEmployeesDataList = <String>[].obs;
  RxList<int?> selectedEmployeesIdList = <int>[].obs;
  int selectedEmployeesId = 0;

  ///Warranty Start date Time for web
  var warrantyStartDateTimeCtrlrWeb = TextEditingController();
  var warrantyStartDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedWarrantyStartDateTime = DateTime.now().obs;

  ///Warranty End date time for web
  var warrantyEndDateTimeCtrlrWeb = TextEditingController();
  var warrantyEndDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedWarrantyEndDateTime = DateTime.now().obs;

  Set<String> supplierNameSet = {};

//Edit Warranty Claim
  var warrantyClaimList = <WarrantyClaimModel>[];
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<bool> isEquipmentCategorySelected = true.obs;
  Rx<String> selectedEquipmentCategory = ''.obs;
  int selectedEquipmentCategoryId = 0;

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
  RxList<int?> selectedEquipmentNameId = <int?>[].obs;

  // String? selectedEquipmentName = '';
  RxList<List<Map<String, String>>> rowItems =
      <List<Map<String, String>>>[].obs;
  //Affected Part Equipemnt Name lIst
  RxList<InventoryCategoryModel?> affectedPartEqipmentNameList =
      <InventoryCategoryModel>[].obs;
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
  final currentdateTextController = TextEditingController();

  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();

  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();
  //int facilityId = 45;
  String categoryIds = '';
  Rx<bool> isFormInvalid = false.obs;

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  /// Edit WarrantyClaim Details

  Rx<ViewWarrantyClaimModel?> editWarrantyClaimDetailsModel =
      ViewWarrantyClaimModel().obs;
  RxList<ViewWarrantyClaimModel?>? editWarrantyClaimDetailsList =
      <ViewWarrantyClaimModel?>[].obs;

  ///External Emails list from api
  RxList<ExternalsEmailsList?>? externalEmailsList =
      <ExternalsEmailsList?>[].obs;

  ///Supplier ACtion
  RxList<SuppliersActionsList?>? supplierActionsList =
      <SuppliersActionsList?>[].obs;

  ///AdditioanlEmailEmployees
  RxList<EmployeeListModel?>? additionalEmailEmployeesList =
      <EmployeeListModel?>[].obs;

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

  ///
  int? wc_id = 0;
  @override
  void onInit() async {
    wc_id = Get.arguments;
    print('WC_Id2:$wc_id');

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    // Future.delayed(Duration(seconds: 1), () {
    //   getuserAccessData();
    // });

    if (wc_id != null) {
      Future.delayed(Duration(seconds: 1), () {
        getEditWarrantyClaimDetail(wc_id: wc_id!);
      });
    }

    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getAffectedPartList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getEmployeesList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryCategoryList();
    });
    // Future.delayed(Duration(seconds: 1), () {
    //   getBusinessList();
    // });
    Future.delayed(Duration(seconds: 1), () {
      getUnitCurrencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getEmployeeList();
    });
    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await editWarrantyClaimPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getEditWarrantyClaimDetail({required int wc_id}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    editWarrantyClaimDetailsList?.value = <ViewWarrantyClaimModel>[];

    final _editWarrantyClaimDetails = await editWarrantyClaimPresenter
        .getEditWarrantyClaimDetail(wc_id: wc_id, facilityId: facilityId);
    print('Edit Warranty Claim Detail:$_editWarrantyClaimDetails');

    if (_editWarrantyClaimDetails != null) {
      editWarrantyClaimDetailsModel.value = _editWarrantyClaimDetails;
      warrantyClaimTitleTextController.text =
          editWarrantyClaimDetailsModel.value?.warranty_claim_title ?? '';
      warrantyClaimBriefDescTextController.text =
          editWarrantyClaimDetailsModel.value?.warranty_description ?? '';
      editWarrantyClaimDetailsModel.value?.affectedParts?.forEach((element) {
        rowItems.add([
          {'key': "Affected Parts", "value": '${element?.name}'},
          {'key': "Action ", "value": ''},
        ]);
      });
      selectedEquipmentName.value =
          editWarrantyClaimDetailsModel.value?.equipment_name ?? '';
      selectedEquipmentCategory.value =
          editWarrantyClaimDetailsModel.value?.equipment_category ?? '';
      setSelectedSeverity(_editWarrantyClaimDetails.severity ?? '');
      // selectedAffectedPart.value =
      //     editWarrantyClaimDetailsModel.value?.affected_part ?? '';
      failureDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${editWarrantyClaimDetailsModel.value?.failure_time}'))}';
      affectedSerialNoTextController.text =
          editWarrantyClaimDetailsModel.value?.affected_sr_no ?? '';
      orderReferenceNoTextController.text =
          editWarrantyClaimDetailsModel.value?.order_reference_number ?? '';
      warrantyStartDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${editWarrantyClaimDetailsModel.value?.failure_time ?? ''}'))}';
      warrantyEndDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${editWarrantyClaimDetailsModel.value?.failure_time ?? ''}'))}';
      costOfReplacementTextController.text =
          editWarrantyClaimDetailsModel.value?.cost_of_replacement.toString() ?? '';
      immediateCorrectiveActionTextController.text =
          editWarrantyClaimDetailsModel.value?.corrective_action_by_buyer ?? '';
      requestManufactureTextController.text =
          editWarrantyClaimDetailsModel.value?.request_to_supplier ?? '';
      selectedUnitCurrency.value =
          editWarrantyClaimDetailsModel.value?.currency ?? '';
      selectedEmployeeList.value =
          editWarrantyClaimDetailsModel.value?.approver_name ?? '';
      selectedEquipmentnameId =
          editWarrantyClaimDetailsModel.value?.equipment_id ?? 0;
      selectedCurrencyId = editWarrantyClaimDetailsModel.value?.currencyId ?? 0;
      // selectedApproverId = editWarrantyClaimDetailsModel.value?.approverId ?? 0;

      externalEmailsList?.value =
          editWarrantyClaimDetailsModel.value?.externalEmails ?? [];
      supplierActionsList?.value =
          editWarrantyClaimDetailsModel.value?.supplierActions ?? [];
      additionalEmailEmployeesList?.value =
          editWarrantyClaimDetailsModel.value?.additionalEmailEmployees ?? [];
      List<int?> idList =
          additionalEmailEmployeesList!.map((obj) => obj!.id).toList();
      selectedEmployeeNameIdList.value = idList;
      print('Additioanl Email Employees${selectedEmployeeNameIdList}');
    }
  }

  void getEmployeesList() async {
    employeesList.value = <EmployeeListModel2>[];
    final _employeesList = await editWarrantyClaimPresenter.getEmployeesList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: 45,
    );
    print('Employees List:$_employeesList');
    for (var employees_list in _employeesList) {
      employeesList.add(employees_list);
    }
    // supplierNameList = _supplierNameList;
    // paginationBusinessListController = PaginationController(
    //   rowCount: supplierNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['employee_list']);
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

  void employeesNameSelected(_selectedEmployeesNameIds) {
    selectedEmployeeNameIdList.value = <int>[];
    for (var _selectedEmployeesId in _selectedEmployeesNameIds) {
      selectedEmployeeNameIdList.add(_selectedEmployeesId);
    }
  }

  void affectedPartSelected(_selectedaffectedPartIds) {
    selectedAffectedPartEquipmentIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedaffectedPartIds) {
      selectedAffectedPartEquipmentIdList.add(_selectedCategoryId);
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await editWarrantyClaimPresenter.getInventoryCategoryList(
      isLoading: true,
    );

    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  Future<void> getAffectedPartList({String? facilityId}) async {
    affectedPartEqipmentNameList.value = <InventoryCategoryModel>[];
    final _affectedPartList =
        await editWarrantyClaimPresenter.getAffectedPartList(
      isLoading: true,
    );

    if (_affectedPartList != null) {
      for (var affectedPart in _affectedPartList) {
        affectedPartEqipmentNameList.add(affectedPart);
      }
    }
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await editWarrantyClaimPresenter.getInventoryList(
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

  void getUnitCurrencyList() async {
    unitCurrencyList.value = <CurrencyListModel>[];
    final _unitCUrrencyList =
        await editWarrantyClaimPresenter.getUnitCurrencyList(
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
    final _employeeList = await editWarrantyClaimPresenter.getEmployeeList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: 45,
    );
    print('Employee List:$employeeList');
    for (var employee_list in _employeeList) {
      employeeList.add(employee_list);
    }

    update(['employee_list']);
  }

  void getBlockList(String facilityId) async {
    final list = await editWarrantyClaimPresenter.getBlockList(
        isLoading: false, facilityId: facilityId);
    blockList = list;
    update(['block_list']);
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

  void addRowItem() {
    rowItems.add([
      {'key': "Affected Parts", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<FacilityModel>):
        {
          if (value != "Please Select") {
            int facilityIndex =
                facilityList.indexWhere((x) => x?.name == value);

            _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          } else {
            // facilityId=0;
          }
        }
        break;
      case const (RxList<InventoryModel>):
        {
          // for (var workAreaName in selectedWorkAreaNameList) {
          if (value != "Please Select") {
            int equipmentNameIndex =
                eqipmentNameList.indexWhere((x) => x?.name == value);
            selectedEquipmentnameId =
                eqipmentNameList[equipmentNameIndex]?.id ?? 0;

            if (selectedEquipmentnameId > 0) {
              isEquipmentNameSelected.value = true;
            }
            selectedEquipmentName.value = value;

            print('Equipment name Id: $selectedEquipmentnameId');
          } else {
            selectedEquipmentnameId = 0;
          }

          // }
        }
        break;
      case const (RxList<InventoryCategoryModel>):
        {
          // for (var workAreaName in selectedWorkAreaNameList) {
          if (value != "Please Select") {
            int affectedPartIndex = affectedPartEqipmentNameList
                .indexWhere((x) => x?.name == value);
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
          } else {
            selectedAffectedPartId = 0;
          }

          // }
        }
        break;
      case const (RxList<BusinessListModel>):
        {
          if (value != "Please Select") {
            for (var supplierName in selectedSupplierNameList) {
              int supplierNameIndex =
                  supplierNameList.indexWhere((x) => x?.name == supplierName);
              selectedSupplierNameIdList.add(supplierNameIndex);
            }
          } else {
            // selectedSupplierNameIdList=0;
          }
        }
        break;
      case const (RxList<CurrencyListModel>):
        {
          // for (var unitCurrency in selectedUnitCurrencyList) {
          if (value != "Please Select") {
            int unitCurrencyIndex =
                unitCurrencyList.indexWhere((x) => x?.name == value);
            selectedCurrencyId = unitCurrencyList[unitCurrencyIndex]?.id ?? 0;

            if (selectedCurrencyId > 0) {
              isUnitCurrencySelected.value = true;
            }
            selectedUnitCurrency.value = value;
            print('Unit Currency Id :$selectedCurrencyId');
          } else {
            selectedCurrencyId = 0;
          }

          // }
        }
        break;
      case const (RxList<EmployeeListModel>):
        {
          // for (var employeeDataList in selectedEmployeeDataList) {
          if (value != "Please Select") {
            int employeeListIndex =
                employeeList.indexWhere((x) => x.name == value);
            selectedApproverId = employeeList[employeeListIndex].id ?? 0;

            if (selectedApproverId > 0) {
              isemployeeListSelected.value = true;
            }
            selectedEmployeeList.value = value;
            print('Approver Id: $selectedApproverId');
          } else {
            selectedApproverId = 0;
          }

          // }
        }
        break;
      case const (RxList<InventoryCategoryModel>):
        {
          // for (var employeeDataList in selectedEmployeeDataList) {
          if (value != "Please Select") {
            int equipmentListIndex =
                equipmentCategoryList.indexWhere((x) => x!.name == value);
            selectedEquipmentCategoryId =
                equipmentCategoryList[equipmentListIndex]?.id ?? 0;

            print('Equipment Category Id: $equipmentListIndex');
          } else {
            selectedEquipmentCategoryId = 0;
          }

          // }
        }
        break;
      case const (RxList<EmployeeListModel2>):
        {
          if (value != "Please Select") {
            // for (var employeeDataList in selectedEmployeeDataList) {
            int employeesListIndex =
                employeesList.indexWhere((x) => x.name == value);
            selectedEmployeesId = employeesList[employeesListIndex].id ?? 0;

            // if (selectedApproverId > 0) {
            //   isemployeeListSelected.value = true;
            // }
            // selectedEmployeeList.value = value;
            print('Additional Email Employees Id: $selectedEmployeesId');
          } else {
            selectedEmployeesId = 0;
          }

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

  ///Update Warranty Claim
  void updateWarrantyClaim() async {
    {
      // checkForm();
      // if (isFormInvalid.value) {
      //   return;
      // }

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
      List<int?> idList = eqipmentNameList.map((obj) => obj!.id).toList();
      // int? id = selectedEquipmentName.value
      print('EquipmentCategoryId:$idList');

      late List<ExternalsEmails> external_emails_list = [];

      externalEmails.forEach((e) {
        external_emails_list.add(ExternalsEmails(name: e.name, email: e.email));
      });

      late List<SuppliersActions> supplier_action_list = [];

      supplierActions.forEach((e) {
        supplier_action_list.add(SuppliersActions(
          name: e.name,
          required_by_date: e.required_by_date,
          // is_required: e.is_required
        ));
      });

      UpdateWarrantyClaimModel updatewarrantyClaimModel =
          UpdateWarrantyClaimModel(
        id: wc_id,
        facilityId: facilityId,
        equipmentId: selectedEquipmentnameId,
        // equipmentId: selectedEquipmentNameId.value,
        goodsOrderId: 14205,
        affectedPart: selectedAffectedPart.value,
        // affectedPart: "SWITCH",
        orderReference: _orderReferenceNo,
        affectedSrNo: _affectedSerialNo,
        costOfReplacement: costOfReplacement,
        currencyId: selectedCurrencyId,
        warrantyStartAt: warrantyStartDateTimeCtrlrWeb.text,
        warrantyEndAt: warrantyEndDateTimeCtrlrWeb.text,
        warrantyClaimTitle: _warrantyClaimTitle,
        warrantyDescription: _description,
        correctiveActionByBuyer: _immediateCorrectiveByBuyer,
        requestToSupplier: _requestToBuyer,
        approverId: selectedApproverId, // need id from backend
        failureTime: failureDateTimeCtrlrWeb.text,
        additionalEmailEmployees: selectedEmployeeNameIdList,
        // [
        //   5
        // ],
        externalEmails: external_emails_list,
        // [
        //   ExternalsEmails(name: "Himanshu Seth", email: "himanshu@gmail.com")
        // ],
        supplierActions: supplier_action_list,
      );

      var warrantyClaimJsonString = updatewarrantyClaimModel.toJson();
      Map<String, dynamic>? responseUpdateWarrantyClaim =
          await editWarrantyClaimPresenter.updateWarrantyClaim(
        updateWarrantyClaim: warrantyClaimJsonString,
        isLoading: true,
      );

      if (responseUpdateWarrantyClaim == null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Update Warranty Claim data: $warrantyClaimJsonString');
    }
  }
}
