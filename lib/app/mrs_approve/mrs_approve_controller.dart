import 'dart:async';

import 'package:cmms/app/mrs_approve/mrs_approve_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../domain/models/comment_model.dart';
import '../home/home_controller.dart';

class MrsApproveController extends GetxController {
  ///
  MrsApproveController(
    this.mrsApprovePresenter,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;
  MrsApprovePresenter mrsApprovePresenter;
  final HomeController homecontroller = Get.find();
  Rx<int> mrsId = 0.obs;
  Rx<MrsDetailsModel?> mrsDetailsModel = MrsDetailsModel().obs;
  String whereUsedType = "";
  Rx<bool> isFormInvalid = false.obs;
  var commentCtrlr = TextEditingController();
  Rx<int> type = 0.obs;

  ///
  @override
  void onInit() async {
    try {
      await setMrsId();
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          isFacilitySelected.value = true;
          if (mrsId.value != 0) {
            await getMrsDetails(
                mrsId: mrsId.value, isloading: true, facilityId: facilityId);
          }
        }
      });
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await mrsApprovePresenter.getValue();
      final _type = await mrsApprovePresenter.getValuee();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        type.value = dataFromPreviousScreen['type'];
        mrsApprovePresenter.saveValue(mrsId: mrsId.value.toString());
        mrsApprovePresenter.saveValuee(type: type.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
        type.value = int.tryParse(_type!) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'mrsId');
    }
  }

  Future<void> getMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _mrsDetailsModel = await mrsApprovePresenter.getMrsDetails(
        facilityId: facilityId, mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      mrsDetailsModel.value = _mrsDetailsModel;
      // whereUsedType = mrsDetailsModel.value?.whereUsedType == 1 ? "JC" : "PM";
    }
    // print({"mrsdetailss", mrsDetailsModel});
  }

  void checkform() {
    if (commentCtrlr.text == '') {
      Fluttertoast.showToast(msg: 'Enter Comment!');
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  void clearStoreData() {
    mrsApprovePresenter.clearValue();
  }

  void clearStoreDataa() {
    mrsApprovePresenter.clearValuee();
  }

  approveMrs() async {
    {
      checkform();
      if (isFormInvalid.value) {
        return;
      }
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: mrsId.value, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await mrsApprovePresenter.approveMrs(
          approvetoJsonString: approvetoJsonString,
          type: type.value,
          isLoading: true,
          facility_id: facilityId);
      if (response == true) {
        // final _flutterSecureStorage = const FlutterSecureStorage();

        // _flutterSecureStorage.delete(key: "mrsId");
        // Get.offAllNamed(Routes.mrsListScreen);
      }
    }
  }

  rejectMrs() async {
    {
      checkform();
      if (isFormInvalid.value) {
        return;
      }
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: mrsId.value, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await mrsApprovePresenter.rejectMrs(
          rejecttoJsonString: rejecttoJsonString,
          isLoading: true,
          facility_id: facilityId);
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "mrsId");
        Get.offAllNamed(Routes.mrsListScreen);
      }
    }
  }
}
