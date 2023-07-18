import 'package:cmms/app/mrs_issue/mrs_issue_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../navigators/navigators.dart';

class MrsIssueController extends GetxController {
  ///
  MrsIssueController(
    this.mrsIssuePresenter,
  );
  MrsIssuePresenter mrsIssuePresenter;
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
    final _mrsDetailsModel = await mrsIssuePresenter.getMrsDetails(
        mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      mrsDetailsModel.value = _mrsDetailsModel;
      whereUsedType = mrsDetailsModel.value?.whereUsedType == 1 ? "JC" : "PM";
    }
    // print({"mrsdetailss", mrsDetailsModel});
  }

  rejectMrs() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel = CommentModel(id: mrsId, comment: _comment);

      var rejecttoJsonString = commentModel.toJson();
      final response = await mrsIssuePresenter.rejectMrs(
        rejecttoJsonString: rejecttoJsonString,
        isLoading: true,
      );
      if (response == true) {
        Get.offAllNamed(Routes.mrsListScreen);
      }
    }
  }
}
