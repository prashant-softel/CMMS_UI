import 'dart:async';
import 'package:cmms/app/approve_return_mrs/approve_return_mrs_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../domain/models/comment_model.dart';
import '../home/home_controller.dart';

class ApproveReturnMrsController extends GetxController {
  ///
  ApproveReturnMrsController(
    this.approveReturnMrsPresenter,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;
  ApproveReturnMrsPresenter approveReturnMrsPresenter;
  final HomeController homecontroller = Get.find();
  Rx<int> mrsId = 0.obs;
  Rx<int> type = 0.obs;

  Rx<ReturnMrsDetailsModel?> returnMrsDetailsModel =
      ReturnMrsDetailsModel().obs;
  String whereUsedType = "";
  var commentCtrlr = TextEditingController();
  Rx<bool> isFormInvalid = false.obs;

  ///
  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          isFacilitySelected.value = true;
        }
      });
      await setMrsId();
      if (mrsId != 0) {
        await getReturnMrsDetails(
            mrsId: mrsId.value, isloading: true, facilityId: facilityId);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    final String? _mrsId = Get.parameters['mrsId'];
    final String? _type = Get.parameters['type'];

    mrsId.value = int.tryParse(_mrsId ?? "") ?? 0;
    type.value = int.tryParse(_type ?? "") ?? 0;

    // try {
    //   final _mrsId = await approveReturnMrsPresenter.getValue();
    //   if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
    //     var dataFromPreviousScreen = Get.arguments;

    //     mrsId.value = dataFromPreviousScreen['mrsId'];
    //     type.value = dataFromPreviousScreen['type'];
    //     approveReturnMrsPresenter.saveValue(mrsId: mrsId.value.toString());
    //     approveReturnMrsPresenter.saveValuee(type: type.value.toString());
    //   } else {
    //     mrsId.value = int.tryParse(_mrsId) ?? 0;
    //   }
    // } catch (e) {
    //   Utility.showDialog(e.toString(), 'mrsId');
    // }
  }

  Future<void> getReturnMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _returnMrsrsDetailsModel =
        await approveReturnMrsPresenter.getReturnMrsDetails(
            mrsId: mrsId, isLoading: isloading, facilityId: facilityId);

    if (_returnMrsrsDetailsModel != null) {
      returnMrsDetailsModel.value = _returnMrsrsDetailsModel;
      whereUsedType = returnMrsDetailsModel.value?.whereUsedType == 1
          ? "JC"
          : returnMrsDetailsModel.value?.whereUsedType == 2
              ? "PM"
              : "";
    }
    // print({"mrsdetailss", returnMrsDetailsModel.value});
  }

  approveReturnMrs() async {
    {
      checkform();
      if (isFormInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: mrsId.value, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await approveReturnMrsPresenter.approveReturnMrs(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.returnMrsList);
      }
    }
  }

  void checkform() {
    if (commentCtrlr.text == '') {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  rejectRetrunMrs() async {
    {
      checkform();
      if (isFormInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: mrsId.value, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await approveReturnMrsPresenter.rejectRetrunMrs(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "mrsId");
        Get.offAllNamed(Routes.returnMrsList);
      }
    }
  }
}
