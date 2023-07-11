import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/add_incident_report.dart/add_incident_report_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddIncidentReportController extends GetxController {
  AddIncidentReportController(this.incidentReportPresenter);
  AddIncidentReportPresenter incidentReportPresenter;

  final HomeController homeController = Get.find();

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;

  // void addRow(String rowData) {
  //   rowList.add(rowData);
  //   // rowList2.add(rowData);
  //   // rowList3.add(rowData);

  // }

  
  final TextEditingController supplierActionTextFieldController =
      TextEditingController();
  final TextEditingController supplierActionSrNumberTextFieldController =
      TextEditingController();

 

  
///Permit Type
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  Rx<String> selectedStartDate = ''.obs;
  Rx<bool> isStartdate = true.obs;
  Rx<bool> isEnddate = true.obs;

  final TextEditingController serialNoTextFieldController =
      TextEditingController();
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController emailTextFieldController =
      TextEditingController();

  ///Failure Date Time For Web
  var failureDateTimeCtrlrWeb = TextEditingController();
  var failureDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  ///Incident Report List Date Time For Web
  var incidentReportListDateTimeCtrlrWeb = TextEditingController();
  var incidentReportListDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedIncidentReportListDateTimeWeb = DateTime.now().obs;

 
//Incident Report List
  var incidentReportList = <IncidentReportListModel>[];
  
 
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

  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();

///Incident Report List
  RxList<IncidentReportListModel?> incidentReportModelList = <IncidentReportListModel>[].obs;


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
  PaginationController paginationIncidentReportController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///Plant Name
  RxList<FacilityModel?> facilityPlantList = <FacilityModel>[].obs;
  Rx<bool> isFacilityPlantSelected = true.obs;
  Rx<String> selectedPlantFacility = ''.obs;


  ///Equipment name List
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedEquipmentName = ''.obs;
  Rx<bool> isEquipmentNameSelected = true.obs;
  int selectedEquipmentnameId = 0;



   var startDateTimeCtrlr = TextEditingController();
  var validTillTimeCtrlr = TextEditingController();
  var validTillTimeCtrlrBuffer;
  var startDateTimeCtrlrBuffer;

  var incidentreportDescriptionCtrlr = TextEditingController();
  var titleTextCtrlr = TextEditingController();
  
  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;
  Rx<bool> isTitleTextInvalid = false.obs;

  Rx<bool> isVictimNameTextInvalid = false.obs;
  var victimNameTextCtrlr = TextEditingController();

  ///damaged Asset Cost
  Rx<bool> isDamagedAssetCostTextInvalid = false.obs;
  var damagedAssetCostTextCtrlr = TextEditingController();

   ///Gen Loss Due To Asset Loss
  Rx<bool> isGenLossAssetDamageTextInvalid = false.obs;
  var genLossAssetDamageTextCtrlr = TextEditingController();

     ///Gen Loss Due To Asset Loss
  Rx<bool> isInsuranceRemarkTextInvalid = false.obs;
  var insuranceRemarkTextCtrlr = TextEditingController();




  ///Incident Reporting date Time
  var actionTakenDateTimeCtrlr = TextEditingController();
  Rx<DateTime> selectedActionTakenTime = DateTime.now().obs;


  ///For Switch case
  RxBool switchValue = false.obs;
  RxBool switchValue2 = false.obs;
  RxBool switchValue3 = false.obs;
  RxBool switchValue4 = false.obs;




  



  // PaginationController paginationBusinessListController = PaginationController(
  //   rowCount: 0,
  //   rowsPerPage: 10,
  // );
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;
 
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;


  

  ///
// int? wc_id = 0;
  @override
  void onInit() async {
    // wc_id = Get.arguments;
    // print('WC_Id:$wc_id');
     facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
       Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    });

   
    Future.delayed(Duration(seconds: 1), () {
      getFacilityPlantList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getuserAccessData();
    });
     Future.delayed(Duration(seconds: 1), () {
      getTypePermitList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
    });
    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await incidentReportPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

   Future<void> getFacilityPlantList() async {
    final _facilityPlantList = await incidentReportPresenter.getFacilityPlantList();
    //print('Facility25:$_facilityList');
    if (_facilityPlantList != null) {
      for (var facility in _facilityPlantList) {
        facilityPlantList.add(facility);
      }

      // selectedPlantFacility.value = facilityPlantList[0]?.name ?? '';
      _facilityId.sink.add(facilityPlantList[0]?.id ?? 0);
    }
  }


   Future<void> getTypePermitList() async {
    final _permitTypeList = await incidentReportPresenter.getTypePermitList(
      facility_id: 45
    );

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await incidentReportPresenter.getInventoryList(
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

 
  Future<void> getuserAccessData() async {
    final _userAccessList = await incidentReportPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

  
  void getIncidentReportList() async {
    incidentReportModelList.value = <IncidentReportListModel>[];

    final list = await incidentReportPresenter.getIncidentReportList(
        isLoading: true, 
        start_date: '2020-01-01',
        end_date: '2023-12-31',
        facility_id: facilityId
        );
        print('incidentReportFacilityId$facilityId');
    print('Incident Report List:$list');
    for (var incident_list in list) {
      incidentReportModelList.add(incident_list);
    }
    incidentReportList = list;
    paginationIncidentReportController = PaginationController(
      rowCount: incidentReportList.length,
      rowsPerPage: 10,
    );
    update(['incident_report_list']);
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
      // case RxList<InventoryModel>:
      //   {
      //     // for (var workAreaName in selectedWorkAreaNameList) {
      //     int equipmentNameIndex =
      //         eqipmentNameList.indexWhere((x) => x?.name == value);
      //     selectedEquipmentnameId =
      //         eqipmentNameList[equipmentNameIndex]?.id ?? 0;
      //     getInventoryDetail();

      //     if (selectedEquipmentnameId > 0) {
      //       isEquipmentNameSelected.value = true;
      //     }
      //     selectedEquipmentName.value = value;

      //     print('Equipment name Id: $selectedEquipmentnameId');

      //     // }
      //   }
      //   break;
      // case RxList<InventoryCategoryModel2>:
      //   {
      //     // for (var workAreaName in selectedWorkAreaNameList) {
      //     int affectedPartIndex =
      //         affectedPartEqipmentNameList.indexWhere((x) => x?.name == value);
      //     selectedAffectedPartId =
      //         affectedPartEqipmentNameList[affectedPartIndex]?.id ?? 0;
      //     selectedAffectedPartName =
      //         affectedPartEqipmentNameList[affectedPartIndex]?.name ?? '';

      //     if (selectedAffectedPartId > 0) {
      //       isAffectedPartSelected.value = true;
      //     }
      //     selectedAffectedPart.value = value;
      //     print('Affected part Id: $selectedAffectedPartId');
      //     print('Affected part name : $selectedAffectedPartName');

      //     // }
      //   }
      //   break;
      // case RxList<BusinessListModel>:
      //   {
      //     for (var supplierName in selectedSupplierNameList) {
      //       int supplierNameIndex =
      //           supplierNameList.indexWhere((x) => x?.name == supplierName);
      //       selectedSupplierNameIdList.add(supplierNameIndex);
      //     }
      //   }
      //   break;
      // case RxList<CurrencyListModel>:
      //   {
      //     // for (var unitCurrency in selectedUnitCurrencyList) {
      //     int unitCurrencyIndex =
      //         unitCurrencyList.indexWhere((x) => x?.name == value);
      //     selectedCurrencyId = unitCurrencyList[unitCurrencyIndex]?.id ?? 0;

      //     if (selectedCurrencyId > 0) {
      //       isUnitCurrencySelected.value = true;
      //     }
      //     selectedUnitCurrency.value = value;
      //     print('Unit Currency Id :$selectedCurrencyId');

      //     // }
      //   }
      //   break;
      // case RxList<EmployeeListModel>:
      //   {
      //     // for (var employeeDataList in selectedEmployeeDataList) {
      //     int employeeListIndex =
      //         employeeList.indexWhere((x) => x.name == value);
      //     selectedApproverId = employeeList[employeeListIndex].id ?? 0;

      //     if (selectedApproverId > 0) {
      //       isemployeeListSelected.value = true;
      //     }
      //     selectedEmployeeList.value = value;
      //     print('Approver Id: $selectedApproverId');

      //     // }
      //   }
      //   break;
      // case RxList<EmployeeListModel2>:
      //   {
      //     // for (var employeeDataList in selectedEmployeeDataList) {
      //     int employeesListIndex =
      //         employeesList.indexWhere((x) => x.name == value);
      //     selectedEmployeesId = employeesList[employeesListIndex].id ?? 0;

      //     // if (selectedApproverId > 0) {
      //     //   isemployeeListSelected.value = true;
      //     // }
      //     // selectedEmployeeList.value = value;
      //     print('Additional Email Employees Id: $selectedEmployeesId');

      //     // }
      //   }
      //   break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void checkForm() {
    // if (selectedEquipmentName.value == '') {
    //   isEquipmentNameSelected.value = false;
    // }
    // if (selectedAffectedPart.value == '') {
    //   isAffectedPartSelected.value = false;
    // }
    // if (selectedUnitCurrency.value == '') {
    //   isUnitCurrencySelected.value = false;
    // }
    // if (selectedEmployeeList.value == '') {
    //   isemployeeListSelected.value = false;
    // }

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
    // if (warrantyStartDateTimeCtrlrWebBuffer == null) {
    //   Fluttertoast.showToast(
    //       msg: 'Warranty Start Date Time Field cannot be empty',
    //       timeInSecForIosWeb: 5);
    // }
    // if (warrantyEndDateTimeCtrlrWebBuffer == null) {
    //   Fluttertoast.showToast(
    //       msg: 'Warranty End Date Time Field cannot be empty',
    //       timeInSecForIosWeb: 5);
    // }
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
    // if (isEquipmentNameSelected.value == false ||
    //     isAffectedPartSelected.value == false ||
    //     isUnitCurrencySelected.value == false ||
    //     isemployeeListSelected.value == false)
    //      {
    //   isFormInvalid.value = true;
    // } else {
    //   isFormInvalid.value = false;
    // }
  }

  ///Create Warranty Claim
  // void createWarrantyClaim() async {
  //   {
  //     checkForm();
  //     if (isFormInvalid.value) {
  //       return;
  //     }

  //     String _warrantyClaimTitle =
  //         htmlEscape.convert(warrantyClaimTitleTextController.text.trim());
  //     String _description =
  //         htmlEscape.convert(warrantyClaimBriefDescTextController.text.trim());
  //     String _immediateCorrectiveByBuyer = htmlEscape
  //         .convert(immediateCorrectiveActionTextController.text.trim());
  //     String _requestToBuyer =
  //         htmlEscape.convert(requestManufactureTextController.text.trim());
  //     // String _costOfReplacement =
  //     //     htmlEscape.convert(costOfReplacementTextController.text.trim());
  //     String _orderReferenceNo =
  //         htmlEscape.convert(orderReferenceNoTextController.text.trim());
  //     String _affectedSerialNo =
  //         htmlEscape.convert(affectedSerialNoTextController.text.trim());

  //     int costOfReplacement =
  //         int.parse(costOfReplacementTextController.text.trim());

  //     // int? sopFileId = createSOPModel2.sop_fileId;
  //     // // int? jsaFileId = data.jsa_fileId;
  //     // print('SOPFileId:$sopFileId');
  //     late List<ExternalEmails> external_emails_list = [];

  //     externalEmails.forEach((e) {
  //       external_emails_list.add(ExternalEmails(name: e.name, email: e.email));
  //     });

  //     late List<SupplierActions> supplier_action_list = [];

  //     supplierActions.forEach((e) {
  //       supplier_action_list.add(SupplierActions(
  //         name: e.name,
  //         required_by_date: e.required_by_date,
  //         // is_required: e.is_required
  //       ));
  //     });

  //     CreateWarrantyClaimModel createwarrantyClaimModel =
  //         CreateWarrantyClaimModel(
  //             facilityId: facilityId,
  //             equipmentId: selectedEquipmentnameId,
  //             goodsOrderId: 14205,
  //             affectedPart: selectedAffectedPartName,
  //             orderReference: _orderReferenceNo,
  //             affectedSrNo: _affectedSerialNo,
  //             costOfReplacement: costOfReplacement,
  //             currencyId: selectedCurrencyId,
  //             warrantyStartAt: warrantyStartDateTimeCtrlrWebBuffer,
  //             warrantyEndAt: warrantyEndDateTimeCtrlrWebBuffer,
  //             warrantyClaimTitle: _warrantyClaimTitle,
  //             warrantyDescription: _description,
  //             correctiveActionByBuyer: _immediateCorrectiveByBuyer,
  //             requestToSupplier: _requestToBuyer,
  //             approverId: selectedApproverId, //
  //             failureTime: failureDateTimeCtrlrWebBuffer,
  //             additionalEmailEmployees: selectedEmployeeNameIdList,
  //             externalEmails: external_emails_list,
  //             supplierActions: supplier_action_list,
  //             status: 1

  //             ///additional data to create WC as 'Submit for Release'

  //             );

  //     var warrantyClaimJsonString = [createwarrantyClaimModel.toJson()];
  //     Map<String, dynamic>? responseCreateWarrantyClaim =
  //         await warrantyClaimPresenter.createWarrantyClaim(
  //       createWarrantyClaim: warrantyClaimJsonString,
  //       isLoading: true,
  //     );

  //     if (responseCreateWarrantyClaim == null) {
  //       //  CreateNewPermitDialog();
  //       // showAlertDialog();
  //     }
  //     print('Create Warranty Claim data: $warrantyClaimJsonString');
  //   }
  // }

 
}
