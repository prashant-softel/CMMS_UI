// ignore: unused_import
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/app/create_regulataryvisits/create_regulataryvisits_presenter.dart';
import 'package:cmms/domain/models/create_regulataryvisits_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateRegulataryVisitsController extends GetxController {
  CreateRegulataryVisitsController(
    this.createregulataryvisitsPresenter,
  );
  CreateRegulataryVisitsPresenter createregulataryvisitsPresenter;
  final HomeController homeController = Get.find();

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

 void createvisitsandnotices({ List<dynamic>? fileIds}) async {
     try {
     
       int _govtauthvisitsCtrl = int.tryParse(govtauthvisitsCtrl.text.trim())?? 0;
       int _noOffinebythirdpartyCtrl = int.tryParse(noOffinebythirdpartyCtrl.text.trim())?? 0;
       int _noofshowcausenoticesbythirdpartyCtrl = int.tryParse(noofshowcausenoticesbythirdpartyCtrl.text.trim())?? 0;
       int _noticestocontractorCtrl = int.tryParse(noticestocontractorCtrl.text.trim())?? 0;
       int _amountofpenaltiestocontractorsCtrl = int.tryParse(amountofpenaltiestocontractorsCtrl.text.trim())?? 0;
       int _anyotherCtrl = int.tryParse(anyotherCtrl.text.trim())?? 0;



      CreateRegulataryvisitsModel createRegulataryvisitsModel = CreateRegulataryvisitsModel(
        GovtAuthVisits: _govtauthvisitsCtrl,
        NoOfFineByThirdParty: _noOffinebythirdpartyCtrl,
        NoOfShowCauseNoticesByThirdParty: _noofshowcausenoticesbythirdpartyCtrl,
        NoticesToContractor: _noticestocontractorCtrl,
        AmountOfPenaltiesToContractors: _amountofpenaltiestocontractorsCtrl,
        AnyOther: _anyotherCtrl,
        id:0,
        // date:"2024-08-18",
      );

      // Convert the createRegulataryvisitsModel instance to JSON
      var createvisitsandnoticesModelJsonString = createRegulataryvisitsModel.toJson();
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
      print('Create  create Visits and Notices data: $createvisitsandnoticesModelJsonString');
    } catch (e) {
      print(e);
    }
 }
}
