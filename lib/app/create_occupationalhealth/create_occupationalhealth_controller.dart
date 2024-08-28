// ignore: unused_import

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/domain/models/create_occupationalhealth_model.dart';
import 'package:cmms/domain/models/get_occupational_list_model.dart';
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
 RxList<GetOccupationalList?> occupationalType = <GetOccupationalList>[].obs;
 Rx<int> healthId = 0.obs;
 Rx<bool> isLoading = true.obs;
 Rx<bool> isHeathExamInvalid = false.obs;
 Rx<bool> isPeriodictestInvalid = false.obs;
 Rx<bool> isOccupationalIllnessesInvalid = false.obs;
// varUserAccessModel

  Future<void> setOHId() async {
    try {
      final _grievanceId = await createOccupationalhealthPresenter.getValue();
      if (_grievanceId == null ||
          _grievanceId == '' ||
          _grievanceId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        healthId.value = dataFromPreviousScreen['grievanceId'];
        print("gri: ${healthId}");
        createOccupationalhealthPresenter.saveValue(
            healthId: healthId.value.toString());
      } else {
        healthId.value = int.tryParse(_grievanceId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'healthId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getHealthDatalist() async {
    final _occupationalType = await createOccupationalhealthPresenter.getHealthDatalist();

    if (_occupationalType != null) {
      _occupationalType != [];
      for (var  occupational in _occupationalType) {
        occupationalType.add( occupational);
      }
      // selectedTypePermit.value = grievanceType[0]?.name ?? '';
    }
  }


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
      int _id=healthId.value;
      int _noofhealthexamsofnewjoinerCtrl = int.tryParse(noofhealthexamsofnewjoinerCtrl.text.trim())?? 0;
       int _periodictestsCtrl = int.tryParse(periodictestsCtrl.text.trim())?? 0;
       int _occupationalillnessesCtrl = int.tryParse(occupationalillnessesCtrl.text.trim())?? 0;
var ms='';
      CreateOccupationalModel createoccupationalModel = CreateOccupationalModel(
        id:_id,
        NoOfHealthExamsOfNewJoiner: _noofhealthexamsofnewjoinerCtrl,
        PeriodicTests: _periodictestsCtrl,
        OccupationalIllnesses: _occupationalillnessesCtrl,
        CreatedBy: varUserAccessModel.value.user_id,
        date:"2024-08-18",
      );

   // Convert the createoccupationalModel instance to JSON
      var createoccupationalModelJsonString = createoccupationalModel.toJson();
      print(createoccupationalModelJsonString);
      // Call the createoccupational function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responseoccupationalupdate =
          await createOccupationalhealthPresenter.createoccupational(
        createoccupational: createoccupationalModelJsonString,
        isLoading: true,
      );

      // var _healthId = 0;
      // var _message = '';
      // if (responseoccupationalupdate["Health type"] != null &&
      //     responseoccupationalupdate["Health type"].isNotEmpty) {
      //   // _grievanceId = responsecreateoccupationalModel["grievanceType"][0];
      // }
      // if (responseoccupationalupdate["message"] != null) {
      //   _message = responseoccupationalupdate["message"];
      // }
     
        } catch (e) {
      print(e.toString());
    }
  }
   void clearStoreData() {
    noofhealthexamsofnewjoinerCtrl.clear();
    periodictestsCtrl.clear();
    occupationalillnessesCtrl.clear();
    createOccupationalhealthPresenter.clearValue();
  }
 
}
