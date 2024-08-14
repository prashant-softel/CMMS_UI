import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/careate_warranty_calim/create_warranty_claim_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/create_warranty_claim_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_category_model2.dart';
import 'package:cmms/domain/models/inventory_details_model.dart';
import 'package:cmms/domain/models/update_warranty_claim_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cmms/domain/models/history_model.dart';

class CreateWarrantyClaimController extends GetxController {
  CreateWarrantyClaimController(this.warrantyClaimPresenter);
  CreateWarrantyClaimPresenter warrantyClaimPresenter;

  final HomeController homeController = Get.find();
  FocusNode immcoracFocus = FocusNode();
  ScrollController immcoracScroll = ScrollController();
  FocusNode wdescFocus = FocusNode();
  ScrollController wdescScroll = ScrollController();
  FocusNode wtitleFocus = FocusNode();
  ScrollController wtitleScroll = ScrollController();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  var itemCount = 0.obs;
  RxInt type = 0.obs;

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;

  void removeRow({required int index}) {
    supplierActions.removeAt(index);
  }

  ///External Emails Part
  var externalEmails = <ExternalEmails>[].obs;
  void updateText(String name, String role, String email, int? mobile) {
    externalEmails.add(
        ExternalEmails(email: email, name: name, mobile: mobile, role: role));
  }

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

  ///Checkbox
  ////
  RxBool isCheckedRequire = false.obs;
  RxBool isCheckedDataRequire = false.obs;
  bool openFromDateToStartDatePicker = false;
  void requireToggleCheckbox() {
    isCheckedRequire.value = !isCheckedRequire.value;
    isCheckedDataRequire.value = isCheckedRequire.value;
    print('Checkbox value ${isCheckedRequire.value}');
    print(
        'Checkbox Data value ${isCheckedDataRequire.value}'); // Toggle the checkbox state
    // Toggle the checkbox state
  }

  Rx<ViewWarrantyClaimModel?> viewWarrantyClaimDetailsModel =
      ViewWarrantyClaimModel().obs;
  final TextEditingController serialNoTextFieldController =
      TextEditingController();
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController roleTextFieldController = TextEditingController();
  final TextEditingController emailTextFieldController =
      TextEditingController();
  final TextEditingController mobileTextFieldController =
      TextEditingController();

  RxList<AffectedPartImages?> affectedPartImages = <AffectedPartImages>[].obs;
  RxList<AffectedPartImages?> images = <AffectedPartImages>[].obs;

  /// default date controller
  Rx<DateTime> dateController = DateTime.now().obs;
  var currentStartDateCtrlrWeb = TextEditingController();
  var currentStartDateCtrlrWebBuffer;
  Rx<DateTime> selectedcurrentStartDate = DateTime.now().obs;

  ///Failure Date Time For Web
  var failureDateTimeCtrlrWeb = TextEditingController();
  var failureDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  ///WC List Date Time For Web
  var warrantyClaimListDateTimeCtrlrWeb = TextEditingController();
  var warrantyClaimListDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedwarrantyClaimListDateTimeWeb = DateTime.now().obs;

  ///Supplier Action Date Time For Web
  var supplierActionDateTimeCtrlrWeb = TextEditingController();
  var supplierActionDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedSupplierActionDateTimeWeb = DateTime.now().obs;

  ///Warranty Start date Time for web
  var warrantyStartDateTimeCtrlrWeb = TextEditingController();
  var warrantyStartDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedWarrantyStartDateTime = DateTime.now().obs;

  ///Warranty End date time for web
  var warrantyEndDateTimeCtrlrWeb = TextEditingController();
  var warrantyEndDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedWarrantyEndDateTime = DateTime.now().obs;

  Set<String> supplierNameSet = {};

  WarrantyClaimModel? warrantyClaimListModel;
  RxList<String> warrantyClaimListTableColumns = <String>[].obs;

//Warranty Claim
  // var warrantyClaimList = <WarrantyClaimModel>[];
  RxList<WarrantyClaimModel?> filteredData = <WarrantyClaimModel>[].obs;
  RxList<WarrantyClaimModel?> warrantyClaimList = <WarrantyClaimModel>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<bool> isEquipmentCategorySelected = true.obs;
  Rx<String> selectedEquipmentCategory = ''.obs;
  int selectedEquipmentCategoryIds = 0;
  RxList<List<Map<String, String>>> rowItems =
      <List<Map<String, String>>>[].obs;

  RxList<EquipmentModel?> equipmentModelList = <EquipmentModel>[].obs;
  RxList<int> selectedEquipmentList = <int>[].obs;
  Rx<bool> isInventorySelected = true.obs;
  RxList<int> selectedEquipmentIdList = <int>[].obs;
  Rx<String> selectedInventory = ''.obs;

  int selectedInventoryCategoryId = 0;

  ///Equipment name List
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedEquipmentName = ''.obs;
  Rx<bool> isEquipmentNameSelected = true.obs;
  int selectedEquipmentnameId = 0;
  // String? selectedEquipmentName = '';

  //Affected Part Equipemnt Name lIst
  RxList<InventoryCategoryModel2?> affectedPartEqipmentNameList =
      <InventoryCategoryModel2>[].obs;
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

  //From and To date format
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);

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

  /// Employees List / Additional Email
  RxList<EmployeeListModel2> employeesList = <EmployeeListModel2>[].obs;
  Rx<bool> isemployeesListSelected = true.obs;
  Rx<String> selectedEmployeesList = ''.obs;
  RxList<int> selectedEmployeeNameIdList = <int>[].obs;
  RxList<String?> selectedEmployeesDataList = <String>[].obs;
  RxList<int?> selectedEmployeesIdList = <int>[].obs;
  int selectedEmployeesId = 0;
  int facilityId = 0;

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
  final manufacturerNameTextController = TextEditingController();
  final approxdailylosstxtcontroller = TextEditingController();
  final commentCtrl = TextEditingController();

  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();

  //WC Grid

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Id": true,
    "Warranty Claim Title": true,
    "Date Of Claim": true,

    "Equipment Serial No.": true,
    "Equipment Category": true,
    "Equipment Name": true,
    "Estimated Cost": true,
    "Status": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Id": 153,
    "Warranty Claim Title": 220,
    "Date Of Claim": 320,
    "Equipment Serial No.": 200,
    "Equipment Category": 250,
    "Equipment Name": 250,
    "Estimated Cost": 250,
    "Status": 250,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  FocusNode commentFocus = FocusNode();
  ScrollController commentScroll = ScrollController();
  RxString warrantyClaimIdFilterText = ''.obs;
  RxString dateOfClaimFilterText = ''.obs;
  RxString wcTitleFilterText = ''.obs;
  RxString equipmentSrNoFilterText = ''.obs;
  RxString equipmentCategoryFilterText = ''.obs;
  RxString equipmentNameFilterText = ''.obs;
  RxString estimatedCostFilterText = ''.obs;
  RxString statusFilterText = ''.obs;
  RxString actionFilterText = ''.obs;

  /// Inventory Details Model
  Rx<InventoryDetailsModel?> inventoryDetailsModel =
      InventoryDetailsModel().obs;
  RxList<InventoryDetailsModel?>? inventoryDetailsList =
      <InventoryDetailsModel?>[].obs;

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
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<int> wc_id = 0.obs;

  ///
// int? wc_id = 0;
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    await setId();

    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId = event;
    });

    Future.delayed(Duration(seconds: 1), () {
      if (wc_id.value != 0) {
        getViewWarrantyClaimDetail(wc_id: wc_id.value);
        getHistory(facilityId: facilityId, wcId: wc_id.value);
      }
      // getFacilityList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getAffectedPartList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryCategoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getBusinessList(facilityId);
    });
    Future.delayed(Duration(seconds: 1), () {
      getUnitCurrencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getEmployeeList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getEmployeesList();
    });
    if (wc_id == 0) {
      addRowItem();
    }

    immcoracFocus.addListener(() {
      if (!immcoracFocus.hasFocus) {
        immcoracScroll.jumpTo(0.0);
      }
    });
    wtitleFocus.addListener(() {
      if (!wtitleFocus.hasFocus) {
        wtitleScroll.jumpTo(0.0);
      }
    });
    wdescFocus.addListener(() {
      if (!wdescFocus.hasFocus) {
        wdescScroll.jumpTo(0.0);
      }
    });
    commentFocus.addListener(() {
      if (!commentFocus.hasFocus) {
        commentScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> setId() async {
    try {
      final _wc_id = await warrantyClaimPresenter.getValue();
      final _type = await warrantyClaimPresenter.getTypeValue();
      if (_wc_id == null || _wc_id == "" || _wc_id == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        wc_id.value = dataFromPrevioursScreen['wc_id'];
        type.value = dataFromPrevioursScreen['type'];
        warrantyClaimPresenter.saveValue(wc_id: wc_id.value.toString());
        warrantyClaimPresenter.saveTypeValue(wc_type: type.value.toString());
      } else {
        wc_id.value = int.tryParse(_wc_id) ?? 0;
        type.value = int.tryParse(_type ?? "") ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  void clearStoreData() {
    warrantyClaimPresenter.clearValue();
    warrantyClaimPresenter.clearTypeValue();
  }

  Future<void> getViewWarrantyClaimDetail({required int wc_id}) async {
    final _viewWarrantyClaimDetails =
        await warrantyClaimPresenter.getViewWarrantyClaimDetail(
      wc_id: wc_id,
    );

    if (_viewWarrantyClaimDetails != null) {
      viewWarrantyClaimDetailsModel.value = _viewWarrantyClaimDetails;
      warrantyClaimTitleTextController.text =
          viewWarrantyClaimDetailsModel.value?.warranty_claim_title ?? "";
      warrantyClaimBriefDescTextController.text =
          viewWarrantyClaimDetailsModel.value?.warranty_description ?? "";
      selectedEquipmentCategory.value =
          viewWarrantyClaimDetailsModel.value?.equipment_category ?? "";
      selectedInventoryCategoryId =
          viewWarrantyClaimDetailsModel.value?.equipment_category_id ?? 0;
      selectedEquipmentName.value =
          viewWarrantyClaimDetailsModel.value?.equipment_name ?? "";
      selectedEquipmentnameId =
          viewWarrantyClaimDetailsModel.value?.equipment_id ?? 0;
      failureDateTimeCtrlrWeb.text =
          viewWarrantyClaimDetailsModel.value?.failure_time ?? "";
      failureDateTimeCtrlrWebBuffer =
          viewWarrantyClaimDetailsModel.value?.failure_time ?? "";
      approxdailylosstxtcontroller.text =
          viewWarrantyClaimDetailsModel.value?.approxdailyloss.toString() ?? "";
      currentStartDateCtrlrWeb.text =
          viewWarrantyClaimDetailsModel.value?.date_of_claim ?? "";
      currentStartDateCtrlrWebBuffer =
          viewWarrantyClaimDetailsModel.value?.date_of_claim ?? "";
      affectedSerialNoTextController.text =
          viewWarrantyClaimDetailsModel.value?.affected_sr_no ?? "";
      manufacturerNameTextController.text =
          viewWarrantyClaimDetailsModel.value?.manufacture_name ?? "";
      orderReferenceNoTextController.text =
          viewWarrantyClaimDetailsModel.value?.order_reference_number ?? "";
      warrantyStartDateTimeCtrlrWeb.text =
          viewWarrantyClaimDetailsModel.value?.wstart_date ?? "";
      warrantyStartDateTimeCtrlrWebBuffer =
          viewWarrantyClaimDetailsModel.value?.wstart_date ?? "";
      warrantyEndDateTimeCtrlrWeb.text =
          viewWarrantyClaimDetailsModel.value?.wend_date ?? "";
      warrantyEndDateTimeCtrlrWebBuffer =
          viewWarrantyClaimDetailsModel.value?.wend_date ?? "";
      costOfReplacementTextController.text =
          viewWarrantyClaimDetailsModel.value?.cost_of_replacement ?? "";
      immediateCorrectiveActionTextController.text =
          viewWarrantyClaimDetailsModel.value?.corrective_action_by_buyer ?? "";
      requestManufactureTextController.text =
          viewWarrantyClaimDetailsModel.value?.request_to_supplier ?? "";
      selectedSeverity.value =
          viewWarrantyClaimDetailsModel.value?.severity ?? "";
      setSelectedSeverity(selectedSeverity.value);
      selectedUnitCurrency.value =
          viewWarrantyClaimDetailsModel.value?.currency ?? "";
      selectedCurrencyId = viewWarrantyClaimDetailsModel.value?.currencyId ?? 0;
      if (viewWarrantyClaimDetailsModel.value?.additionalEmailEmployees !=
          null) {
        selectedEmployeeNameIdList.value = viewWarrantyClaimDetailsModel
            .value!.additionalEmailEmployees!
            .map((employee) => employee?.user_id ?? 0)
            .toList();
      }
      if (viewWarrantyClaimDetailsModel.value!.supplierActions!.isNotEmpty) {
        supplierActions.value =
            viewWarrantyClaimDetailsModel.value!.supplierActions!.map((action) {
          return SupplierActions(
            name: action?.name,
            required_by_date: action?.required_by_date,
            srNumber: action?.srNumber,
          );
        }).toList();
      }
      if (viewWarrantyClaimDetailsModel.value!.externalEmails!.isNotEmpty) {
        externalEmails.value =
            viewWarrantyClaimDetailsModel.value!.externalEmails!.map((action) {
          return ExternalEmails(
            name: action?.name,
            email: action?.email,
            role: action?.role,
            mobile: action?.mobile,
          );
        }).toList();
      }
      getInventoryDetail();
      images.value = viewWarrantyClaimDetailsModel.value?.images ?? [];
      affectedPartImages.value =
          viewWarrantyClaimDetailsModel.value?.affectedPartsImages ?? [];
    }
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

  Future<void> getInventoryDetail() async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    inventoryDetailsList?.value = <InventoryDetailsModel>[];

    final _inventoryDetails = await warrantyClaimPresenter.getInventoryDetail(
        id: selectedEquipmentnameId);
    print('Inventory Detail:$_inventoryDetails');

    if (_inventoryDetails != null) {
      inventoryDetailsModel.value = _inventoryDetails;
      affectedSerialNoTextController.text =
          inventoryDetailsModel.value?.serialNumber ?? '';
      manufacturerNameTextController.text =
          inventoryDetailsModel.value?.manufacturerName ?? '';
      String? startDateStr = inventoryDetailsModel.value?.start_date;
      if (startDateStr != null && startDateStr.isNotEmpty) {
        DateTime startDate = DateTime.parse(startDateStr);
        warrantyStartDateTimeCtrlrWeb.text =
            DateFormat('yyyy-MM-dd').format(startDate);
        warrantyStartDateTimeCtrlrWebBuffer =
            warrantyStartDateTimeCtrlrWeb.text;
      }
      String? expirydate = inventoryDetailsModel.value?.expiry_date;
      if (expirydate != null && expirydate.isNotEmpty) {
        DateTime expiryDate = DateTime.parse(expirydate);
        warrantyEndDateTimeCtrlrWeb.text =
            DateFormat('yyyy-MM-dd').format(expiryDate);
        warrantyEndDateTimeCtrlrWebBuffer = warrantyEndDateTimeCtrlrWeb.text;
      }

      costOfReplacementTextController.text =
          '${int.tryParse('${inventoryDetailsModel.value?.cost ?? ''}')}';
      requestManufactureTextController.text =
          inventoryDetailsModel.value?.supplierName ?? '';
    }
  }

  // Future<void> getuserAccessData() async {
  //   final _userAccessList = await warrantyClaimPresenter.getUserAccessList();

  //   if (_userAccessList != null) {
  //     final userAccessModelList = jsonDecode(_userAccessList);
  //     var userAccess = AccessListModel.fromJson(userAccessModelList);
  //     varUserAccessModel.value = userAccess;
  //     varUserAccessModel.value.access_list = userAccess.access_list;
  //   }
  // }

  void employeesNameSelected(_selectedEmployeesNameIds) async {
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
        await warrantyClaimPresenter.getInventoryCategoryList(
      isLoading: true,
    );

    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  Future<void> getAffectedPartList({String? facilityId}) async {
    affectedPartEqipmentNameList.value = <InventoryCategoryModel2>[];
    final _affectedPartList = await warrantyClaimPresenter.getAffectedPartList(
      isLoading: true,
    );

    if (_affectedPartList != null) {
      for (var affectedPart in _affectedPartList) {
        affectedPartEqipmentNameList.add(affectedPart);
      }
    }
  }

  Future<void> getHistory({required int wcId, required int facilityId}) async {
    int moduleType = 121;
    historyList?.value = await warrantyClaimPresenter.getHistory(
          moduleType,
          facilityId,
          wcId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  void addRowItem() {
    rowItems.add([
      {'key': "Affected Parts", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await warrantyClaimPresenter.getInventoryList(
      isLoading: true,
      categoryIds: selectedInventoryCategoryId.toString(),
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

  void getBusinessList(int facilityId) async {
    supplierNameList.value = <BusinessListModel>[];
    final _supplierNameList = await warrantyClaimPresenter.getBusinessList(
      facilityId: facilityId,
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
      facility_id: facilityId,
    );
    print('Employee List:$employeeList');
    for (var employee_list in _employeeList) {
      employeeList.add(employee_list);
    }

    update(['employee_list']);
  }

  void getEmployeesList() async {
    employeesList.value = <EmployeeListModel2>[];
    final _employeesList = await warrantyClaimPresenter.getEmployeesList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Employees List:$employeesList');
    for (var employees_list in _employeesList) {
      employeesList.add(employees_list);
    }

    update(['employee_list']);
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      warrantyClaimList.value = filteredData;
      return;
    }
    List<WarrantyClaimModel?> filteredList = filteredData
        .where((item) =>
            (item?.wc_id?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.date_of_claim?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.warranty_claim_title
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipment_sr_no
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipment_category
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipment_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.status?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.estimated_cost
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    warrantyClaimList.value = filteredList;
    // warrantyClaimList.value = filteredData
    //     .where((item) => item!.warranty_claim_title!
    //         .toLowerCase()
    //         .contains(keyword.toLowerCase()))
    //     .toList();
    // update(['warranty_claim_list']);
  }

  void clearSupplierAction() {
    supplierActionSrNumberTextFieldController.clear();
    supplierActionTextFieldController.clear();
    supplierActionDateTimeCtrlrWeb.clear();
    isCheckedRequire.value = false;
  }

  Future<void> getWarrantyClaimList(
      int facilityId, dynamic startDate, dynamic endDate) async {
    // supplierNameList.value = <WarrantyClaimModel>[];

    final list = await warrantyClaimPresenter.getWarrantyClaimList(
      isLoading: isLoading.value,
      categoryIds: categoryIds,
      facilityId: facilityId,
      start_date: startDate,
      end_date: endDate,
    );
    print('Supplier Name List:$supplierNameList');
    Set<String> supplierNameSet = {};
    for (var _supplierNameList in list) {
      if (_supplierNameList.supplier_name != null) {
        supplierNameSet.add(_supplierNameList.supplier_name ?? "");
      }
    }
    warrantyClaimList.value = list;
    filteredData.value = warrantyClaimList.value;
    isLoading.value = false;
    paginationWarrantyController = PaginationController(
      rowCount: warrantyClaimList.length,
      rowsPerPage: 10,
    );
    if (filteredData.isNotEmpty) {
      warrantyClaimListModel = filteredData[0];
      var warrantyClaimListJson = warrantyClaimListModel?.toJson();
      warrantyClaimListTableColumns.value = <String>[];
      for (var key in warrantyClaimListJson?.keys.toList() ?? []) {
        warrantyClaimListTableColumns.add(key);
      }
    }
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
      case const (RxList<FacilityModel>):
        {
          if (value != "Please Select") {
            int facilityIndex =
                facilityList.indexWhere((x) => x?.name == value);

            _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          } else {
            facilityId = 0;
          }
        }
        break;
      case const (RxList<InventoryModel>):
        {
          if (value != "Please Select") {
            // for (var workAreaName in selectedWorkAreaNameList) {
            int equipmentNameIndex =
                eqipmentNameList.indexWhere((x) => x?.name == value);
            selectedEquipmentnameId =
                eqipmentNameList[equipmentNameIndex]?.id ?? 0;
            getInventoryDetail();

            if (selectedEquipmentnameId > 0) {
              isEquipmentNameSelected.value = true;
            }
            selectedEquipmentName.value = value;

            print('Equipment name Id: $selectedEquipmentnameId');

            // }
          } else {
            selectedEquipmentnameId = 0;
          }
        }
        break;

      case const (RxList<InventoryCategoryModel2>):
        {
          if (value != "Please Select") {
            // for (var workAreaName in selectedWorkAreaNameList) {
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
        }
        break;
      case const (RxList<InventoryCategoryModel>):
        {
          if (value != "Please Select") {
            int invCatListIndex =
                equipmentCategoryList.indexWhere((x) => x!.name == value);
            selectedInventoryCategoryId =
                equipmentCategoryList[invCatListIndex]!.id ?? 0;
            getInventoryList();
          } else {
            selectedInventoryCategoryId = 0;
          }
          //}
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
            //  selectedSupplierNameIdList = 0;
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

            // }
          } else {
            selectedEmployeesId = 0;
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
  void createWarrantyClaim({
    List<dynamic>? fileIds,
    List<dynamic>? affectedFileIds,
  }) async {
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
      int approxdailyloss = int.parse(approxdailylosstxtcontroller.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');
      late List<ExternalEmails> external_emails_list = [];

      externalEmails.forEach((e) {
        external_emails_list.add(ExternalEmails(
            name: e.name, role: e.role, email: e.email, mobile: e.mobile));
      });

      late List<SupplierActions> supplier_action_list = [];

      supplierActions.forEach((e) {
        supplier_action_list.add(SupplierActions(
          srNumber: e.srNumber,
          name: e.name,
          required_by_date: e.required_by_date,
          // is_required: e.is_required
        ));
      });
      // List<AffectedParts> affectedPart = [];

      // rowItems.forEach((element) {
      //   AffectedParts item = AffectedParts(name: element[0]["value"] ?? '0');
      //   affectedPart.add(item);
      //   print('Affected parts: $item');
      // });

      CreateWarrantyClaimModel createwarrantyClaimModel =
          CreateWarrantyClaimModel(
        id: wc_id.value,
        facilityId: facilityId,
        equipmentId: selectedEquipmentnameId,
        goodsOrderId: 14205,
        affectedParts: affectedFileIds,
        orderReference: _orderReferenceNo,
        affectedSrNo: _affectedSerialNo,
        costOfReplacement: costOfReplacement,
        currencyId: selectedCurrencyId,
        approxdailyloss: approxdailyloss,
        severity: selectedSeverity.value,
        currentTime: currentStartDateCtrlrWebBuffer,
        warrantyStartAt: warrantyStartDateTimeCtrlrWebBuffer,
        warrantyEndAt: warrantyEndDateTimeCtrlrWebBuffer,
        warrantyClaimTitle: _warrantyClaimTitle,
        warrantyDescription: _description,
        correctiveActionByBuyer: _immediateCorrectiveByBuyer,
        requestToSupplier: _requestToBuyer,
        approverId: selectedApproverId, //
        failureTime: failureDateTimeCtrlrWebBuffer,
        additionalEmailEmployees: selectedEmployeeNameIdList,
        externalEmails: external_emails_list,
        supplierActions: supplier_action_list,
        status: 1,
        uploadfile_ids: fileIds,
        comment: commentCtrl.text,

        ///additional data to create WC as 'Submit for Release'
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

  ///Saving AS Draft
  void checkSaveDraftForm() {
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

  ///Saving As Draft & Create Warranty Claim
  void saveAsDraft() async {
    {
      checkSaveDraftForm();
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
      int approxdailyloss = int.parse(approxdailylosstxtcontroller.text.trim());
      int costOfReplacement =
          int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');
      late List<ExternalEmails> external_emails_list = [];

      externalEmails.forEach((e) {
        external_emails_list.add(
            ExternalEmails(name: e.name, email: e.email, mobile: e.mobile));
      });
      // late List<AffectedParts> affectedParts = [];

      // rowItems.forEach((element) {
      //   AffectedParts item = AffectedParts(name: element[0]["value"] ?? '0');
      //   print('Affected parts: $item');
      //   affectedParts.add(item);

      //   print('Create req  order  data: $item');
      // });

      late List<SupplierActions> supplier_action_list = [];

      supplierActions.forEach((e) {
        supplier_action_list.add(SupplierActions(
          srNumber: e.srNumber,
          name: e.name,
          required_by_date: e.required_by_date,
          // is_required: e.is_required
        ));
      });

      CreateWarrantyClaimModel createwarrantyClaimModel =
          CreateWarrantyClaimModel(
              facilityId: facilityId,
              equipmentId: selectedEquipmentnameId,
              goodsOrderId: 14205,
              // affectedParts: affectedParts,
              orderReference: _orderReferenceNo,
              affectedSrNo: _affectedSerialNo,
              costOfReplacement: costOfReplacement,
              currencyId: selectedCurrencyId,
              approxdailyloss: approxdailyloss,
              severity: selectedSeverity.value,
              warrantyStartAt: warrantyStartDateTimeCtrlrWebBuffer,
              warrantyEndAt: warrantyEndDateTimeCtrlrWebBuffer,
              warrantyClaimTitle: _warrantyClaimTitle,
              warrantyDescription: _description,
              correctiveActionByBuyer: _immediateCorrectiveByBuyer,
              requestToSupplier: _requestToBuyer,
              approverId: selectedApproverId, //
              failureTime: failureDateTimeCtrlrWebBuffer,
              additionalEmailEmployees: selectedEmployeeNameIdList,
              externalEmails: external_emails_list,
              supplierActions: supplier_action_list,
              status: 0 //additional data to save as draft

              );

      var saveAsJsonString = [createwarrantyClaimModel.toJson()];
      Map<String, dynamic>? responseCreateWarrantyClaim =
          await warrantyClaimPresenter.saveAsDraft(
        createWarrantyClaim: saveAsJsonString,
        isLoading: true,
      );

      if (responseCreateWarrantyClaim == null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Save As Draft Warranty Claim data: $saveAsJsonString');
    }
  }

  void updateWarrantyClaim({
    List<dynamic>? fileIds,
    List<dynamic>? affectedFileIds,
  }) async {
    {
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
      int approxdailyloss = int.parse(approxdailylosstxtcontroller.text.trim());
      late List<ExternalEmails> external_emails_list = [];
      externalEmails.forEach((e) {
        external_emails_list.add(ExternalEmails(
            name: e.name, role: e.role, email: e.email, mobile: e.mobile));
      });

      // print('EquipmentCategoryId:$idList');
      late List<SupplierActions> supplier_action_list = [];

      supplierActions.forEach((e) {
        supplier_action_list.add(SupplierActions(
          srNumber: e.srNumber,
          name: e.name,
          required_by_date: e.required_by_date,
          // is_required: e.is_required
        ));
      });
      CreateWarrantyClaimModel updatewarrantyClaimModel =
          CreateWarrantyClaimModel(
        id: wc_id.value,
        facilityId: facilityId,
        equipmentId: selectedEquipmentnameId,
        goodsOrderId: 14205,
        affectedParts: affectedFileIds ?? [],
        orderReference: _orderReferenceNo,
        affectedSrNo: _affectedSerialNo,
        costOfReplacement: costOfReplacement,
        currencyId: selectedCurrencyId,
        approxdailyloss: approxdailyloss,
        severity: selectedSeverity.value,
        currentTime: currentStartDateCtrlrWebBuffer,
        warrantyStartAt: warrantyStartDateTimeCtrlrWebBuffer,
        warrantyEndAt: warrantyEndDateTimeCtrlrWebBuffer,
        warrantyClaimTitle: _warrantyClaimTitle,
        warrantyDescription: _description,
        correctiveActionByBuyer: _immediateCorrectiveByBuyer,
        requestToSupplier: _requestToBuyer,
        approverId: selectedApproverId, //
        failureTime: failureDateTimeCtrlrWebBuffer,
        additionalEmailEmployees: selectedEmployeeNameIdList,
        externalEmails: external_emails_list,
        supplierActions: supplier_action_list,
        status: 1,
        uploadfile_ids: fileIds ?? [],
        comment: commentCtrl.text,
      );

      var warrantyClaimJsonString = updatewarrantyClaimModel.toJson();
      Map<String, dynamic>? responseUpdateWarrantyClaim =
          await warrantyClaimPresenter.updateWarrantyClaim(
        updateWarrantyClaim: warrantyClaimJsonString,
        isLoading: true,
      );
      if (responseUpdateWarrantyClaim == null) {}
      print('Update Warranty Claim data: $warrantyClaimJsonString');
    }
  }

  void wcApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentWCAproveModel =
          CommentModel(id: id, comment: _comment);

      var WCApproveJsonString = commentWCAproveModel.toJson();

      Map<String, dynamic>? response =
          await warrantyClaimPresenter.wcApprovedButton(
        WCApproveJsonString: WCApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offNamed(Routes.warrantyClaimListWeb);
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void wcRejectdButton({int? id}) async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentWCRejectModel =
          CommentModel(id: id, comment: _comment);

      var WCRejectJsonString = commentWCRejectModel.toJson();

      Map<String, dynamic>? response =
          await warrantyClaimPresenter.wcRejectdButton(
        WCRejectJsonString: WCRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
        Get.offNamed(Routes.warrantyClaimListWeb);
      }
    }
  }

  void getWarrantyClaimtListByDate() {
    getWarrantyClaimList(facilityId, formattedFromdate, formattedTodate);
  }
}
