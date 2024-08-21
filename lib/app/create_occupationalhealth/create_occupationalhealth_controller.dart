// ignore: unused_import

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/domain/models/create_occupationalhealth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateOccupationalhealthController extends GetxController {
  CreateOccupationalhealthController(
    this.createOccupationalhealthPresenter,
  );
  CreateOccupationalhealthPresenter createOccupationalhealthPresenter;
  final HomeController homeController = Get.find();

  

 var noofhealthexamsofnewjoinerCtrl = TextEditingController();
 var periodictestsCtrl = TextEditingController();
 var occupationalillnessesCtrl = TextEditingController();
 Rx<bool> isHeathExamInvalid = false.obs;
 Rx<bool> isPeriodictestInvalid = false.obs;
 Rx<bool> isOccupationalIllnessesInvalid = false.obs;
// varUserAccessModel
 void createoccupational({ List<dynamic>? fileIds}) async {
     try {
     
      int _noofhealthexamsofnewjoinerCtrl = int.tryParse(noofhealthexamsofnewjoinerCtrl.text.trim())?? 0;
       int _periodictestsCtrl = int.tryParse(periodictestsCtrl.text.trim())?? 0;
       int _occupationalillnessesCtrl = int.tryParse(occupationalillnessesCtrl.text.trim())?? 0;



      CreateOccupationalModel createoccupationalModel = CreateOccupationalModel(
        NoOfHealthExamsOfNewJoiner: _noofhealthexamsofnewjoinerCtrl,
        PeriodicTests: _periodictestsCtrl,
        OccupationalIllnesses: _occupationalillnessesCtrl,
        CreatedBy: varUserAccessModel.value.user_id,
        id:0,
        date:"2024-08-18",
      );

      // Convert the createoccupationalModel instance to JSON
      var createoccupationalModelJsonString = createoccupationalModel.toJson();
      print(createoccupationalModelJsonString);
      // Call the createoccupational function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responsecreateoccupationalModel =
          await createOccupationalhealthPresenter.createoccupational(
        createoccupational: createoccupationalModelJsonString,
        isLoading: true,
      );

      // Handle the response
      if (responsecreateoccupationalModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create  create Occupational  data: $createoccupationalModelJsonString');
    } catch (e) {
      print(e);
    }
 }
void updateOccupationalDetails() async {
    try {
      int _noofhealthexamsofnewjoinerCtrl = int.tryParse(noofhealthexamsofnewjoinerCtrl.text.trim())?? 0;
       int _periodictestsCtrl = int.tryParse(periodictestsCtrl.text.trim())?? 0;
       int _occupationalillnessesCtrl = int.tryParse(occupationalillnessesCtrl.text.trim())?? 0;

      CreateOccupationalModel createoccupationalModel = CreateOccupationalModel(

        NoOfHealthExamsOfNewJoiner: _noofhealthexamsofnewjoinerCtrl,
        PeriodicTests: _periodictestsCtrl,
        OccupationalIllnesses: _occupationalillnessesCtrl,
        CreatedBy: varUserAccessModel.value.user_id,
        id:0,
        date:"2024-08-18",
      );

   // Convert the createoccupationalModel instance to JSON
      var createoccupationalModelJsonString = createoccupationalModel.toJson();
      print(createoccupationalModelJsonString);
      // Call the createoccupational function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responsecreateoccupationalModel =
          await createOccupationalhealthPresenter.createoccupational(
        createoccupational: createoccupationalModelJsonString,
        isLoading: true,
      );

      // // var _grievanceId = 0;
      // var _message = '';
      // if (responsecreateoccupationalModel["grievanceType"] != null &&
      //     responsecreateoccupationalModel["grievanceType"].isNotEmpty) {
      //   // _grievanceId = responsecreateoccupationalModel["grievanceType"][0];
      // }
      // if (responsecreateoccupationalModel["message"] != null) {
      //   _message = responsecreateoccupationalModel["message"];
      // }
     
        } catch (e) {
      print(e.toString());
    }
  }
 
}
