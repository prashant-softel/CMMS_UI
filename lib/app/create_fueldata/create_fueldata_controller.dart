// ignore: unused_import
import 'package:cmms/app/create_fueldata/create_fueldata_presenter.dart';
import 'package:cmms/domain/models/create_fueldata_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateFuelDataController extends GetxController {
  CreateFuelDataController(
    this.createfueldataPresenter,
  );
  CreateFuelDataPresenter createfueldataPresenter;
  final HomeController homeController = Get.find();
  //createfuledata
  var dieselConsumedforvehiclesCtrl = TextEditingController();
 var petrolconsumedforvehiclesCtrl = TextEditingController();
 var petrolconsumedforgrasscuttingandmoversCtrl = TextEditingController();
 var dieselconsumedatsiteCtrl = TextEditingController();
 var petrolconsumedatsiteCtrl = TextEditingController();


 Rx<bool> isDieselConsumedForVehiclesInvalid = false.obs;
 Rx<bool> isPetrolConsumedForVehiclesInvalid = false.obs;
 Rx<bool> isPetrolConsumedForGrassCuttingAndMoversInvalid = false.obs;
 Rx<bool> isDieselConsumedAtSiteInvalid = false.obs;
 Rx<bool> isPetrolConsumedAtSiteInvalid = false.obs;


void createfuledata({ List<dynamic>? fileIds}) async {
     try {
     
       int _dieselConsumedforvehiclesCtrl = int.tryParse(dieselConsumedforvehiclesCtrl.text.trim())?? 0;
       int _petrolconsumedforvehiclesCtrl = int.tryParse(petrolconsumedforvehiclesCtrl.text.trim())?? 0;
       int _petrolconsumedforgrasscuttingandmoversCtrl = int.tryParse(petrolconsumedforgrasscuttingandmoversCtrl.text.trim())?? 0;
       int _dieselconsumedatsiteCtrl = int.tryParse(dieselconsumedatsiteCtrl.text.trim())?? 0;
       int _petrolconsumedatsiteCtrl = int.tryParse(petrolconsumedatsiteCtrl.text.trim())?? 0;




      CreateFuelDataModel createfueldataModel = CreateFuelDataModel(
        DieselConsumedForVehicles: _dieselConsumedforvehiclesCtrl,
        PetrolConsumedForVehicles: _petrolconsumedforvehiclesCtrl,
        PetrolConsumedForGrassCuttingAndMovers: _petrolconsumedforgrasscuttingandmoversCtrl,
        DieselConsumedAtSite: _dieselconsumedatsiteCtrl,
        PetrolConsumedAtSite: _petrolconsumedatsiteCtrl,

        id:0,
        // date:"2024-08-18",
      );

      // Convert the CreateFuelDataModel instance to JSON
      var CreateFuelDataModelFromJson = createfueldataModel.toJson();
      print(CreateFuelDataModelFromJson);
      // Call the createfuledata function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responsecreateoccupationalModel =
          await createfueldataPresenter.createfuledata(
        createfuledata: CreateFuelDataModelFromJson,
        isLoading: true,
      );
      

      // Handle the response
      if (responsecreateoccupationalModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create  create Visits and Notices data: $CreateFuelDataModelFromJson');
    } catch (e) {
      print(e);
    }
 }
}
