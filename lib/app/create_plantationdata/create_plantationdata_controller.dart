// ignore: unused_import
import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/create_plantationdata/create_plantationdata_presenter.dart';
import 'package:cmms/domain/models/create_plantationdata_model.dart';
import 'package:cmms/domain/models/get_plantation_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
         Rx<bool> isFormInvalid = false.obs;
          var PlantationDateTc =
      TextEditingController();

  int selectedMonth = 0;
  int selectedYear=0;
  //createplantationdata
    var selectedMonthnamectrl = TextEditingController();
  var selectedYearctrl = TextEditingController();
   var SaplingsPlantedCtrl = TextEditingController();
 var SaplingsSurvivedCtrl = TextEditingController();
 var SaplingsDiedCtrl = TextEditingController();

 Rx<bool> isSaplingsPlantedCtrlInvalid = false.obs;
 Rx<bool> isSaplingsSurvivedCtrlInvalid = false.obs;
 Rx<bool> isSaplingsDiedCtrlInvalid = false.obs;
void createplantationdata({ List<dynamic>? fileIds, required int monthId , required int year}) async {
     try {
       checkForm();
      if(isFormInvalid.value){
        return;
      }
       int _SaplingsPlantedCtrl = int.tryParse(SaplingsPlantedCtrl.text.trim())?? 0;
       int _SaplingsSurvivedCtrl = int.tryParse(SaplingsSurvivedCtrl.text.trim())?? 0;
       int _SaplingsDiedCtrl = int.tryParse(SaplingsDiedCtrl.text.trim())?? 0;
      CreatePlantationDataModel createplantationdataModel = CreatePlantationDataModel(
        SaplingsPlanted: _SaplingsPlantedCtrl,
        SaplingsSurvived: _SaplingsSurvivedCtrl,
        SaplingsDied: _SaplingsDiedCtrl,
        id:0,
        month_id: monthId,
        year: year,
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
      selectedItem!.id == 0
          ? PlantationDateTc.text = ""
          : PlantationDateTc.text =
              "${DateFormat.MMMM().format(DateTime(0, selectedItem!.month_id ?? 0))} ${selectedItem!.year}";

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
      selectedItem = GetPlantationList(id: 0, saplingsPlanted: 0, saplingsSurvived: 0, saplingsDied: 0,    month_name: '',
          year: 0,);
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
selectedMonthnamectrl.text = selectedItem!.month_id.toString();
        selectedYearctrl.text = selectedItem!.year.toString();

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
    createplantationdataPresenter.clearValue();
  
  }
void updatePlantationDetails() async {
  
    int _id = selectedItem?.id ?? 0;

    int _SaplingsPlantedCtrl = int.tryParse(SaplingsPlantedCtrl.text.trim()) ?? 0;
    int _SaplingsSurvivedCtrl =
        int.tryParse(SaplingsSurvivedCtrl.text.trim()) ?? 0;
    int _SaplingsDiedCtrl =
        int.tryParse(SaplingsDiedCtrl.text.trim()) ?? 0;
    
      // If the month and year are not changed, fallback to selectedItem's values
    int _monthId = selectedMonth != (selectedItem?.month_id ?? 0)
        ? selectedMonth
        : selectedItem?.month_id ?? 0;

       int _year = selectedYear != (selectedItem?.year ?? 0)
        ? selectedYear
        : selectedItem?.year ?? 0;


    CreatePlantationDataModel createplantationdataModel = CreatePlantationDataModel(
      id: _id,
      SaplingsPlanted: _SaplingsPlantedCtrl,
        SaplingsSurvived: _SaplingsSurvivedCtrl,
        SaplingsDied: _SaplingsDiedCtrl,
           month_id: _monthId, // Use the new month or fallback to original
      year: _year,
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
      print("update fail ");
    } else {
      print("Update successful");
    }
}
void checkForm(){
  if(SaplingsPlantedCtrl.text.trim()==''){
  isSaplingsPlantedCtrlInvalid.value=true;
  isFormInvalid.value = true;
  }
  if(SaplingsSurvivedCtrl.text.trim()==''){
isSaplingsSurvivedCtrlInvalid.value=true;
isFormInvalid.value = true;
  }
  if(SaplingsDiedCtrl.text.trim()==''){
    isSaplingsDiedCtrlInvalid.value=true;
    isFormInvalid.value = true;
  }
}

}