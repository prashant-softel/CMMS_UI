// ignore: unused_import
import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/create_kaizens/create_kaizens_presenter.dart';
import 'package:cmms/app/create_kaizens/widgets/kaizen_created_dialog.dart';
import 'package:cmms/domain/models/create_kaizens_model.dart';
import 'package:cmms/domain/models/get_kaizensdata_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
    RxInt type = 0.obs;
  var KaizensDateTc = TextEditingController();

  int selectedMonth = 0;
  int selectedYear = 0;
  //createkaizensdata
  var selectedMonthnamectrl = TextEditingController();
  var selectedYearctrl = TextEditingController();
  var KaizensImplementedCtrl = TextEditingController();
  var CostForImplementationCtrl = TextEditingController();
  var CostSavedFromImplementationCtrl = TextEditingController();

  Rx<bool> isKaizensImplementedInvalid = false.obs;
  Rx<bool> isCostForImplementationInvalid = false.obs;
  Rx<bool> isCostSavedFromImplementationInvalid = false.obs;

  static void showAlertDialog({
    int? kaizenId,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
        KaizenCreatedDialog(kaizenId: kaizenId, message: message));
  }
  void createkaizensdata({required int monthId, required int year}) async {
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
        month_id: monthId,
        year: year,
        // date:"2024-08-18",
      );

      // Convert the CreateKaizensModel instance to JSON
      var createKaizenDataModelFromJson = createkaizensdataModel.toJson();
      print(createKaizenDataModelFromJson);
      // Call the createkaizensdata function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responseCreateKaizensModel =
          await createkaizensdataPresenter.createkaizensdata(
        createkaizensdata: createKaizenDataModelFromJson,
        isLoading: true,
      );

      // Handle the response
      if (responseCreateKaizensModel == null) {
        // Handle the null response case
      }
      //   Map<String, dynamic>? responseMapKaizensCreated =
      //     await createkaizensdataPresenter.createkaizensdata(
      //   createkaizensdata: createkaizensdataModel,
      //   isLoading: true,
      // );
      // (responseCreateKaizensModel != null)
       else {
        var _kaizenId = 0;
        var _message = '';
        if (responseCreateKaizensModel["KaizensType"] != null &&
            responseCreateKaizensModel["KaizensType"].isNotEmpty) {
          _kaizenId = responseCreateKaizensModel["KaizensType"][0];
        }
        if (responseCreateKaizensModel["message"] != null) {
          _message = responseCreateKaizensModel["message"];
        }
        showAlertDialog(kaizenId: _kaizenId, message: _message);
      }
     
      print('Create create kaizens data: $createKaizenDataModelFromJson');
    } catch (e) {
      print(e);
    }
  }
  

  // update API
  @override
  void onInit() async {
    try {
      await setKDId();
      selectedItem!.id == 0
          ? KaizensDateTc.text = ""
          : KaizensDateTc.text =
              "${DateFormat.MMMM().format(DateTime(0, selectedItem!.month_id ?? 0))} ${selectedItem!.year}";
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
        type.value = dataFromPreviousScreen['type'];
      } else {
        selectedItem = GetKaizensDataList(
          id: 0,
          kaizensImplemented: 0,
          costForImplementation: 0,
          costSavedFromImplementation: 0,
          month_name: '',
          year: 0,
        );
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
        selectedMonthnamectrl.text = selectedItem!.month_id.toString();
        selectedYearctrl.text = selectedItem!.year.toString();
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
    createkaizensdataPresenter.clearValue();
  }

  void updateKaizenDetails() async {
    int _id = selectedItem?.id ?? 0;

    // Get the entered data from the text fields
    int _KaizensImplementedCtrl =
        int.tryParse(KaizensImplementedCtrl.text.trim()) ?? 0;
    int _CostForImplementationCtrl =
        int.tryParse(CostForImplementationCtrl.text.trim()) ?? 0;
    int _CostSavedFromImplementationCtrl =
        int.tryParse(CostSavedFromImplementationCtrl.text.trim()) ?? 0;

    // If the month and year are not changed, fallback to selectedItem's values
    int _monthId = selectedMonth != (selectedItem?.month_id ?? 0)
        ? selectedMonth
        : selectedItem?.month_id ?? 0;

    int _year = selectedYear != (selectedItem?.year ?? 0)
        ? selectedYear
        : selectedItem?.year ?? 0;

    // Ensure that the month and year are correctly assigned to their respective fields in the model
    CreateKaizensModel createkaizensdataModel = CreateKaizensModel(
      id: _id,
      KaizensImplemented: _KaizensImplementedCtrl,
      CostForImplementation: _CostForImplementationCtrl,
      CostSavedFromImplementation: _CostSavedFromImplementationCtrl,
      month_id: _monthId, // Use the new month or fallback to original
      year: _year, // Use the new year or fallback to original
    );

    // Converting the model to JSON format
    var updateKaizensModelJsonString = createkaizensdataModel.toJson();

    // Calling the updateKaizenDetails method in the presenter
    Map<String, dynamic>? responseCreateGoModel =
        await createkaizensdataPresenter.updateKaizenDetails(
      updateKaizen: updateKaizensModelJsonString,
      isLoading: true,
    );

    // Handling the response from the API
    if (responseCreateGoModel == null) {
      print("Update failed");
    } else {
      print("Update successful");
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