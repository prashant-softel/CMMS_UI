import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';
import '../utils/save_file_web.dart';

class ViewIncidentReportController extends GetxController {
  ViewIncidentReportController(this.viewIncidentReportPresenter);
  ViewIncidentReportPresenter viewIncidentReportPresenter;

  final HomeController homeController = Get.find();

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;

  ///Print Global key
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  final TextEditingController supplierActionTextFieldController =
      TextEditingController();
  final TextEditingController supplierActionSrNumberTextFieldController =
      TextEditingController();

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

  ///Permit Type
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  Rx<String> selectedStartDate = ''.obs;
  Rx<bool> isStartdate = true.obs;
  Rx<bool> isEnddate = true.obs;
  RxBool detailInvestigationTeamValue = false.obs;
  RxBool whyWhyAnalysisValue = false.obs;
  RxList<FileList?>? file_list = <FileList>[].obs;

  final TextEditingController serialNoTextFieldController =
      TextEditingController();
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController emailTextFieldController =
      TextEditingController();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();

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

  ///Reject Incident Report Controller

  final TextEditingController rejectCommentTextFieldCtrlr =
      TextEditingController();

//Incident Report List
  // var incidentReportList = <IncidentReportListModel>[];

  ///Incident Report Details
  Rx<IncidentReportDetailsModel?> incidentReportDetailsModel =
      IncidentReportDetailsModel().obs;
  RxList<IncidentReportDetailsModel?>? incidentReportDetailsList =
      <IncidentReportDetailsModel?>[].obs;

  RxList<DetailsOfInjuredPersonUpdate?>? detailsOfInjuredPersonList =
      <DetailsOfInjuredPersonUpdate?>[].obs;

  RxList<DetailsOfOtherInjuredPersonUpdate?>? detailsOfOtherInjuredPersonList =
      <DetailsOfOtherInjuredPersonUpdate?>[].obs;
  RxList<WhyWhyAnalysisUpdate?>? whyWhyAnalysisList =
      <WhyWhyAnalysisUpdate?>[].obs;

  RxList<RootCauseUpdate?>? rootCauseList = <RootCauseUpdate?>[].obs;
  RxList<ImmediateCorrectionUpdate?>? immediateCorrectionList =
      <ImmediateCorrectionUpdate?>[].obs;
  RxList<ProposedActionPlanUpdate?>? proposedActionPlanList =
      <ProposedActionPlanUpdate?>[].obs;

  RxList<InvestigationTeamUpdate?>? investiagtionTeamList =
      <InvestigationTeamUpdate?>[].obs;

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

  ///Incident Report History
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

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
  Rx<int> irId = 0.obs;

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 1), () {
          getFacilityList();
        });
      });
      Future.delayed(Duration(seconds: 1), () {
        getIncidentReportDetail(id: irId.value);
        getIncidentReportHistory(ir: irId.value, facilityId: facilityId);
      });

      Future.delayed(Duration(seconds: 1), () {
        getuserAccessData();
      });
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _irId = await viewIncidentReportPresenter.getValue();
      if (_irId == null || _irId == '' || _irId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        irId.value = dataFromPreviousScreen['irId'];
        print("$irId.value");
        viewIncidentReportPresenter.saveValue(irId: irId.value.toString());
      } else {
        irId.value = int.tryParse(_irId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'userId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  // void onInit() async {
  //   irId = Get.arguments;
  //   print('IncidentReport_Id:$irId');
  //   facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
  //     facilityId = event;
  //     Future.delayed(Duration(seconds: 1), () {
  //       getFacilityList();
  //     });
  //   });

  //   if (irId != null) {
  //     Future.delayed(Duration(seconds: 1), () {
  //       getIncidentReportDetail(id: irId.value!);
  //     });
  //   }
  //   // Future.delayed(Duration(seconds: 1), () {
  //   //   getFacilityPlantList();
  //   // });
  //   Future.delayed(Duration(seconds: 1), () {
  //     getuserAccessData();
  //   });
  //   //  Future.delayed(Duration(seconds: 1), () {
  //   //   getTypePermitList();
  //   // });
  //   // Future.delayed(Duration(seconds: 1), () {
  //   //   getInventoryList();
  //   // });
  //   await getIncidentReportHistory(id: irId.value);

  //   super.onInit();
  // }

  Future<void> getIncidentReportDetail({required int id}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    incidentReportDetailsList?.value = <IncidentReportDetailsModel>[];

    final _incidentReportDetails =
        await viewIncidentReportPresenter.getIncidentReportDetail(id: id);
    print('Incident Report Detail:$_incidentReportDetails');

    if (_incidentReportDetails != null) {
      incidentReportDetailsModel.value = _incidentReportDetails;

      incidentDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.incident_datetime}'))}';
      actionTakenDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.action_taken_datetime}'))}';
      reportingDateTimeCtrlrWeb.text =
          '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse('${incidentReportDetailsModel.value?.reporting_datetime}'))}';
      detailInvestigationTeamValue.value =
          incidentReportDetailsModel.value?.is_investigation_required == 1
              ? true
              : false;
      whyWhyAnalysisValue.value =
          incidentReportDetailsModel.value?.is_why_why_required == 1
              ? true
              : false;

      ///New Data adding
      detailsOfInjuredPersonList?.value =
          incidentReportDetailsModel.value?.injured_person ?? [];
      detailsOfOtherInjuredPersonList?.value =
          incidentReportDetailsModel.value?.Otherinjured_person ?? [];
      whyWhyAnalysisList?.value =
          incidentReportDetailsModel.value?.why_why_analysis ?? [];
      rootCauseList?.value = incidentReportDetailsModel.value?.root_cause ?? [];
      immediateCorrectionList?.value =
          incidentReportDetailsModel.value?.immediate_correction ?? [];
      proposedActionPlanList?.value =
          incidentReportDetailsModel.value?.proposed_action_plan ?? [];
      investiagtionTeamList?.value =
          incidentReportDetailsModel.value?.investigation_team ?? [];
      file_list?.value = incidentReportDetailsModel.value?.fileList ?? [];
    }
  }
//other injured person

  void approveIncidentReportButton({int? id}) async {
    {
      checkform();
      if (isFormInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModelWithFlag approveIncidentReportAproveModel =
          CommentModelWithFlag(
              id: id,
              comment: _comment,
              is_investigation_required:
                  detailInvestigationTeamValue.value ? 1 : 0,
              is_why_why_required: whyWhyAnalysisValue.value ? 1 : 0);

      var incidentReportApproveJsonString =
          approveIncidentReportAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewIncidentReportPresenter.approveIncidentReportButton(
        incidentReportApproveJsonString: incidentReportApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void checkform() {
    if (approveCommentTextFieldCtrlr.text == '') {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  void approveIncidentReportButton2ndStep({int? id}) async {
    {
      checkform();
      if (isFormInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModelWithFlag approveIncidentReportAproveModel =
          CommentModelWithFlag(
              id: id,
              comment: _comment,
              is_investigation_required:
                  detailInvestigationTeamValue.value ? 1 : 0,
              is_why_why_required: whyWhyAnalysisValue.value ? 1 : 0);

      var incidentReportApproveJsonString =
          approveIncidentReportAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewIncidentReportPresenter.approveIncidentReportButton2ndStep(
        incidentReportApproveJsonString: incidentReportApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void approveIrButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel approveIncidentReportAproveModel = CommentModel(
        id: id,
        comment: _comment,
      );

      var incidentReportApproveJsonString =
          approveIncidentReportAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewIncidentReportPresenter.approveIrButton(
        incidentReportApproveJsonString: incidentReportApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void rejectIncidentReportButton({int? id}) async {
    {
      if(rejectCommentTextFieldCtrlr.text =='') {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentIncidentRejectModel =
          CommentModel(id: id, comment: _comment);

      var incidentReportRejectJsonString = commentIncidentRejectModel.toJson();

      Map<String, dynamic>? response =
          await viewIncidentReportPresenter.rejectIncidentReportButton(
        incidentReportRejectJsonString: incidentReportRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void rejectIrButton({int? id}) async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentIncidentRejectModel =
          CommentModel(id: id, comment: _comment);

      var incidentReportRejectJsonString = commentIncidentRejectModel.toJson();

      Map<String, dynamic>? response =
          await viewIncidentReportPresenter.rejectIrButton(
        incidentReportRejectJsonString: incidentReportRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  // Future<void> incidentReportRejectButton({String? id}) async {
  //   String _rejectComment = rejectCommentTextFieldCtrlr.text.trim();

  //   final _incidentReportRejectBtn =
  //       await viewIncidentReportPresenter.incidentReportRejectButton(
  //           comment: _rejectComment, id: '$id', isLoading: true);
  //   // showAlertPermitApproveDialog();
  //   print('Incident Report Reject Button Data:${_rejectComment}');
  //   print('Incident Report Reject Button Data:${id}');
  // }

  Future<void> getIncidentReportHistory(
      {required int ir, required int facilityId}) async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 131;
    // int tempModuleType = 21;
    int id = ir;
    //
    historyList?.value =
        await viewIncidentReportPresenter.getIncidentReportHistory(
              // tempModuleType,
              // tempJobCardId,
              moduleType,
              id,
              facilityId,
              true,
            ) ??
            [];
    update(["historyList"]);
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
      case const (RxList<FacilityModel>):
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> editIncidentReport({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }

  Future<void> generateInvoice() async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    //Draw rectangle
    // page.graphics.drawRectangle(
    //     bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
    //     pen: PdfPen(PdfColor(142, 170, 219)));
    //Generate PDF grid.
    //  final PdfGrid grid = getGrid();
    var url = "assets/assets/files/logo.png";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;

//Load image data into PDF bitmap object
    PdfBitmap image = PdfBitmap(data);

    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize, document, image);

    //Draw grid
    // drawGrid(page, grid, result);
    //Add invoice footer
    // drawFooter(page, pageSize);
    //Save the PDF document
    final List<int> bytes = await document.save();
    //Dispose the document.
    document.dispose();
    //Save and launch the file.
    await saveAndLaunchFile(bytes, 'incidentReport.pdf');
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    // document.pages
    //     .add()
    //     .graphics
    //     .drawImage(image, const Rect.fromLTWH(0, 0, 100, 80));
    page.graphics.drawImage(image, Rect.fromLTWH(0, 10, 100, 80));

    //Draw the image

    // page.graphics.drawImage(
    //     PdfBitmap(image),
    //     Rect.fromLTWH(20, 10, 50, 50));

    ///Table
    ///1
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 100, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 100, pageSize.width - 260, 25));
    //2
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 125, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 125, pageSize.width - 260, 25));

    //3
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 150, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 150, pageSize.width - 260, 25));

    //4
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 175, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 175, pageSize.width - 260, 25));

    //5
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 200, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 200, pageSize.width - 260, 25));

    //6
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 225, pageSize.width - 260, 40));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 225, pageSize.width - 260, 40));

    //7
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 265, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 265, pageSize.width - 260, 25));

    //8
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 290, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 290, pageSize.width - 260, 25));

    //9
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 315, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 315, pageSize.width - 260, 25));

    //10
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 340, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 340, pageSize.width - 260, 25));

    //11
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 365, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 365, pageSize.width - 260, 25));

    //12
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 390, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 390, pageSize.width - 260, 25));

    //13
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 415, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 415, pageSize.width - 260, 25));

    //14
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(0, 440, pageSize.width - 260, 25));
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(142, 180, 219)),
        bounds: Rect.fromLTWH(255, 440, pageSize.width - 260, 25));

    //1
    page.graphics.drawString(
        'Id: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 115, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.id}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(25, 115, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Title: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 115, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.title}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(290, 115, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //2
    page.graphics.drawString(
        'Plant: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 140, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.facility_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(40, 140, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Equipment Categories: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 140, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.equipment_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(370, 140, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //3
    page.graphics.drawString(
        'Block: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 165, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.block_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(40, 165, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Reporting Date & Time: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 165, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${reportingDateTimeCtrlrWeb.text}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(375, 165, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //4
    page.graphics.drawString(
        'Incident Date & Time: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 190, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentDateTimeCtrlrWeb.text}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(110, 190, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Incident Severity: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 190, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.severity}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(347, 190, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    //5
    page.graphics.drawString(
        'Incident Description: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 215, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.description}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(105, 215, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Action Taken Date & Time: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 215, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${actionTakenDateTimeCtrlrWeb.text}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(390, 215, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///6
    page.graphics.drawString(
        'Victim Name: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 240, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.victim_name}',
        // 'jhshjdgh',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(75, 240, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Incident Investigation Verification\ndone by: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 240, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.verified_by_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(310, 247, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///7
    page.graphics.drawString(
        'Incident Investigation Done By: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 280, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.inverstigated_by_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(150, 280, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'ESI Applicability: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 280, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.esi_applicability_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(345, 280, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///8
    page.graphics.drawString(
        'Risk Type: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 305, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.risk_type_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(70, 305, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'RCA Upload Required: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 305, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.rca_required_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(370, 305, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///9
    page.graphics.drawString(
        'Legal Applicability: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 325, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.legal_applicability_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(95, 325, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Gen loss due to asset damage: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(265, 325, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.generation_loss}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(410, 325, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///10
    page.graphics.drawString(
        'Damaged Assets cost approx.: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 350, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.damaged_cost}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(150, 350, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///11
    page.graphics.drawString(
        'Asset Restoration action taken by: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 375, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.action_taken_by_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(165, 375, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///12
    page.graphics.drawString(
        'Insurance Available: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 400, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.is_insurance_applicable_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(105, 400, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///13
    page.graphics.drawString(
        'Insurance Status: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 425, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.insurance_status_name}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(95, 425, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    ///14
    page.graphics.drawString(
        'Insurance Remarks: ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(10, 450, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        '${incidentReportDetailsModel.value?.insurance_remark}',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          10,
        ),
        bounds: Rect.fromLTWH(105, 450, 0, 0),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Draw string

    final String invoiceNumber = '';
    final Size contentSize = contentFont.measureString(invoiceNumber);
    // ignore: leading_newlines_in_multiline_strings

    return PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(400, 740,
            pageSize.width - (contentSize.width + 30), pageSize.height - 120))!;

    /////1

    //Draw rectangle
    // page.graphics.drawRectangle(
    //     brush: PdfSolidBrush(PdfColor(91, 126, 215)),
    //     bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90));
    //Draw string
    // page.graphics.drawString(
    //     'INVOICE', PdfStandardFont(PdfFontFamily.helvetica, 30),
    //     brush: PdfBrushes.white,
    //     bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
    //     format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    // page.graphics.drawRectangle(
    //     bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
    //     brush: PdfSolidBrush(PdfColor(65, 104, 205)));

    // page.graphics.drawString(r'viewPermitDetailsModel.value?.siteName ',
    //     PdfStandardFont(PdfFontFamily.helvetica, 18),
    //     bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 100),
    //     brush: PdfBrushes.white,
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.middle));

    //final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Draw string
    // page.graphics.drawString('Amount', contentFont,
    //     brush: PdfBrushes.white,
    //     bounds: Rect.fromLTWH(0, 0, pageSize.width - 400, 33),
    //     format: PdfStringFormat(
    //         alignment: PdfTextAlignment.center,
    //         lineAlignment: PdfVerticalAlignment.bottom));
    //Create data foramt and convert it to text.
    // final DateFormat format = DateFormat.yMMMMd('en_US');
    // final String invoiceNumber =
    //     'Invoice Number: 2058557939\r\n\r\nDate: ${format.format(DateTime.now())}';
    // ignore: leading_newlines_in_multiline_strings
//     String text =
//         '''This permit is valid only when issued Et approved by an authorized issuer.This permit must be obtained before a specified\r\nwork is started Et it must be closed immediately after completion of the work or at the end of the shift as agreed by ther\r\nparties identified on this permit. Refer PTW SOP(hyperlink).
//  \r\n\r\nPlant: ${viewPermitDetailsModel.value?.siteName ?? ""} Block:${viewPermitDetailsModel.value?.blockName ?? ""} Permit No.: ${viewPermitDetailsModel.value?.permitNo ?? ""}  ,

//         ''';
//     final Size contentSize = contentFont.measureString(text);

//     // PdfTextElement(text: invoiceNumber, font: contentFont).draw(
//     //     page: page,
//     //     bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
//     //         contentSize.width + 30, pageSize.height - 120));

//     return PdfTextElement(text: text, font: contentFont).draw(
//         page: page,
//         bounds: Rect.fromLTWH(
//             10, 30, contentSize.width + 30, pageSize.height - 120))!;
  }

  PdfGrid getGrid() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 8);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    //Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;
    headerRow.cells[0].value = 'Product Id';
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'Product Name';
    headerRow.cells[2].value = 'Price';
    headerRow.cells[3].value = 'Quantity';
    headerRow.cells[4].value = 'Quantity1';
    headerRow.cells[5].value = 'Quantity2';
    headerRow.cells[6].value = 'Quantity3';

    headerRow.cells[7].value = 'Total';
    //Add rows
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 2, 2, 2, 17.98, grid);
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 2, 2, 2, 17.98, grid);
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 2, 2, 2, 17.98, grid);
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 2, 2, 2, 17.98, grid);
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
    //Set gird columns width
    grid.columns[1].width = 200;
    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
      }
    }
    return grid;
  }

  void addProducts(
      String productId,
      String productName,
      double price,
      int quantity,
      int quantity1,
      int quantity2,
      int quantity3,
      double total,
      PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = productId;
    row.cells[1].value = productName;
    row.cells[2].value = price.toString();
    row.cells[3].value = quantity.toString();
    row.cells[4].value = quantity.toString();
    row.cells[5].value = quantity.toString();
    row.cells[6].value = quantity.toString();

    row.cells[7].value = total.toString();
  }
}
