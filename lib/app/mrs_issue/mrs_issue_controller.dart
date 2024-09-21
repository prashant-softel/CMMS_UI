import 'dart:async';

import 'package:cmms/app/mrs_issue/mrs_issue_presenter.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/models/issue_mrs_model.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../navigators/navigators.dart';

class MrsIssueController extends GetxController {
  MrsIssueController(this.mrsIssuePresenter);

  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFormValid = false.obs;
  Rx<bool> isFacilitySelected = true.obs;
  MrsIssuePresenter mrsIssuePresenter;
  final HomeController homecontroller = Get.find();
  Rx<int> mrsId = 0.obs;
  Rx<int> type = 0.obs;
  Rx<MrsDetailsModel?> mrsDetailsModel = MrsDetailsModel().obs;
  RxList<GetAssetItemsModel?> cmmrsItemsDetail = <GetAssetItemsModel>[].obs;
  String whereUsedType = "";
  var commentCtrlr = TextEditingController();
  var controllers = <TextEditingController>[].obs;
  var errorMessages = <String?>[].obs;
  Rx<bool> isFormInvalid = false.obs;

  @override
  void onInit() async {
    try {
      await setMrsId();
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          isFacilitySelected.value = true;
        }
        if (mrsId != 0) {
          getMrsDetails(
              mrsId: mrsId.value, isloading: true, facilityId: facilityId);
        }
      });
      for (int i = 0; i < 5; i++) {
        // Assuming 5 rows for the example
        controllers.add(TextEditingController());
        errorMessages.add(null);
        controllers[i].addListener(() => clearErrorMessage(i));
      }

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  void clearErrorMessage(int index) {
    if (index < errorMessages.length) {
      errorMessages[index] = null;
    }
  }

  String? validateField(String? value, int index) {
    if (value == null || value.isEmpty) {
      errorMessages[index] = 'Please enter';
      return errorMessages[index];
    }
    return null;
  }

  void validateForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      // All validations passed
      // Make your API call here
    } else {
      // Validation failed
      // Show an error message or handle the error
    }
  }

  @override
  void onClose() {
    // Dispose controllers
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await mrsIssuePresenter.getValue();
      final _type = await mrsIssuePresenter.getValuee();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;
        mrsId.value = dataFromPreviousScreen['mrsId'];
        type.value = dataFromPreviousScreen['type'];
        mrsIssuePresenter.saveValue(mrsId: mrsId.value.toString());
        mrsIssuePresenter.saveValuee(type: type.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
        type.value = int.tryParse(_type ?? '') ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'mrsId');
    }
  }

  void clearStoreData() {
    mrsIssuePresenter.clearValue();
  }

  void clearStoreDataa() {
    mrsIssuePresenter.clearValuee();
  }

  Future<void> getMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _mrsDetailsModel = await mrsIssuePresenter.getMrsDetails(
        facilityId: facilityId, mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      mrsDetailsModel.value = _mrsDetailsModel;
      cmmrsItemsDetail.value = _mrsDetailsModel.cmmrsItems ?? [];
    }
  }

  void checkform() {
    if (commentCtrlr.text == '') {
      Fluttertoast.showToast(msg: 'Enter Comment!');
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  issueMrs() async {
    {
      checkform();
      if (isFormInvalid.value) {
        return;
      }
      String _comment = commentCtrlr.text.trim();
      List<CmmrsItemsModel> cmmrsItems = <CmmrsItemsModel>[];
      cmmrsItemsDetail.forEach((element) {
        cmmrsItems.add(CmmrsItemsModel(
            mrs_item_id: element?.id ?? 0,
            serial_number: element?.serial_number_controller?.text ?? "",
            asset_item_ID: element?.asset_item_ID ?? 0,
            issued_qty:
                int.tryParse(element!.issued_qty_controller!.text) ?? 0));
      });
      IssueMrsModel issueMrs = IssueMrsModel(
          issue_comment: _comment, ID: mrsId.value, cmmrsItems: cmmrsItems);
      var issuetoJsonString = issueMrs.toJson();
      final response = await mrsIssuePresenter.issueMrs(
          type: type.value,
          issuetoJsonString: issuetoJsonString,
          isLoading: true,
          facility_id: facilityId,
          route: mrsDetailsModel.value?.whereUsedRefID);
      if (response == true) {
        // Get.offAllNamed(Routes.mrsListScreen);
      } else {
        Utility.showDialog("Issue", "Please fill all the required fields");
      }
    }
  }
}
