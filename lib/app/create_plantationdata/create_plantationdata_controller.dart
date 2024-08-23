// ignore: unused_import
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/app/create_plantationdata/create_plantationdata_presenter.dart';
import 'package:cmms/domain/models/create_plantationdata_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreatePlantationDataController extends GetxController {
  CreatePlantationDataController(
    this.createplantationdataPresenter,
  );
  CreatePlantationDataPresenter createplantationdataPresenter;
  final HomeController homeController = Get.find();
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
 
}
