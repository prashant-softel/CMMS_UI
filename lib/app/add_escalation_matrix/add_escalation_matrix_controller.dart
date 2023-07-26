import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/create_escalation_matrix_model.dart';
import 'package:cmms/domain/models/create_warranty_claim_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class AddEscalationMatrixController extends GetxController {
  AddEscalationMatrixController(this.viewIncidentReportPresenter);
  AddEscalationMatrixPresenter viewIncidentReportPresenter;

  final HomeController homeController = Get.find();

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;

  final TextEditingController supplierActionTextFieldController =
      TextEditingController();
  final TextEditingController supplierActionSrNumberTextFieldController =
      TextEditingController();

  RxList<int> dayList = <int>[].obs;
 ///Checkbox
  ////
  // RxBool isCheckedRequire = false.obs;
  // RxBool isCheckedDataRequire = false.obs;

  // void requireToggleCheckbox() {
  //   isCheckedRequire.value = !isCheckedRequire.value;
  //   isCheckedDataRequire.value = isCheckedRequire.value;
  //   print('Checkbox value ${isCheckedRequire.value}');
  //   print(
  //       'Checkbox Data value ${isCheckedDataRequire.value}'); // Toggle the checkbox state
  //   // Toggle the checkbox state
  // }

  ///Status Escalation Part
  var status_Escalation = <Status_escalation>[].obs;
  void addStatusEscalationData(
    int status_id,
  ) {
    status_Escalation.value = [];
    status_Escalation.add(Status_escalation(
      status_id: status_id,
      escalation: escalationa
    ));
  }

  var escalationa = <Escalation>[].obs;
  void addEscalationData(
    int? days,
    int? role_id,
    
  ) {
    escalationa.add(Escalation(
      days: int.tryParse('${durationDaysTextCtrlr.text}'),
      role_id: selectedRoleListId
    ));
  }


  ///Print Global key
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();



Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
      Map<String, GetAssetDataModel> dropdownMapperData = {};
  Map<String, PaiedModel> paiddropdownMapperData = {};
  
      void addRowItem() {
    rowItem.value.add([
      {"key": "Duration (Days)", "value": 'Please Select'},
      {'key': "Escalation Roles and Levels", "value": 'Please Select'},
     
    ]);
  }

  ///Checkbox
  ////
  // RxBool isCheckedRequire = false.obs;
  // RxBool isCheckedDataRequire = false.obs;

  // void requireToggleCheckbox() {
  //   isCheckedRequire.value = !isCheckedRequire.value;
  //   isCheckedDataRequire.value = isCheckedRequire.value;
  //   print('Checkbox value ${isCheckedRequire.value}');
  //   print(
  //       'Checkbox Data value ${isCheckedDataRequire.value}'); // Toggle the checkbox state
  //   // Toggle the checkbox state
  // }
  ///Module List
  
   RxList<ModuleListModel?> moduleList = <ModuleListModel>[].obs;
  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  int? selectedModuleListId = 0;
  int type = 1;

  ///Permit Type
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  int selectedTypePermitId = 0;
  Rx<bool> isTypePermit = true.obs;
  Rx<String> selectedStartDate = ''.obs;
  Rx<bool> isStartdate = true.obs;
  Rx<bool> isEnddate = true.obs;

  final TextEditingController serialNoTextFieldController =
      TextEditingController();
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController emailTextFieldController =
      TextEditingController();

  //   ///Failure Date Time For Web
  // var failureDateTimeCtrlrWeb = TextEditingController();
  // var failureDateTimeCtrlrWebBuffer;
  // Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  ///Incident Date Time For Web
  var incidentDateTimeCtrlrWeb = TextEditingController();
  var incidentReportListDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedIncidentReportListDateTimeWeb = DateTime.now().obs;

  ///Action Taken Date & Time
  var actionTakenDateTimeCtrlrWeb = TextEditingController();

  ///Reporting Date & Time
  var reportingDateTimeCtrlrWeb = TextEditingController();

//Incident Report List
  var incidentReportList = <IncidentReportListModel>[];

  ///Incident Report Details
  Rx<IncidentReportDetailsModel?> incidentReportDetailsModel =
      IncidentReportDetailsModel().obs;
  RxList<IncidentReportDetailsModel?>? incidentReportDetailsList =
      <IncidentReportDetailsModel?>[].obs;

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
  RxList<IncidentReportListModel?> incidentReportModelList =
      <IncidentReportListModel>[].obs;

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
  PaginationController paginationIncidentReportController =
      PaginationController(
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

  ///duration in days
  Rx<bool> isDurationDaysTextInvalid = false.obs;
  var durationDaysTextCtrlr = TextEditingController();

  // ///Gen Loss Due To Asset Loss
  // Rx<bool> isGenLossAssetDamageTextInvalid = false.obs;
  // var genLossAssetDamageTextCtrlr = TextEditingController();

  // ///Gen Loss Due To Asset Loss
  // Rx<bool> isInsuranceRemarkTextInvalid = false.obs;
  // var insuranceRemarkTextCtrlr = TextEditingController();


 RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = ''.obs;
  Rx<bool> isSelectedRole = true.obs;
  int? selectedRoleListId = 0;
  

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
  int? id = 0;
  @override
  void onInit() async {
    id = Get.arguments;
    print('EscalationMatrix_Id:$id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getuserAccessData();
    });
    Future.delayed(Duration(seconds: 1), () {
      getTypePermitList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getModuleList(facilityId, type, true);
    });
    Future.delayed(Duration(seconds: 1), () {
      getRoleList();
    });
    // await getIncidentReportHistory(id: id!);

    super.onInit();
  }

 
  Future<void> getFacilityList() async {
    final _facilityList = await viewIncidentReportPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getRoleList() async {
    final list = await viewIncidentReportPresenter.getRoleList();

    if (list != null) {
      for (var _roleList in list) {
        roleList.add(_roleList);
      }
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList =
        await viewIncidentReportPresenter.getTypePermitList(facility_id: 45);

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  Future<void> getModuleList(
      int facilityId, int type, bool isLoading)
  async {
    moduleList.value = <ModuleListModel>[];
    final _moduleList =
        await viewIncidentReportPresenter.getModuleList(
            facilityId: facilityId, type: type, isLoading: isLoading);

    if (_moduleList != null) {
      moduleList.value = _moduleList;
      // paginationController = PaginationController(
      //   rowCount: moduleList?.length ?? 0,
      //   rowsPerPage: 10,
      // );

      // if (moduleList != null && moduleList!.isNotEmpty) {
      //   moduleListModel = moduleList![0];
      //   var preventiveCheckListJson = moduleListModel?.toJson();
      //   moduleListTableColumns.value = <String>[];
      //   for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
      //     moduleListTableColumns.add(key);
      //   }
      // }
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList =
        await viewIncidentReportPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
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
        case RxList<ModuleListModel>:
        {
          int moduleListIndex = moduleList.indexWhere((x) => x?.name == value);
          selectedModuleListId = moduleList[moduleListIndex]?.id ?? 0;
          print('Module List Id: $selectedModuleListId');

          
        }
        break;
        case RxList<RoleModel>:
        {
          int roleModelListIndex = roleList.indexWhere((x) => x?.name == value);
          selectedRoleListId = roleList[roleModelListIndex]?.id ?? 0;
          print('Role List Id: $selectedRoleListId');

          
        }
        break;
         case RxList<TypePermitModel>:
        {
          int prmitTypeIndex = typePermitList.indexWhere((x) => x?.name == value);
          selectedTypePermitId = typePermitList[prmitTypeIndex]?.id ?? 0;
          print('Type Permit Id: $selectedTypePermitId');

          
        }
        break;

      default:
        {
          //statements;
        }
        break;
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

  //   void checkForm() {
  //   if (selectedBlock.value == '') {
  //     isBlockSelected.value = false;
  //   }
  //   if (selectedEquipmentName.value == '') {
  //     isEquipmentNameSelected.value = false;
  //   }
  //   if (startDateTimeCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Incident Date & Time Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (reportingDateTimeCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Reporting Date & Time Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (selectedVictimNameList.value == '') {
  //     isVictimNameListSelected.value = false;
  //   }
  //   if (actionTakenDateTimeCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Action Taken By Date & Time Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (selectedAssetRestorationActionTakenByList.value == '') {
  //     isAssetRestorationActionTakenByListSelected.value = false;
  //   }
  //   if (selectedIncidentInvestigationVerificationDoneByList.value == '') {
  //     isincidentInvestigationVerificationDoneByListSelected.value = false;
  //   }
  //   if (damagedAssetCostTextCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Damaged cost Field cannot be empty', timeInSecForIosWeb: 5);
  //   }
  //   if (genLossAssetDamageTextCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Generation Loss Field cannot be empty', timeInSecForIosWeb: 5);
  //   }
  //   if (titleTextCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Title Field cannot be empty', timeInSecForIosWeb: 5);
  //   }
  //   if (incidentreportDescriptionCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Incident Description Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (insuranceAvailableTextCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Insurance Available Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (insuranceRemarkTextCtrlr.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Insurance Remark Field cannot be empty', timeInSecForIosWeb: 5);
  //   }
  //   // if (immediateCorrectiveActionTextController.text == '') {
  //   //   Fluttertoast.showToast(
  //   //       msg: 'Corrective Action Field cannot be empty',
  //   //       timeInSecForIosWeb: 5);
  //   // }
  //   // if (requestManufactureTextController.text == '') {
  //   //   Fluttertoast.showToast(
  //   //       msg: 'Request Field cannot be empty', timeInSecForIosWeb: 5);
  //   // }
  //   if (isBlockSelected.value == false ||
  //       isEquipmentNameSelected.value == false ||
  //       isVictimNameListSelected.value == false ||
  //       isAssetRestorationActionTakenByListSelected.value == false ||
  //       isincidentInvestigationDoneByListSelected.value == false ||
  //       isincidentInvestigationVerificationDoneByListSelected.value == false) {
  //     isFormInvalid.value = true;
  //   } else {
  //     isFormInvalid.value = false;
  //   }
  // }

  ///Create Escalation Matrix
  void createEscalationMatrix() async {
    {
      // checkForm();
      // if (isFormInvalid.value) {
      //   return;
      // }
      String _days = htmlEscape.convert(durationDaysTextCtrlr.text.trim());
      // String _incidentDescription =
      //     htmlEscape.convert(incidentreportDescriptionCtrlr.text.trim());
      // String _insuranceRemark =
      //     htmlEscape.convert(insuranceRemarkTextCtrlr.text.trim());
      // String _insuranceAvailable =
      //     htmlEscape.convert(insuranceAvailableTextCtrlr.text.trim());
      // // String _costOfReplacement =
      // //     htmlEscape.convert(costOfReplacementTextController.text.trim());
      // String _orderReferenceNo =
      //     htmlEscape.convert(orderReferenceNoTextController.text.trim());
      // String _affectedSerialNo =
      //     htmlEscape.convert(affectedSerialNoTextController.text.trim());

      // int costOfReplacement =
      //     int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');
      // late List<ExternalEmails> external_emails_list = [];

      // externalEmails.forEach((e) {
      //   external_emails_list.add(ExternalEmails(name: e.name, email: e.email));
      // });
      rowItem.value.forEach((element) { 
        Escalation days = Escalation(
          days: int.tryParse(element[0]["value"] ?? '0'),
        );
      });

      

      late List<Status_escalation> status_escalation = [];

      status_Escalation.forEach((e) {
        status_escalation.add(Status_escalation(
          status_id: e.status_id,
          escalation: e.escalation
          // is_required: e.is_required
        ));
      });

      CreateEscalationMatrixModel createEscalationMatrixModel =
          CreateEscalationMatrixModel(
            
        // module_id: 2,
        // status_escalation: [
            
        //         status_id: 101,
        //         escalation: [
        //             {
        //                 "days": 1,
        //                 "role_id": 6
        //             },
        //             {
        //                 "days": 2,
        //                 "role_id": 5
        //             },
        //             {
        //                 "days": 3,
        //                 "role_id": 4
        //             },
        //             {
        //                 "days": 4,
        //                 "role_id": 3
        //             },
        //             {
        //                 "days": 5,
        //                 "role_id": 2
        //             },
        //             {
        //                 "days": 6,
        //                 "role_id": 1
        //             }
        //         ]
        //     ,
        //     {
        //         status_id: 102,
        //         escalation: [
        //             {
        //                 "days": 1,
        //                 "role_id": 7
        //             },
        //             {
        //                 "days": 5,
        //                 "role_id": 4
        //             },
        //             {
        //                 "days": 10,
        //                 "role_id": 1
        //             }
        //         ]
        //     },
        //     {
        //         status_id: 103,
        //         escalation: [
        //             {
        //                 "days": 1,
        //                 "role_id": 7
        //             },
        //             {
        //                 "days": 2,
        //                 "role_id": 6
        //             },
        //             {
        //                 "days": 4,
        //                 "role_id": 5
        //             },
        //             {
        //                 "days": 12,
        //                 "role_id": 2
        //             },
        //             {
        //                 "days": 15,
        //                 "role_id": 1
        //             }
        //         ]
        //     }
        // ]
        
             
          );
          
          
             
      var escalationMatrixJsonString = [
      {
        "module_id": selectedModuleListId,
        "status_escalation": status_escalation
        //  [
        //   {
        //     "status_id": 101,
        //     "escalation": [
        //       {
        //         "days": int.tryParse('${_days}'),
        //         "role_id": selectedRoleListId
        //       }
        //     ]
        //   }
        // ]
        
    }];
      Map<String, dynamic>? responseCreateEscalationMatrix =
          await viewIncidentReportPresenter.createEscalationMatrix(
        createEscalationMatrix: escalationMatrixJsonString,
        isLoading: true,
      );

      if (responseCreateEscalationMatrix == null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create Escalation Matrix data: $escalationMatrixJsonString');
    }
  }

  Future<void> editIncidentReport({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }
}
