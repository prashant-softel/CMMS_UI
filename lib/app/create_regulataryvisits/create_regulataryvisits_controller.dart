// ignore: unused_import
import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/create_regulataryvisits/create_regulataryvisits_presenter.dart';
import 'package:cmms/domain/models/create_regulataryvisits_model.dart';
import 'package:cmms/domain/models/get_visitandnotice_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateRegulataryVisitsController extends GetxController {
  CreateRegulataryVisitsController(
    this.createregulataryvisitsPresenter,
  );
  CreateRegulataryVisitsPresenter createregulataryvisitsPresenter;
  final HomeController homeController = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  GetVisitAndNoticeList? selectedItem;
  RxList<GetVisitAndNoticeList?> visitandnoticeType =
      <GetVisitAndNoticeList>[].obs;
  var govtauthvisitsCtrl = TextEditingController();
  var noOffinebythirdpartyCtrl = TextEditingController();
  var noofshowcausenoticesbythirdpartyCtrl = TextEditingController();
  var noticestocontractorCtrl = TextEditingController();
  var amountofpenaltiestocontractorsCtrl = TextEditingController();
  var anyotherCtrl = TextEditingController();
  Rx<bool> isGovtAuthVisitsInvalid = false.obs;
  Rx<bool> isNoOfFineByThirdPartyInvalid = false.obs;
  Rx<bool> isNoOfShowCauseNoticesInvalid = false.obs;
  Rx<bool> isNoticesToContractorInvalid = false.obs;
  Rx<bool> isAmountOfPenaltiesToContractorsInvalid = false.obs;
  Rx<bool> isAnyOtherInvalid = false.obs;
  Rx<int> visitId = 0.obs;
  void createvisitsandnotices({List<dynamic>? fileIds}) async {
    try {
      int _govtauthvisitsCtrl =
          int.tryParse(govtauthvisitsCtrl.text.trim()) ?? 0;
      int _noOffinebythirdpartyCtrl =
          int.tryParse(noOffinebythirdpartyCtrl.text.trim()) ?? 0;
      int _noofshowcausenoticesbythirdpartyCtrl =
          int.tryParse(noofshowcausenoticesbythirdpartyCtrl.text.trim()) ?? 0;
      int _noticestocontractorCtrl =
          int.tryParse(noticestocontractorCtrl.text.trim()) ?? 0;
      int _amountofpenaltiestocontractorsCtrl =
          int.tryParse(amountofpenaltiestocontractorsCtrl.text.trim()) ?? 0;
      int _anyotherCtrl = int.tryParse(anyotherCtrl.text.trim()) ?? 0;

      CreateRegulataryvisitsModel createRegulataryvisitsModel =
          CreateRegulataryvisitsModel(
        GovtAuthVisits: _govtauthvisitsCtrl,
        NoOfFineByThirdParty: _noOffinebythirdpartyCtrl,
        NoOfShowCauseNoticesByThirdParty: _noofshowcausenoticesbythirdpartyCtrl,
        NoticesToContractor: _noticestocontractorCtrl,
        AmountOfPenaltiesToContractors: _amountofpenaltiestocontractorsCtrl,
        AnyOther: _anyotherCtrl,
        id: 0,
        date: "2024-08-18",
      );

      // Convert the createRegulataryvisitsModel instance to JSON
      var createvisitsandnoticesModelJsonString =
          createRegulataryvisitsModel.toJson();
      print(createvisitsandnoticesModelJsonString);
      // Call the createvisitsandnotices function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responsecreateoccupationalModel =
          await createregulataryvisitsPresenter.createvisitsandnotices(
        createvisitsandnotices: createvisitsandnoticesModelJsonString,
        isLoading: true,
      );

      // Handle the response
      if (responsecreateoccupationalModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print(
          'Create  create Visits and Notices data: $createvisitsandnoticesModelJsonString');
    } catch (e) {
      print(e);
    }
  }

  // update API
  @override
  void onInit() async {
    try {
      await setVHId();

      facilityIdStreamSubscription = homeController.facilityId$.listen(
        (event) async {
          // facilityId = event;
          await getVisitsAndNoticesDatalist();
        },
      );

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setVHId() async {
    try {
      GetVisitAndNoticeList? selectedItemhea;
      final _selectedItem = await createregulataryvisitsPresenter.getValue();
      if (_selectedItem!.isNotEmpty) {
        final jobdetaildata = jsonDecode(_selectedItem.toString());
        selectedItemhea = GetVisitAndNoticeList.fromJson(jobdetaildata);
      }
      if (_selectedItem == null ||
          _selectedItem == '' ||
          _selectedItem == "null") {
        var dataFromPreviousScreen = Get.arguments;
        selectedItem = dataFromPreviousScreen['selectedItem'];
      } else {
        selectedItem = selectedItemhea;
      }
      if (selectedItem != null) {
        govtauthvisitsCtrl.text = selectedItem!.govtAuthVisits.toString();
        noOffinebythirdpartyCtrl.text =
            selectedItem!.noOfFineByThirdParty.toString();
        noofshowcausenoticesbythirdpartyCtrl.text =
            selectedItem!.noOfShowCauseNoticesByThirdParty.toString();
        noticestocontractorCtrl.text =
            selectedItem!.noticesToContractor.toString();
        amountofpenaltiestocontractorsCtrl.text =
            selectedItem!.amountOfPenaltiesToContractors.toString();
        anyotherCtrl.text = selectedItem!.anyOther.toString();
      }
    } catch (e) {
      print(e.toString() + 'VisitNoticeId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getVisitsAndNoticesDatalist() async {
    final _visitandnoticeType =
        await createregulataryvisitsPresenter.getVisitsAndNoticesDatalist();

    if (_visitandnoticeType != null) {
      _visitandnoticeType != [];
      for (var visitandnotice in _visitandnoticeType) {
        visitandnoticeType.add(visitandnotice);
      }
      // selectedTypePermit.value = grievanceType[0]?.name ?? '';
    }
  }
  void clearStoreData() {
    govtauthvisitsCtrl.clear();
    noOffinebythirdpartyCtrl.clear();
    noofshowcausenoticesbythirdpartyCtrl.clear();
    noticestocontractorCtrl.clear();
    amountofpenaltiestocontractorsCtrl.clear();
    anyotherCtrl.clear();
    createregulataryvisitsPresenter.clearValue();
  }

  void updateVisitAndNoticeDetails() async {
    int _id = selectedItem?.id ?? 0;

    int _govtauthvisitsCtrl = int.tryParse(govtauthvisitsCtrl.text.trim()) ?? 0;
    int _noOffinebythirdpartyCtrl =
        int.tryParse(noOffinebythirdpartyCtrl.text.trim()) ?? 0;
    int _noofshowcausenoticesbythirdpartyCtrl =
        int.tryParse(noofshowcausenoticesbythirdpartyCtrl.text.trim()) ?? 0;
    int _noticestocontractorCtrl =
        int.tryParse(noticestocontractorCtrl.text.trim()) ?? 0;
    int _amountofpenaltiestocontractorsCtrl =
        int.tryParse(amountofpenaltiestocontractorsCtrl.text.trim()) ?? 0;
    int _anyotherCtrl = int.tryParse(anyotherCtrl.text.trim()) ?? 0;

    CreateRegulataryvisitsModel createregulataryvisitsModel =
        CreateRegulataryvisitsModel(
      id: _id,
      GovtAuthVisits: _govtauthvisitsCtrl,
      NoOfFineByThirdParty: _noOffinebythirdpartyCtrl,
      NoOfShowCauseNoticesByThirdParty: _noofshowcausenoticesbythirdpartyCtrl,
      NoticesToContractor: _noticestocontractorCtrl,
      AmountOfPenaltiesToContractors: _amountofpenaltiestocontractorsCtrl,
      AnyOther: _anyotherCtrl,
      date: "2024-08-18",
    );

    var updateVisitAndNoticModelJsonString =
        createregulataryvisitsModel.toJson();

    Map<String, dynamic>? responseCreateGoModel =
        await createregulataryvisitsPresenter.updateVisitAndNoticeDetails(
      updateRegularVisit: updateVisitAndNoticModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      print("data fail ");
    }
  }
}
