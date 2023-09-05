import 'package:cmms/app/issue_mrs_approve_reject/issue_mrs_approve_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../domain/models/comment_model.dart';
import '../home/home_controller.dart';

class IssueMrsApproveController extends GetxController {
  ///
  IssueMrsApproveController(
    this.issuemrsApprovePresenter,
  );
  IssueMrsApprovePresenter issuemrsApprovePresenter;
  final HomeController homecontroller = Get.find();
  Rx<int> mrsId = 0.obs;
  Rx<MrsDetailsModel?> mrsDetailsModel = MrsDetailsModel().obs;
  String whereUsedType = "";
  var commentCtrlr = TextEditingController();

  ///
  @override
  void onInit() async {
    try {
      await setMrsId();
      if (mrsId != 0) {
        await getMrsDetails(mrsId: mrsId.value, isloading: true);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _flutterSecureStorage = const FlutterSecureStorage();
      // Read jobId
      String? _mrsId = await _flutterSecureStorage.read(key: "mrsId");
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        await _flutterSecureStorage.write(
          key: "mrsId",
          value: mrsId.value == null ? '' : mrsId.value.toString(),
        );
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "mrsId");
    } catch (e) {
      Utility.showDialog(e.toString() + 'mrsId');
    }
  }

  Future<void> getMrsDetails({int? mrsId, bool? isloading}) async {
    final _mrsDetailsModel = await issuemrsApprovePresenter.getMrsDetails(
        mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      mrsDetailsModel.value = _mrsDetailsModel;
      // whereUsedType = mrsDetailsModel.value?.whereUsedType == 1 ? "JC" : "PM";
    }
    // print({"mrsdetailss", mrsDetailsModel});
  }

  approveIssueMrs() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: mrsId.value, comment: _comment);

      var issuemrsapprovetoJsonString = commentModel.toJson();
      final response = await issuemrsApprovePresenter.approveIssueMrs(
        issuemrsapprovetoJsonString: issuemrsapprovetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "mrsId");
        Get.offAllNamed(Routes.mrsListScreen);
      }
    }
  }

  rejectIssueMrs() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: mrsId.value, comment: _comment);

      var rejectIssuetoJsonString = commentModel.toJson();
      final response = await issuemrsApprovePresenter.rejectIssueMrs(
        rejectIssuetoJsonString: rejectIssuetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "mrsId");
        Get.offAllNamed(Routes.mrsListScreen);
      }
    }
  }
}
