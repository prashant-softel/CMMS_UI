// ignore: unused_import

import 'dart:async';
import 'dart:convert';

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
 var HealthDate = TextEditingController();
  int selectedMonth = 0;
  int selectedYear=0;
  String month = 'April';
  String year ='2000';
Rx<bool> isFormInvalid = false.obs;
 var noofhealthexamsofnewjoinerCtrl = TextEditingController();
 var periodictestsCtrl = TextEditingController();
 var occupationalillnessesCtrl = TextEditingController();
 StreamSubscription<int>? facilityIdStreamSubscription;
 RxList<GetOccupationalList?> occupationalType = <GetOccupationalList>[].obs;
 Rx<int> healthId = 0.obs;
 Rx<bool> isLoading = true.obs;
 Rx<bool> isHeathExamInvalid = false.obs;
 Rx<bool> isPeriodictestInvalid = false.obs;
 Rx<bool> isOccupationalIllnessesInvalid = false.obs;
  GetOccupationalList? selectedItem;
  Rx<String> selecteddocumentNameType = ''.obs;
// varUserAccessModel

  @override
  void onInit() async {
    try {
      await setOHId();
    super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setOHId() async {
    try {
       if (Get.arguments != null) {
      var dataFromPreviousScreen = Get.arguments;
      selectedItem = dataFromPreviousScreen['selectedItem'];
    } else {
      selectedItem = GetOccupationalList(id: 0, noOfHealthExamsOfNewJoiner: 0, periodicTests: 0, occupationalIllnesses: 0,);
    }
     GetOccupationalList? selectedItemhea;
      final _selectedItem = await createOccupationalhealthPresenter.getValue();
        if (_selectedItem!.isNotEmpty) {
        final jobdetaildata = jsonDecode(_selectedItem.toString());
        selectedItemhea = GetOccupationalList.fromJson(jobdetaildata);
      }
       if (_selectedItem == null ||
          _selectedItem == '' ||
          _selectedItem == "null") {
        var dataFromPreviousScreen = Get.arguments;
        selectedItem = dataFromPreviousScreen['selectedItem'];
      }
      else {
        selectedItem = selectedItemhea;
      }
        if (selectedItem != null) {

       noofhealthexamsofnewjoinerCtrl.text = selectedItem!.noOfHealthExamsOfNewJoiner.toString();
       periodictestsCtrl.text = selectedItem!.periodicTests.toString();
       occupationalillnessesCtrl.text = selectedItem!.occupationalIllnesses.toString();
        
      }
    } catch (e) {
      print(e.toString() + 'healthId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }


 void createoccupational({ List<dynamic>? fileIds,required int month_id,required int year}) async {
     try {
     
      int _noofhealthexamsofnewjoinerCtrl = int.tryParse(noofhealthexamsofnewjoinerCtrl.text.trim())?? 0;
       int _periodictestsCtrl = int.tryParse(periodictestsCtrl.text.trim())?? 0;
       int _occupationalillnessesCtrl = int.tryParse(occupationalillnessesCtrl.text.trim())?? 0;



      CreateOccupationalModel createoccupationalModel = CreateOccupationalModel(
        NoOfHealthExamsOfNewJoiner: _noofhealthexamsofnewjoinerCtrl,
        PeriodicTests: _periodictestsCtrl,
        OccupationalIllnesses: _occupationalillnessesCtrl,
        // CreatedBy: varUserAccessModel.value.user_id,
        id:0,
        month_id: month_id,
        year:year,
        // date:"2024-08-18",
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
   
      int _id=selectedItem?.id??0;
      int _noofhealthexamsofnewjoinerCtrl = int.tryParse(noofhealthexamsofnewjoinerCtrl.text.trim())?? 0;
       int _periodictestsCtrl = int.tryParse(periodictestsCtrl.text.trim())?? 0;
       int _occupationalillnessesCtrl = int.tryParse(occupationalillnessesCtrl.text.trim())?? 0;


      CreateOccupationalModel createoccupationalModel = CreateOccupationalModel(
        id:_id,
        NoOfHealthExamsOfNewJoiner: _noofhealthexamsofnewjoinerCtrl,
        PeriodicTests: _periodictestsCtrl,
        OccupationalIllnesses: _occupationalillnessesCtrl,
        // date:"2024-08-18",
      );

   // Convert the createoccupationalModel instance to JSON
      var createoccupationalModelJsonString = createoccupationalModel.toJson();

      Map<String, dynamic>? responseoccupationalupdate =
          await createOccupationalhealthPresenter.updateHealthData(
        updateHealthData: createoccupationalModelJsonString,
        isLoading: true,
      );

    if (responseoccupationalupdate == null) {
      print("data fail ");
    }
 
     
     
  }
   void clearStoreData() {
    noofhealthexamsofnewjoinerCtrl.clear();
    periodictestsCtrl.clear();
    occupationalillnessesCtrl.clear();
    createOccupationalhealthPresenter.clearValue();
  }
  // Void goHealthDataList(){

  // }
 void checkForm(){
  if(noofhealthexamsofnewjoinerCtrl.text.trim()==''){
isFormInvalid.value = true;
isHeathExamInvalid.value=true;
  }
  if(periodictestsCtrl.text.trim()==''){
isFormInvalid.value = true;
isPeriodictestInvalid.value=true;
  }
  if(occupationalillnessesCtrl.text.trim()==''){
isFormInvalid.value = true;
isOccupationalIllnessesInvalid.value=true;
  }
 }
 
}
