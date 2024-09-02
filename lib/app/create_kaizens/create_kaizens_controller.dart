// ignore: unused_import
import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/create_kaizens/create_kaizens_presenter.dart';
import 'package:cmms/domain/models/create_fueldata_model.dart';
import 'package:cmms/domain/models/create_kaizens_model.dart';
import 'package:cmms/domain/models/get_kaizensdata_list_model.dart';
import 'package:cmms/domain/models/get_kaizensdata_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateKaizensDataController extends GetxController {
  CreateKaizensDataController(
    this.createkaizensdataPresenter,
  );
  CreateKaizensdataPresenter createkaizensdataPresenter;
  final HomeController homeController = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<GetKaizensDataList?> kaizendataType = <GetKaizensDataList>[].obs;
  GetKaizensDataList? selectedItem;
  Rx<bool> isFormInvalid = false.obs;
  var KaizensDateTc =
      TextEditingController(text: DateTime.now().year.toString());
  int selectedYear = 2024;
  int selectedMonth = 4;
  String month = 'April';
  //createkaizensdata
  var KaizensImplementedCtrl = TextEditingController();
  var CostForImplementationCtrl = TextEditingController();
  var CostSavedFromImplementationCtrl = TextEditingController();

  Rx<bool> isKaizensImplementedInvalid = false.obs;
  Rx<bool> isCostForImplementationInvalid = false.obs;
  Rx<bool> isCostSavedFromImplementationInvalid = false.obs;

  void createkaizensdata({List<dynamic>? fileIds}) async {
    try {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }

      int _KaizensImplementedCtrl =
          int.tryParse(KaizensImplementedCtrl.text.trim()) ?? 0;
      int _CostForImplementationCtrl =
          int.tryParse(CostForImplementationCtrl.text.trim()) ?? 0;
      int _CostSavedFromImplementationCtrl =
          int.tryParse(CostSavedFromImplementationCtrl.text.trim()) ?? 0;

      CreateKaizensModel createkaizensdataModel = CreateKaizensModel(
        KaizensImplemented: _KaizensImplementedCtrl,
        CostForImplementation: _CostForImplementationCtrl,
        CostSavedFromImplementation: _CostSavedFromImplementationCtrl,
        id: 0,
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

  // update API
  @override
  void onInit() async {
    try {
      await setKDId();

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setKDId() async {
    try {
      if (Get.arguments != null) {
        var dataFromPreviousScreen = Get.arguments;
        selectedItem = dataFromPreviousScreen['selectedItem'];
      } else {
        selectedItem = GetKaizensDataList(
            id: 0,
            kaizensImplemented: 0,
            costForImplementation: 0,
            costSavedFromImplementation: 0);
      }
      GetKaizensDataList? selectedItemhea;
      final _selectedItem = await createkaizensdataPresenter.getValue();
      if (_selectedItem!.isNotEmpty) {
        final jobdetaildata = jsonDecode(_selectedItem.toString());
        selectedItemhea = GetKaizensDataList.fromJson(jobdetaildata);
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
        KaizensImplementedCtrl.text =
            selectedItem!.kaizensImplemented.toString();
        CostForImplementationCtrl.text =
            selectedItem!.costForImplementation.toString();
        CostSavedFromImplementationCtrl.text =
            selectedItem!.costSavedFromImplementation.toString();
      }
    } catch (e) {
      print(e.toString() + 'KaizenId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  void clearStoreData() {
    KaizensImplementedCtrl.clear();
    CostForImplementationCtrl.clear();
    CostSavedFromImplementationCtrl.clear();
  }

  void updateKaizenDetails() async {
    int _id = selectedItem?.id ?? 0;

    int _KaizensImplementedCtrl =
        int.tryParse(KaizensImplementedCtrl.text.trim()) ?? 0;
    int _CostForImplementationCtrl =
        int.tryParse(CostForImplementationCtrl.text.trim()) ?? 0;
    int _CostSavedFromImplementationCtrl =
        int.tryParse(CostSavedFromImplementationCtrl.text.trim()) ?? 0;

    CreateKaizensModel createkaizensdataModel = CreateKaizensModel(
      id: _id,
      KaizensImplemented: _KaizensImplementedCtrl,
      CostForImplementation: _CostForImplementationCtrl,
      CostSavedFromImplementation: _CostSavedFromImplementationCtrl,
      // date: "2024-08-18",
    );

    var updateKaizensModelJsonString = createkaizensdataModel.toJson();

    Map<String, dynamic>? responseCreateGoModel =
        await createkaizensdataPresenter.updateKaizenDetails(
      updateKaizen: updateKaizensModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      print("data fail ");
    }
  }

  void checkForm() {
    if (KaizensImplementedCtrl.text.trim() == '') {
      isKaizensImplementedInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (CostForImplementationCtrl.text.trim() == '') {
      isCostForImplementationInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (CostSavedFromImplementationCtrl.text.trim() == '') {
      isCostSavedFromImplementationInvalid.value = true;
      isFormInvalid.value = true;
    }
  }
}
