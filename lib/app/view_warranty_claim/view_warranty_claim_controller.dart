import 'dart:convert';
import 'dart:ui';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_warranty_claim/view_warranty_claim_presenter.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';


class ViewWarrantyClaimController extends GetxController {
  ViewWarrantyClaimController(this.viewWarrantyClaimPresenter);
  ViewWarrantyClaimPresenter viewWarrantyClaimPresenter;

  final HomeController homeController = Get.find();


  ///Print Global key
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

//History Widget
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  



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

////TextEditing controller
  final equipmentNameTextController = TextEditingController();
  final supplierNameTextController = TextEditingController();
  final serialNoTextController = TextEditingController();
  final equipmentSerialNoTextController = TextEditingController();
  final orderReferenceNoTextController = TextEditingController();
  final failureDateTimeTextController = TextEditingController();
    var startDateTimeCtrlrWeb = TextEditingController();
  Rx<DateTime> selectedDateTimeWeb = DateTime.now().obs;
  final categoryTextController = TextEditingController();
  final costOfReplacementTextController = TextEditingController();
  final warrantyStartDateTextController = TextEditingController();
  final warrantyClaimTitleTextController = TextEditingController();
  final warrantyBriefDescriptionTextController = TextEditingController();
  final correctiveActionByBuyerTextController = TextEditingController();
  final requestToSupplierTextController = TextEditingController();
  final approverNametextController = TextEditingController();

  

  final blockTextController = TextEditingController();
  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();
  //int facilityId = 45;
  String categoryIds = '';

  Rx<String> selectedFacility = ''.obs;
  String username = '';

   ///External Emails list from api
  RxList<ExternalsEmailsList?>? externalEmailsList = <ExternalsEmailsList?>[].obs;

   ///Supplier ACtion
  RxList<SuppliersActionsList?>? supplierActionsList = <SuppliersActionsList?>[].obs;


  ///View Warranty Claim Details
  Rx<ViewWarrantyClaimModel?> viewWarrantyClaimDetailsModel = ViewWarrantyClaimModel().obs;
  RxList<ViewWarrantyClaimModel?>? viewWarrantyClaimDetailsList = <ViewWarrantyClaimModel?>[].obs;

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
int? wc_id = 0;
  @override
  void onInit() async {
    wc_id = Get.arguments;
    print('WC_Id:$wc_id');

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getuserAccessData();
    });

   if(wc_id != null){
     Future.delayed(Duration(seconds: 1), () {
      getViewWarrantyClaimDetail(wc_id: wc_id!);
    });

   }
    // Future.delayed(Duration(seconds: 1), () {
    //   getWarrantyClaimList();
    // });
    // Future.delayed(Duration(seconds: 1), () {
    //   getInventoryCategoryList();
    // });
    // Future.delayed(Duration(seconds: 1), () {
    //   getBusinessList();
    // });
    // Future.delayed(Duration(seconds: 1), () {
    //   getUnitCurrencyList();
    // });
    // Future.delayed(Duration(seconds: 1), () {
    //   getEmployeeList();
    // });
    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await viewWarrantyClaimPresenter.getFacilityList();
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
    final _userAccessList = await viewWarrantyClaimPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

   Future <void> getViewWarrantyClaimDetail({required int wc_id}) async{
   // newPermitDetails!.value = <NewPermitListModel>[];
      viewWarrantyClaimDetailsList?.value = <ViewWarrantyClaimModel>[];

    final _viewWarrantyClaimDetails = await viewWarrantyClaimPresenter.getViewWarrantyClaimDetail(
        wc_id: wc_id
        );
        print('New Warranty Claim Detail:$_viewWarrantyClaimDetails');

        if(_viewWarrantyClaimDetails != null ){
      viewWarrantyClaimDetailsModel.value = _viewWarrantyClaimDetails;
      // listEmployee?.value = viewPermitDetailsModel.value?.employee_list ?? [];
      // safetyList?.value = viewPermitDetailsModel.value?.safety_question_list ?? [];
      // listCategory?.value = viewPermitDetailsModel.value?.lstCategory ?? [];
      // listLoto?.value = viewPermitDetailsModel.value?.loto_list ?? [];
      categoryTextController.text = viewWarrantyClaimDetailsModel.value?.equipment_category ?? '';
      equipmentNameTextController.text = viewWarrantyClaimDetailsModel.value?.equipment_name ?? '';
      supplierNameTextController.text = viewWarrantyClaimDetailsModel.value?.supplier_name ?? '';
      equipmentSerialNoTextController.text = viewWarrantyClaimDetailsModel.value?.equipment_sr_no ?? '';
      orderReferenceNoTextController.text = viewWarrantyClaimDetailsModel.value?.order_reference_number ?? '';
      failureDateTimeTextController.text = '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewWarrantyClaimDetailsModel.value?.failure_time}'))}';
      costOfReplacementTextController.text = viewWarrantyClaimDetailsModel.value?.cost_of_replacement ?? '';
      // warrantyStartDateTextController.text = '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewWarrantyClaimDetailsModel.value?.date_of_claim ?? ''}'))}';
      warrantyClaimTitleTextController.text = viewWarrantyClaimDetailsModel.value?.warranty_claim_title ?? '';
      warrantyBriefDescriptionTextController.text = viewWarrantyClaimDetailsModel.value?.warranty_description ?? '';
      correctiveActionByBuyerTextController.text = viewWarrantyClaimDetailsModel.value?.corrective_action_by_buyer ?? '';
      requestToSupplierTextController.text = viewWarrantyClaimDetailsModel.value?.request_to_supplier ?? '';
      approverNametextController.text = viewWarrantyClaimDetailsModel.value?.approver_name ?? '';
      externalEmailsList?.value = viewWarrantyClaimDetailsModel.value?.externalEmails ?? [];
      supplierActionsList?.value = viewWarrantyClaimDetailsModel.value?.supplierActions ?? [];
      // // permitDescriptionCtrlr.text = newPermitDetailsModel.value?.description ?? '';
      // startDateTimeCtrlr.text = '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewPermitDetailsModel.value?.start_datetime}'))}';
      // validTillTimeCtrlr.text = '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewPermitDetailsModel.value?.end_datetime}'))}';;
      // // selectedBlock.value = newPermitDetailsModel.value?.blockName ?? "";
      // // selectedTypePermit.value = newPermitDetailsModel.value?.permitTypeName ?? '';
      // // // selectedJobTypeList.value = newPermitDetailsModel.value.
      // // selectedPermitIssuerLists.value = newPermitDetailsModel.value?.issuedByName ?? '';
      // // selectedPermitApproverLists.value = newPermitDetailsModel.value?.approvedByName ?? '';
      // // listEmployee?.value = newPermitDetailsModel.value?.lstEmp ?? [];
      // // safetyList?.value = newPermitDetailsModel.value?.safety_question_list ?? [];
      // // // print('EmployeeList:${listEmployee}');
      
      
      

        }
    
        
    
  }

   Future<void> printScreen() async {
    try {
      final RenderRepaintBoundary boundary =
          printKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final imageBytes = await boundary
          .toImage(pixelRatio: 3.0)
          .then((image) => image.toByteData(format: ImageByteFormat.png));

      if (imageBytes != null) {
        Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
          final doc = pw.Document();
          doc.addPage(
            pw.Page(
              build: (pw.Context context) {
                return pw.Image(
                    pw.MemoryImage(imageBytes.buffer.asUint8List()));
              },
            ),
          );
          return doc.save();
        });
      }
    } catch (e) {
      print('Error printing: $e');
    }
  }

 

  // void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
  //   selectedEquipmentCategoryIdList.value = <int>[];
  //   for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
  //     selectedEquipmentCategoryIdList.add(_selectedCategoryId);
  //   }
  // }

  // void equipmentSelected(_selectedEquipmentIds) {
  //   // selectedEquipmentIdList.value = <int>[];
  //   // for (var _selectedEquipmentNameId in _selectedEquipmentIds) {
  //   //   selectedEquipmentIdList.add(_selectedEquipmentNameId);
  //   // }
  // }

  // Future<void> getInventoryCategoryList({String? facilityId}) async {
  //   equipmentCategoryList.value = <InventoryCategoryModel>[];
  //   final _equipmentCategoryList = await warrantyClaimPresenter.getInventoryCategoryList(
  //     isLoading: true,
  //   );

  //   if (_equipmentCategoryList != null) {
  //     for (var equimentCategory in _equipmentCategoryList) {
  //       equipmentCategoryList.add(equimentCategory);
  //     }
  //   }
  // }

  

  // void getInventoryList() async {
  //   eqipmentNameList.value = <InventoryModel>[];
  //   final _inventoryList = await warrantyClaimPresenter.getInventoryList(
  //     isLoading: true,
  //     categoryIds: categoryIds,
  //     facilityId: facilityId,
  //   );
  //   //  print('equipment Name List:$inventoryNameList');
  //   for (var inventory_list in _inventoryList) {
  //     eqipmentNameList.add(inventory_list);
  //   }
  //   inventoryList = _inventoryList;
  //   paginationController = PaginationController(
  //     rowCount: eqipmentNameList.length,
  //     rowsPerPage: 10,
  //   );
  //   update(['inventory_list']);
  // }

  // void getBusinessList() async {
  //   supplierNameList.value = <BusinessListModel>[];
  //   final _supplierNameList = await warrantyClaimPresenter.getBusinessList(
  //     isLoading: true,
  //     //  categoryIds: categoryIds,
  //     businessType: 5,
  //   );
  //   //  print('Supplier Name List:$supplierNameList');
  //   for (var supplier_list in _supplierNameList) {
  //     supplierNameList.add(supplier_list);
  //   }
  //   // supplierNameList = _supplierNameList;
  //   // paginationBusinessListController = PaginationController(
  //   //   rowCount: supplierNameList.length,
  //   //   rowsPerPage: 10,
  //   // );
  //   update(['business_list']);
  // }

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

  // void getWarrantyClaimList() async {
  //   // supplierNameList.value = <WarrantyClaimModel>[];

  //   final list = await warrantyClaimPresenter.getWarrantyClaimList(
  //       isLoading: true, categoryIds: categoryIds, facilityId: facilityId);
  //   print('Supplier Name List:$supplierNameList');
  //   Set<String> supplierNameSet = {};
  //   for (var _supplierNameList in list) {
  //     if (_supplierNameList.supplier_name != null) {
  //       supplierNameSet.add(_supplierNameList.supplier_name ?? "");
  //     }
  //   }
  //   warrantyClaimList = list;
  //   paginationWarrantyController = PaginationController(
  //     rowCount: warrantyClaimList.length,
  //     rowsPerPage: 10,
  //   );
  //   update(['warranty_claim_list']);
  // }

  // void getBlockList(String facilityId) async {
  //   final list = await warrantyClaimPresenter.getBlockList(
  //       isLoading: false, facilityId: facilityId);
  //   blockList = list;
  //   update(['block_list']);
  // }

  // void getEquipmentList({
  //   required String facilityId,
  // }) async {
  //   final list = await warrantyClaimPresenter.getEquipmentList(
  //     isLoading: false,
  //     facilityId: facilityId,
  //   );
  //   equipmentList = list;
  //   update(['equipment_list']);
  // }

  // void onSelectEquipment(EquipmentModel equipment) {
  //   selectedEquipment = equipment;
  //   parentEquipmentTextController.text = selectedEquipment.name ?? '';

  //   update(['equipment_list']);
  // }

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

}
