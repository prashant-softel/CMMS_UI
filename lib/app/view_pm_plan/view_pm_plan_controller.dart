import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_pm_plan/view_pm_plan_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ViewPmPlanController extends GetxController {
  ///
  ViewPmPlanController(
    this.viewPmPlanPresenter,
  );
  ViewPmPlanPresenter viewPmPlanPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  Rx<int> pmPlanId = 0.obs;
  Rx<PMPlanDetail?> pmPlanDetailsModel = PMPlanDetail().obs;

  @override
  void onInit() async {
    try {
      await setPMPlanId();
      if (pmPlanId != 0) {
        print({"fghvjbggjhjgk", pmPlanId});

        await getPmPlanDetails(pmPlanId: pmPlanId.value, isloading: true);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setPMPlanId() async {
    try {
      // final _flutterSecureStorage = const FlutterSecureStorage();
      // // Read jobId
      // String? _pmPlanId = await _flutterSecureStorage.read(key: "pmPlanId");
      final _pmPlanId = await viewPmPlanPresenter.getValue();

      if (_pmPlanId == null || _pmPlanId == '' || _pmPlanId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        pmPlanId.value = dataFromPreviousScreen['pmPlanId'];
        viewPmPlanPresenter.saveValue(pmPlanId: pmPlanId.value.toString());

        // await _flutterSecureStorage.write(
        //   key: "pmPlanId",
        //   value: pmPlanId.value == null ? '' : pmPlanId.value.toString(),
        // );
      } else {
        pmPlanId.value = int.tryParse(_pmPlanId) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "pmPlanId");
    } catch (e) {
      Utility.showDialog(e.toString() + 'pmPlanId');
    }
  }

  Future<void> getPmPlanDetails({int? pmPlanId, bool? isloading}) async {
    final _pmPlanDetailsModel = await viewPmPlanPresenter.getPmPlanDetails(
        pmPlanId: pmPlanId, isLoading: isloading);

    if (_pmPlanDetailsModel != null) {
      pmPlanDetailsModel.value = _pmPlanDetailsModel;
    }
    print({"pmPlandetailss", pmPlanDetailsModel.value?.plan_name});
  }

  void pmPlanApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentpmPlanAproveModel =
          CommentModel(id: id, comment: _comment);

      var pmPlanApproveJsonString = commentpmPlanAproveModel.toJson();

      Map<String, dynamic>? response =
          await viewPmPlanPresenter.pmPlanApprovedButton(
        pmPlanApproveJsonString: pmPlanApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void pmPlanRejectButton({int? id}) async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentpmPlanRejectModel =
          CommentModel(id: id, comment: _comment);

      var pmPlanRejectJsonString = commentpmPlanRejectModel.toJson();

      Map<String, dynamic>? response =
          await viewPmPlanPresenter.pmPlanRejectButton(
        pmPlanRejectJsonString: pmPlanRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }
}
