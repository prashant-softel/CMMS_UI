import 'package:cmms/app/approve_return_mrs/approve_return_mrs_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../domain/models/comment_model.dart';
import '../home/home_controller.dart';

class ApproveReturnMrsController extends GetxController {
  ///
  ApproveReturnMrsController(
    this.approveReturnMrsPresenter,
  );
  ApproveReturnMrsPresenter approveReturnMrsPresenter;
  final HomeController homecontroller = Get.find();
  Rx<int> mrsId = 0.obs;

  Rx<ReturnMrsDetailsModel?> returnMrsDetailsModel =
      ReturnMrsDetailsModel().obs;
  String whereUsedType = "";
  var commentCtrlr = TextEditingController();

  ///
  @override
  void onInit() async {
    try {
      await setMrsId();
      if (mrsId != 0) {
        await getReturnMrsDetails(mrsId: mrsId.value, isloading: true);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await approveReturnMrsPresenter.getValue();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        approveReturnMrsPresenter.saveValue(mrsId: mrsId.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'mrsId');
    }
  }

  Future<void> getReturnMrsDetails({int? mrsId, bool? isloading}) async {
    final _returnMrsrsDetailsModel = await approveReturnMrsPresenter
        .getReturnMrsDetails(mrsId: mrsId, isLoading: isloading);

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

  rejectRetrunMrs() async {
    {
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
