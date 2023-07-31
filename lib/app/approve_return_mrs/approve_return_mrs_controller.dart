import 'package:cmms/app/approve_return_mrs/approve_return_mrs_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:flutter/cupertino.dart';
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
  int mrsId = 0;
  Rx<MrsDetailsModel?> mrsDetailsModel = MrsDetailsModel().obs;
  String whereUsedType = "";
  var commentCtrlr = TextEditingController();

  ///
  @override
  void onInit() async {
    mrsId = Get.arguments;
    print('mrsId:$mrsId');
    if (mrsId != 0) {
      await getMrsDetails(mrsId: mrsId, isloading: true);
    }
    super.onInit();
  }

  Future<void> getMrsDetails({int? mrsId, bool? isloading}) async {
    final _mrsDetailsModel = await approveReturnMrsPresenter.getMrsDetails(
        mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      mrsDetailsModel.value = _mrsDetailsModel;
      whereUsedType = mrsDetailsModel.value?.whereUsedType == 1 ? "JC" : "PM";
    }
    // print({"mrsdetailss", mrsDetailsModel});
  }

  approveMrs() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: mrsId, comment: _comment);

      var approvetoJsonString = commentModel.toJson();
      final response = await approveReturnMrsPresenter.approveMrs(
        approvetoJsonString: approvetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.mrsListScreen);
      }
    }
  }

  rejectMrs() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: mrsId, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await approveReturnMrsPresenter.rejectMrs(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.mrsListScreen);
      }
    }
  }
}
