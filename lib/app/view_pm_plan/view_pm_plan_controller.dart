import 'dart:async';

import 'package:cmms/app/controllers/history_controller.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_pm_plan/view_pm_plan_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ViewPmPlanController extends GetxController {
  ///
  ViewPmPlanController(
    this.viewPmPlanPresenter,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;

  var historyController = Get.put(HistoryController());
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  ViewPmPlanPresenter viewPmPlanPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  Rx<int> pmPlanId = 0.obs;
  Rx<bool> isFormInvalid = false.obs;

  Rx<PMPlanDetail?> pmPlanDetailsModel = PMPlanDetail().obs;

  @override
  void onInit() async {
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
        // getPmPlanDetails(
        //     pmPlanId: pmPlanId.value, isloading: true, facilityId: facilityId);
      }
    });
    try {
      await setPMPlanId();
      if (pmPlanId != 0) {
        print({"fghvjbggjhjgk", pmPlanId});

        await getPmPlanDetails(
            pmPlanId: pmPlanId.value, isloading: true, facilityId: facilityId);
        await getHistory(facilityId);
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
      Utility.showDialog(e.toString(), 'pmPlanId');
    }
  }

  Future<void> getPmPlanDetails(
      {int? pmPlanId, bool? isloading, required int facilityId}) async {
    final _pmPlanDetailsModel = await viewPmPlanPresenter.getPmPlanDetails(
        facilityId: facilityId, pmPlanId: pmPlanId, isLoading: isloading);

    if (_pmPlanDetailsModel != null) {
      pmPlanDetailsModel.value = _pmPlanDetailsModel;
    }
    print({"pmPlandetailss", pmPlanDetailsModel.value?.plan_name});
  }

  Future<void> checkformapp() async {
    if (approveCommentTextFieldCtrlr.text == '') {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<void> checkformrej() async {
    if (rejectCommentTextFieldCtrlr.text == '') {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  void pmPlanApprovedButton({int? id}) async {
    {
      await checkformapp();
      if (isFormInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
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
      await checkformrej();
      if (isFormInvalid.value == true) {
        Fluttertoast.showToast(msg: "Please Enter Comment!");
        return;
      }
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

  Future<void> getHistory(int facilityId) async {
    int moduleType = 26;
    historyList?.value = await viewPmPlanPresenter.getViewPlanHistory(
          moduleType,
          pmPlanId.value,
          facilityId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }
}
