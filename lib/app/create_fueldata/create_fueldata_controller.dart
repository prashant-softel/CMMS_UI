// ignore: unused_import
import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/create_fueldata/create_fueldata_presenter.dart';
import 'package:cmms/domain/models/create_fueldata_model.dart';
import 'package:cmms/domain/models/get_fueldata_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home/home_controller.dart';

class CreateFuelDataController extends GetxController {
  CreateFuelDataController(
    this.createfueldataPresenter,
  );
  CreateFuelDataPresenter createfueldataPresenter;
  final HomeController homeController = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  GetFuelDataList? selectedItem;
  var FuelDateTc = TextEditingController();
  int selectedMonth = 0;
  int selectedYear = 0;
  RxList<GetFuelDataList?> fueldataType = <GetFuelDataList>[].obs;
  //createfuledata
  var selectedMonthnamectrl = TextEditingController();
  var selectedYearctrl = TextEditingController();
  var dieselConsumedforvehiclesCtrl = TextEditingController();
  var petrolconsumedforvehiclesCtrl = TextEditingController();
  var petrolconsumedforgrasscuttingandmoversCtrl = TextEditingController();
  var dieselconsumedatsiteCtrl = TextEditingController();
  var petrolconsumedatsiteCtrl = TextEditingController();
  Rx<bool> isFormInvalid = false.obs;

  Rx<bool> isDieselConsumedForVehiclesInvalid = false.obs;
  Rx<bool> isPetrolConsumedForVehiclesInvalid = false.obs;
  Rx<bool> isPetrolConsumedForGrassCuttingAndMoversInvalid = false.obs;
  Rx<bool> isDieselConsumedAtSiteInvalid = false.obs;
  Rx<bool> isPetrolConsumedAtSiteInvalid = false.obs;

  void createfuledata(
      {List<dynamic>? fileIds,
      required int month_id,
      required int year}) async {
    try {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      int _dieselConsumedforvehiclesCtrl =
          int.tryParse(dieselConsumedforvehiclesCtrl.text.trim()) ?? 0;
      int _petrolconsumedforvehiclesCtrl =
          int.tryParse(petrolconsumedforvehiclesCtrl.text.trim()) ?? 0;
      int _petrolconsumedforgrasscuttingandmoversCtrl = int.tryParse(
              petrolconsumedforgrasscuttingandmoversCtrl.text.trim()) ??
          0;
      int _dieselconsumedatsiteCtrl =
          int.tryParse(dieselconsumedatsiteCtrl.text.trim()) ?? 0;
      int _petrolconsumedatsiteCtrl =
          int.tryParse(petrolconsumedatsiteCtrl.text.trim()) ?? 0;

      CreateFuelDataModel createfueldataModel = CreateFuelDataModel(
        DieselConsumedForVehicles: _dieselConsumedforvehiclesCtrl,
        PetrolConsumedForVehicles: _petrolconsumedforvehiclesCtrl,
        PetrolConsumedForGrassCuttingAndMovers:
            _petrolconsumedforgrasscuttingandmoversCtrl,
        DieselConsumedAtSite: _dieselconsumedatsiteCtrl,
        PetrolConsumedAtSite: _petrolconsumedatsiteCtrl,
        month_id: month_id,
        year: year,

        id: 0,
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

      print(
          'Create  create Visits and Notices data: $CreateFuelDataModelFromJson');
    } catch (e) {
      print(e);
    }
  }

  // update API
  @override
  void onInit() async {
    try {
      await setFDId();
      selectedItem!.id == 0
          ? FuelDateTc.text = ""
          : FuelDateTc.text =
              "${DateFormat.MMMM().format(DateTime(0, selectedItem!.month_id ?? 0))} ${selectedItem!.year}";
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setFDId() async {
    try {
      if (Get.arguments != null) {
        var dataFromPreviousScreen = Get.arguments;
        selectedItem = dataFromPreviousScreen['selectedItem'];
      } else {
        selectedItem = GetFuelDataList(
          id: 0,
          dieselConsumedForVehicles: 0,
          petrolConsumedForVehicles: 0,
          petrolConsumedForGrassCuttingAndMovers: 0,
          dieselConsumedAtSite: 0,
          petrolConsumedAtSite: 0,
          month_name: '',
          year: 0,
        );
      }
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
        dieselConsumedforvehiclesCtrl.text =
            selectedItem!.dieselConsumedForVehicles.toString();
        petrolconsumedforvehiclesCtrl.text =
            selectedItem!.petrolConsumedForVehicles.toString();
        petrolconsumedforgrasscuttingandmoversCtrl.text =
            selectedItem!.petrolConsumedForGrassCuttingAndMovers.toString();
        dieselconsumedatsiteCtrl.text =
            selectedItem!.dieselConsumedAtSite.toString();
        petrolconsumedatsiteCtrl.text =
            selectedItem!.petrolConsumedAtSite.toString();
      }
    } catch (e) {
      print(e.toString() + 'FuelDataId');
      //  Utility.showDialog(e.toString() + 'userId');
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

    int _dieselConsumedforvehiclesCtrl =
        int.tryParse(dieselConsumedforvehiclesCtrl.text.trim()) ?? 0;
    int _petrolconsumedforvehiclesCtrl =
        int.tryParse(petrolconsumedforvehiclesCtrl.text.trim()) ?? 0;
    int _petrolconsumedforgrasscuttingandmoversCtrl =
        int.tryParse(petrolconsumedforgrasscuttingandmoversCtrl.text.trim()) ??
            0;
    int _dieselconsumedatsiteCtrl =
        int.tryParse(dieselconsumedatsiteCtrl.text.trim()) ?? 0;
    int _petrolconsumedatsiteCtrl =
        int.tryParse(petrolconsumedatsiteCtrl.text.trim()) ?? 0;

            // If the month and year are not changed, fallback to selectedItem's values
    int _monthId = selectedMonth != (selectedItem?.month_id ?? 0)
        ? selectedMonth
        : selectedItem?.month_id ?? 0;

    int _year = selectedYear != (selectedItem?.year ?? 0)
        ? selectedYear
        : selectedItem?.year ?? 0;

    CreateFuelDataModel createfueldataModel = CreateFuelDataModel(
      id: _id,
      DieselConsumedForVehicles: _dieselConsumedforvehiclesCtrl,
      PetrolConsumedForVehicles: _petrolconsumedforvehiclesCtrl,
      PetrolConsumedForGrassCuttingAndMovers:
          _petrolconsumedforgrasscuttingandmoversCtrl,
      DieselConsumedAtSite: _dieselconsumedatsiteCtrl,
      PetrolConsumedAtSite: _petrolconsumedatsiteCtrl,
       month_id: _monthId, // Use the new month or fallback to original
      year: _year,

      // date:"2024-08-18",
    );

    var updatefueldataModelJsonString = createfueldataModel.toJson();

    Map<String, dynamic>? responseCreateGoModel =
        await createfueldataPresenter.updateFuelConsumption(
      updateFueldata: updatefueldataModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      print("Update failed ");
    }else {
      print("Update successful");
    }
  }

  void checkForm() {
    if (dieselConsumedforvehiclesCtrl.text.trim().length < 3) {
      isFormInvalid.value = true;
      isDieselConsumedForVehiclesInvalid.value = true;
    }
    if (petrolconsumedforvehiclesCtrl.text.trim() == '') {
      isFormInvalid.value = true;
      isPetrolConsumedForVehiclesInvalid.value = true;
    }
    if (petrolconsumedforgrasscuttingandmoversCtrl.text.trim() == '') {
      isFormInvalid.value = true;
      isPetrolConsumedForGrassCuttingAndMoversInvalid.value = true;
    }
    if (dieselconsumedatsiteCtrl.text.trim() == '') {
      isFormInvalid.value = true;
      isDieselConsumedAtSiteInvalid.value = true;
    }
    if (petrolconsumedatsiteCtrl.text.trim() == '') {
      isPetrolConsumedAtSiteInvalid.value = true;
      isFormInvalid.value = true;
    }
  }
}
