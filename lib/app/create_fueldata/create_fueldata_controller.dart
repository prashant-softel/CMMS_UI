// ignore: unused_import
import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/create_fueldata/create_fueldata_presenter.dart';
import 'package:cmms/domain/models/create_fueldata_model.dart';
import 'package:cmms/domain/models/get_fueldata_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateFuelDataController extends GetxController {
  CreateFuelDataController(
    this.createfueldataPresenter,
  );
  CreateFuelDataPresenter createfueldataPresenter;
  final HomeController homeController = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
   GetFuelDataList? selectedItem;
    RxList<GetFuelDataList?> fueldataType =
      <GetFuelDataList>[].obs;
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
 // update API
   @override
  void onInit() async {
    try {
      await setFDId();

      facilityIdStreamSubscription = homeController.facilityId$.listen(
        (event) async {
          // facilityId = event;
          await getFuelConsumption();
        },
      );

      super.onInit();
    } catch (e) {
      print(e);
    }
  }
  Future<void> setFDId() async {
    try {
      GetFuelDataList? selectedItemhea;
      final _selectedItem = await createfueldataPresenter.getValue();
      if (_selectedItem!.isNotEmpty) {
        final jobdetaildata = jsonDecode(_selectedItem.toString());
        selectedItemhea = GetFuelDataList.fromJson(jobdetaildata);
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
        dieselConsumedforvehiclesCtrl.text=selectedItem!.dieselConsumedForVehicles.toString();
       petrolconsumedforvehiclesCtrl.text=selectedItem!.petrolConsumedForVehicles.toString();
       petrolconsumedforgrasscuttingandmoversCtrl.text=selectedItem!.petrolConsumedForGrassCuttingAndMovers.toString();
       dieselconsumedatsiteCtrl.text=selectedItem!.dieselConsumedAtSite.toString();
       petrolconsumedatsiteCtrl.text=selectedItem!.petrolConsumedAtSite.toString();
      }
    } catch (e) {
      print(e.toString() + 'FuelDataId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }
  Future<void> getFuelConsumption() async {
    final _fueldataType =
        await createfueldataPresenter.getFuelConsumption();

    if (_fueldataType != null) {
      _fueldataType != [];
      for (var fueldata in _fueldataType) {
        fueldataType.add(fueldata);
      }
      // selectedTypePermit.value = grievanceType[0]?.name ?? '';
    }
  }
   void clearStoreData() {
    dieselConsumedforvehiclesCtrl.clear();
    petrolconsumedforvehiclesCtrl.clear();
    petrolconsumedforgrasscuttingandmoversCtrl.clear();
    dieselconsumedatsiteCtrl.clear();
    petrolconsumedatsiteCtrl.clear();
  }
  void updateFuelConsumption() async {
    int _id = selectedItem?.id ?? 0;

    int _dieselConsumedforvehiclesCtrl = int.tryParse(dieselConsumedforvehiclesCtrl.text.trim()) ?? 0;
    int _petrolconsumedforvehiclesCtrl =
        int.tryParse(petrolconsumedforvehiclesCtrl.text.trim()) ?? 0;
    int _petrolconsumedforgrasscuttingandmoversCtrl =
        int.tryParse(petrolconsumedforgrasscuttingandmoversCtrl.text.trim()) ?? 0;
    int _dieselconsumedatsiteCtrl =
        int.tryParse(dieselconsumedatsiteCtrl.text.trim()) ?? 0;
    int _petrolconsumedatsiteCtrl =
        int.tryParse(petrolconsumedatsiteCtrl.text.trim()) ?? 0;


      CreateFuelDataModel createfueldataModel = CreateFuelDataModel(
        id: _id,
        DieselConsumedForVehicles: _dieselConsumedforvehiclesCtrl,
        PetrolConsumedForVehicles: _petrolconsumedforvehiclesCtrl,
        PetrolConsumedForGrassCuttingAndMovers: _petrolconsumedforgrasscuttingandmoversCtrl,
        DieselConsumedAtSite: _dieselconsumedatsiteCtrl,
        PetrolConsumedAtSite: _petrolconsumedatsiteCtrl,


        // date:"2024-08-18",
      
    );

    var updatefueldataModelJsonString =
        createfueldataModel.toJson();

    Map<String, dynamic>? responseCreateGoModel =
        await createfueldataPresenter.updateFuelConsumption(
      updateFueldata: updatefueldataModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      print("data fail ");
    }
  }

}
