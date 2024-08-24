// ignore: unused_import
import 'package:cmms/app/create_fueldata/create_fueldata_presenter.dart';
import 'package:cmms/app/create_kaizens/create_kaizens_presenter.dart';
import 'package:cmms/domain/models/create_fueldata_model.dart';
import 'package:cmms/domain/models/create_kaizens_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateKaizensDataController extends GetxController {
  CreateKaizensDataController(
    this.createkaizensdataPresenter,
  );
  CreateKaizensdataPresenter createkaizensdataPresenter;
  final HomeController homeController = Get.find();
  //createkaizensdata
  var KaizensImplementedCtrl = TextEditingController();
 var CostForImplementationCtrl = TextEditingController();
 var CostSavedFromImplementationCtrl = TextEditingController();


 Rx<bool> isKaizensImplementedInvalid = false.obs;
 Rx<bool> isCostForImplementationInvalid = false.obs;
 Rx<bool> isCostSavedFromImplementationInvalid = false.obs;



void createkaizensdata({ List<dynamic>? fileIds}) async {
     try {
     
       int _KaizensImplementedCtrl = int.tryParse(KaizensImplementedCtrl.text.trim())?? 0;
       int _CostForImplementationCtrl = int.tryParse(CostForImplementationCtrl.text.trim())?? 0;
       int _CostSavedFromImplementationCtrl = int.tryParse(CostSavedFromImplementationCtrl.text.trim())?? 0;

      CreateKaizensModel createkaizensdataModel = CreateKaizensModel(
        KaizensImplemented: _KaizensImplementedCtrl,
        CostForImplementation: _CostForImplementationCtrl,
        CostSavedFromImplementation: _CostSavedFromImplementationCtrl,
        id:0,
        // date:"2024-08-18",
      );

      // Convert the CreateFuelDataModel instance to JSON
      var CreateKaizenDataModelFromJson = createkaizensdataModel.toJson();
      print(CreateKaizenDataModelFromJson);
      // Call the createkaizensdata function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responsecreateoccupationalModel =
          await createkaizensdataPresenter.createkaizensdata(
        createkaizensdata: CreateKaizenDataModelFromJson,
        isLoading: true,
      );
      

      // Handle the response
      if (responsecreateoccupationalModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create  create kaizens data: $CreateFuelDataModelFromJson');
    } catch (e) {
      print(e);
    }
 }
}
