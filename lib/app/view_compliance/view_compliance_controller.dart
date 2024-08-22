import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/Compliance_Status_model.dart';
import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/app/view_compliance/view_compliance_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ViewComplianceController extends GetxController {
  ///
  ViewComplianceController(
    this.viewCompliancePresenter,
  );
  ViewCompliancePresenter viewCompliancePresenter;

  final HomeController homeController = Get.find();
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  StreamSubscription<int>? facilityIdStreamSubscription;
  Stream<int> get facilityId$ => _facilityId.stream;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<StatutoryComplianceModel?> statutoryComplianceList =
      <StatutoryComplianceModel>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  Rx<GetStatutoryById?> getStatutoryById = GetStatutoryById().obs;
  Rx<bool> isStatutoryComplianceSelected = true.obs;
  Rx<String> selectedStatutoryCompliance = ''.obs;
  int selectedStatutoryComplianceId = 0;
  bool openIssueDatePicker = false;
  bool openExpireOnFDatePicker = false;
  Rx<bool> isIssueDateInvalid = false.obs;
  Rx<bool> isExpiresonInvalid = false.obs;
  RxBool isFormInvalid = false.obs;
  var issueDateTc = TextEditingController();
  var expireOnDateTc = TextEditingController();
  var commentsCtrl = TextEditingController();
  Rx<String> selectedStatusOfAplication = ''.obs;
  RxList<ComplianceStatusModel?> statusOfAplicationList =
      <ComplianceStatusModel>[].obs;

  int selectedStatusOfAplicationId = 0;
  Rx<bool> isStatusOfAplicationSelected = true.obs;
  int paidId = 0;
  int facilityId = 0;
  RxBool showAdditionalColumn = false.obs;
  Rx<int> srId = 0.obs;

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
      if (srId.value != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getStatutoryDetail(id: srId.value);
          getSRHistory(id: srId.value);
        });
      }
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _srId = await viewCompliancePresenter.getValue();
      if (_srId == null || _srId == '' || _srId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        srId.value = dataFromPreviousScreen['srId'];
        viewCompliancePresenter.saveValue(srId: srId.value.toString());
      } else {
        srId.value = int.tryParse(_srId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'srId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getStatutoryDetail({required int id}) async {
    final _getStatutoryDetail =
        await viewCompliancePresenter.getStatutoryDetail(id: id);
    print('Add Statutory Detail:$_getStatutoryDetail');

    if (_getStatutoryDetail != null) {
      getStatutoryById.value = _getStatutoryDetail;
      selectedStatutoryCompliance.value =
          getStatutoryById.value?.compilanceName ?? '';
      selectedStatusOfAplication.value =
          getStatutoryById.value?.status_of_application ?? '';

      issueDateTc.text = getStatutoryById.value?.created_at ?? '';
      expireOnDateTc.text = getStatutoryById.value?.end_date ?? "";
      commentsCtrl.text = getStatutoryById.value?.description ?? "";
    }
  }

  Future<void> getSRHistory({required int id}) async {
    int moduleType = 406;

    historyList?.value = await viewCompliancePresenter.getHistory(
          moduleType,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getFacilityList() async {
    final _facilityList = await viewCompliancePresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  void complianceApprovedButton({int? id, int? position}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentComplianceApprovedModel =
          CommentModel(id: id, comment: _comment);

      var complianceApprovedJsonString =
          commentComplianceApprovedModel.toJson();

      Map<String, dynamic>? response =
          await viewCompliancePresenter.complianceApprovedButton(
              complianceApprovedJsonString: complianceApprovedJsonString,
              isLoading: true,
              position: position);
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void complianceRejectButton({int? id, int? position}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentComplianceApprovedModel =
          CommentModel(id: id, comment: _comment);

      var complianceApprovedJsonString =
          commentComplianceApprovedModel.toJson();

      Map<String, dynamic>? response =
          await viewCompliancePresenter.complianceApprovedButton(
        complianceApprovedJsonString: complianceApprovedJsonString,
        isLoading: true,
        position: position,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print("$value");
    switch (list.runtimeType) {
      case const (RxList<StatutoryComplianceModel>):
        {
          if (value != "Please Select") {
            int currencyIndex =
                statutoryComplianceList.indexWhere((x) => x?.name == value);
            selectedStatutoryComplianceId =
                statutoryComplianceList[currencyIndex]?.id ?? 0;
            selectedStatutoryCompliance.value = value;
            isStatutoryComplianceSelected.value = true;
            print(
                "selectedBusinessTypeId: ${selectedStatutoryComplianceId} \n ${selectedStatutoryCompliance}");
          } else {
            selectedStatutoryComplianceId = 0;
          }
        }
        break;
      case const (RxList<ComplianceStatusModel>):
        {
          if (value != "Please Select") {
            int statusIndex =
                statusOfAplicationList.indexWhere((x) => x?.name == value);
            selectedStatusOfAplicationId =
                statusOfAplicationList[statusIndex]?.id ?? 0;
            selectedStatusOfAplication.value = value;
            isStatusOfAplicationSelected.value = true;
            print(
                "selectedBusinessTypeId: ${selectedStatusOfAplicationId} \n ${selectedStatusOfAplication}");
          } else {
            selectedStatusOfAplicationId = 0;
          }
        }
    }
  }
}
