// ignore: unused_import
import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/app/create_plantationdata/create_plantationdata_presenter.dart';
import 'package:cmms/domain/models/create_plantationdata_model.dart';
import 'package:cmms/domain/models/get_plantation_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreatePlantationDataController extends GetxController {
  CreatePlantationDataController(
    this.createplantationdataPresenter,
  );
  CreatePlantationDataPresenter createplantationdataPresenter;
  final HomeController homeController = Get.find();
   StreamSubscription<int>? facilityIdStreamSubscription;
     GetPlantationList? selectedItem;
      RxList<GetPlantationList?> plantationType =
      <GetPlantationList>[].obs;
  //createplantationdata
   var SaplingsPlantedCtrl = TextEditingController();
 var SaplingsSurvivedCtrl = TextEditingController();
 var SaplingsDiedCtrl = TextEditingController();

 Rx<bool> isSaplingsPlantedCtrlInvalid = false.obs;
 Rx<bool> isSaplingsSurvivedCtrlInvalid = false.obs;
 Rx<bool> isSaplingsDiedCtrlInvalid = false.obs;
void createplantationdata({ List<dynamic>? fileIds}) async {
     try {
     
       int _SaplingsPlantedCtrl = int.tryParse(SaplingsPlantedCtrl.text.trim())?? 0;
       int _SaplingsSurvivedCtrl = int.tryParse(SaplingsSurvivedCtrl.text.trim())?? 0;
       int _SaplingsDiedCtrl = int.tryParse(SaplingsDiedCtrl.text.trim())?? 0;
      CreatePlantationDataModel createplantationdataModel = CreatePlantationDataModel(
        SaplingsPlanted: _SaplingsPlantedCtrl,
        SaplingsSurvived: _SaplingsSurvivedCtrl,
        SaplingsDied: _SaplingsDiedCtrl,
        id:0,
        // date:"2024-08-18",
      );

      // Convert the CreatePlantationDataModel instance to JSON
      var CreatePlantationDataModelFromJson = createplantationdataModel.toJson();
      print(CreatePlantationDataModelFromJson);
      // Call the createplantationdata function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responsecreateoccupationalModel =
          await createplantationdataPresenter.createplantationdata(
        createplantationdata: CreatePlantationDataModelFromJson,
        isLoading: true,
      );
      

      // Handle the response
      if (responsecreateoccupationalModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create  create Visits and Notices data: $CreatePlantationDataModelFromJson');
    } catch (e) {
      print(e);
    }
 }
  // update API
  @override
  void onInit() async {
    try {
      await setPDId();

      super.onInit();
    } catch (e) {
      print(e);
    }
  }
Future<void> setPDId() async {
    try {
       if (Get.arguments != null) {
      var dataFromPreviousScreen = Get.arguments;
      selectedItem = dataFromPreviousScreen['selectedItem'];
    } else {
      selectedItem = GetPlantationList(id: 0, saplingsPlanted: 0, saplingsSurvived: 0, saplingsDied: 0,);
    }
      GetPlantationList? selectedItemhea;
      final _selectedItem = await createplantationdataPresenter.getValue();
      if (_selectedItem!.isNotEmpty) {
        final jobdetaildata = jsonDecode(_selectedItem.toString());
        selectedItemhea = GetPlantationList.fromJson(jobdetaildata);
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
SaplingsPlantedCtrl.text=selectedItem!.saplingsPlanted.toString();
SaplingsSurvivedCtrl.text=selectedItem!.saplingsSurvived.toString();
SaplingsDiedCtrl.text=selectedItem!.saplingsDied.toString();

      }
    } catch (e) {
      print(e.toString() + 'PlantationId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }
 
   void clearStoreData() {
    SaplingsPlantedCtrl.clear();
    SaplingsSurvivedCtrl.clear();
    SaplingsDiedCtrl.clear();   
  
  }
void updatePlantationDetails() async {
  
    int _id = selectedItem?.id ?? 0;

    int _SaplingsPlantedCtrl = int.tryParse(SaplingsPlantedCtrl.text.trim()) ?? 0;
    int _SaplingsSurvivedCtrl =
        int.tryParse(SaplingsSurvivedCtrl.text.trim()) ?? 0;
    int _SaplingsDiedCtrl =
        int.tryParse(SaplingsDiedCtrl.text.trim()) ?? 0;
    

    CreatePlantationDataModel createplantationdataModel = CreatePlantationDataModel(
      id: _id,
      SaplingsPlanted: _SaplingsPlantedCtrl,
        SaplingsSurvived: _SaplingsSurvivedCtrl,
        SaplingsDied: _SaplingsDiedCtrl,
      // date: "2024-08-18",
    );
     var updatePlantationModelJsonString =
        createplantationdataModel.toJson();

    Map<String, dynamic>? responseCreateGoModel =
        await createplantationdataPresenter.updatePlantationDetails(
      updatePlantation: updatePlantationModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      print("data fail ");
    }
}

}