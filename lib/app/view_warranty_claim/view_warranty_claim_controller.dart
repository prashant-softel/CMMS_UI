import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/view_warranty_claim/view_warranty_claim_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];
  var equipmentList = <EquipmentModel>[];

////TextEditing controller
  final currenttimeController = TextEditingController();
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
  RxList<ExternalsEmailsList?>? externalEmailsList =
      <ExternalsEmailsList?>[].obs;
  RxList<AdditionalEmailsEmployeesList?>? additionalEmailEmployees =
      <AdditionalEmailsEmployeesList?>[].obs;
  RxList<AffectedParts?>? affectedParts = <AffectedParts?>[].obs;

  ///Supplier ACtion
  RxList<SuppliersActionsList?>? supplierActionsList =
      <SuppliersActionsList?>[].obs;

  ///View Warranty Claim Details
  Rx<ViewWarrantyClaimModel?> viewWarrantyClaimDetailsModel =
      ViewWarrantyClaimModel().obs;
  RxList<ViewWarrantyClaimModel?>? viewWarrantyClaimDetailsList =
      <ViewWarrantyClaimModel?>[].obs;

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
    print('WC_Id:$wc_id');

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getuserAccessData();
    });

    if (wc_id != null) {
      Future.delayed(Duration(seconds: 1), () {
        getViewWarrantyClaimDetail(wc_id: wc_id!, facilityId: facilityId);

      });
    }

    Future.delayed(Duration(seconds: 1), () {
      getWarrantyClaimHistory(id: wc_id!);
    });

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

  Future<void> getWarrantyClaimHistory({required int id}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 121;
    // int tempModuleType = 21;
    int id = wc_id!;
    //
    historyList?.value =
        await viewWarrantyClaimPresenter.getWarrantyClaimHistory(
              // tempModuleType,
              // tempJobCardId,
              moduleType,
              id,
              true,
            ) ??
            [];
    update(["historyList"]);
  }

  Future<void> getuserAccessData() async {
    final _userAccessList =
        await viewWarrantyClaimPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

  Future<void> getViewWarrantyClaimDetail({required int wc_id, required int facilityId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    viewWarrantyClaimDetailsList?.value = <ViewWarrantyClaimModel>[];

    final _viewWarrantyClaimDetails = await viewWarrantyClaimPresenter
        .getViewWarrantyClaimDetail(wc_id: wc_id, facilityId: facilityId);
    print('New Warranty Claim Detail:$_viewWarrantyClaimDetails');

    if (_viewWarrantyClaimDetails != null) {
      viewWarrantyClaimDetailsModel.value = _viewWarrantyClaimDetails;
      // listEmployee?.value = viewPermitDetailsModel.value?.employee_list ?? [];
      // safetyList?.value = viewPermitDetailsModel.value?.safety_question_list ?? [];
      // listCategory?.value = viewPermitDetailsModel.value?.lstCategory ?? [];
      // listLoto?.value = viewPermitDetailsModel.value?.loto_list ?? [];
      categoryTextController.text =
          viewWarrantyClaimDetailsModel.value?.equipment_category ?? '';
      equipmentNameTextController.text =
          viewWarrantyClaimDetailsModel.value?.equipment_name ?? '';
      supplierNameTextController.text =
          viewWarrantyClaimDetailsModel.value?.supplier_name ?? '';
      equipmentSerialNoTextController.text =
          viewWarrantyClaimDetailsModel.value?.equipment_sr_no ?? '';
      orderReferenceNoTextController.text =
          viewWarrantyClaimDetailsModel.value?.order_reference_number ?? '';
      failureDateTimeTextController.text =
          '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewWarrantyClaimDetailsModel.value?.failure_time}'))}';
      costOfReplacementTextController.text =
          viewWarrantyClaimDetailsModel.value?.cost_of_replacement ?? '';
      // warrantyStartDateTextController.text = '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${viewWarrantyClaimDetailsModel.value?.date_of_claim ?? ''}'))}';
      warrantyClaimTitleTextController.text =
          viewWarrantyClaimDetailsModel.value?.warranty_claim_title ?? '';
      warrantyBriefDescriptionTextController.text =
          viewWarrantyClaimDetailsModel.value?.warranty_description ?? '';
      correctiveActionByBuyerTextController.text =
          viewWarrantyClaimDetailsModel.value?.corrective_action_by_buyer ?? '';
      requestToSupplierTextController.text =
          viewWarrantyClaimDetailsModel.value?.request_to_supplier ?? '';
      approverNametextController.text =
          viewWarrantyClaimDetailsModel.value?.approver_name ?? '';
      additionalEmailEmployees?.value =
          viewWarrantyClaimDetailsModel.value?.additionalEmailEmployees ?? [];
      supplierActionsList?.value =
          viewWarrantyClaimDetailsModel.value?.supplierActions ?? [];
    }
  }

  void wcApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentWCAproveModel =
          CommentModel(id: id, comment: _comment);

      var WCApproveJsonString = commentWCAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewWarrantyClaimPresenter.wcApprovedButton(
        WCApproveJsonString: WCApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
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
          await viewWarrantyClaimPresenter.wcRejectdButton(
        WCRejectJsonString: WCRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void onSelectBlock(BlockModel block) {
    selectedBlock = block;
    blockTextController.text = selectedBlock.name ?? '';

    update(['block_field']);
  }

  void onValueChanged(dynamic list, dynamic value) {
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
          if (value != "Please Select") {
            for (var workAreaName in selectedWorkAreaNameList) {
              int workAreaIndex =
                  workAreaList.indexWhere((x) => x?.name == workAreaName);
              selectedWorkAreaIdList.add(workAreaIndex);
            }
          } else {
            // selectedWorkAreaIdList=0;
          }
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
          if (value != "Please Select") {
            for (var unitCurrency in selectedUnitCurrencyList) {
              int unitCurrencyIndex =
                  unitCurrencyList.indexWhere((x) => x?.code == unitCurrency);
              selectedUnitCurrencyIdList.add(unitCurrencyIndex);
            }
          } else {
            //  selectedUnitCurrencyIdList=0;
          }
        }
        break;
      case const (RxList<EmployeeListModel>):
        {
          if (value != "Please Select") {
            for (var employeeDataList in selectedEmployeeDataList) {
              int employeeListIndex =
                  employeeList.indexWhere((x) => x.name == employeeDataList);
              selectedEmployeeIdList.add(employeeListIndex);
            }
          } else {
            // selectedEmployeeIdList=0;
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
