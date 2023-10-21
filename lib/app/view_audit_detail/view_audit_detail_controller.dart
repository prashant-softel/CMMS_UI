import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_audit_detail/view_audit_detail_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ViewAuditDetailController extends GetxController {
  ///
  ViewAuditDetailController(
    this.viewAuditDetailPresenter,
  );
  ViewAuditDetailPresenter viewAuditDetailPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();
  Rx<int> pmPlanId = 0.obs;
  Rx<PMPlanDetail?> pmPlanDetailsModel = PMPlanDetail().obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  @override
  void onInit() async {
    try {
      //  await setPMPlanId();
      // if (pmPlanId != 0) {
      //   print({"fghvjbggjhjgk", pmPlanId});

      //   await getPmPlanDetails(pmPlanId: pmPlanId.value, isloading: true);
      // }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setPMPlanId() async {
    try {
      final _flutterSecureStorage = const FlutterSecureStorage();
      // Read jobId
      String? _pmPlanId = await _flutterSecureStorage.read(key: "pmPlanId");
      if (_pmPlanId == null || _pmPlanId == '' || _pmPlanId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        pmPlanId.value = dataFromPreviousScreen['pmPlanId'];
        await _flutterSecureStorage.write(
          key: "pmPlanId",
          value: pmPlanId.value == null ? '' : pmPlanId.value.toString(),
        );
      } else {
        pmPlanId.value = int.tryParse(_pmPlanId) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "pmPlanId");
    } catch (e) {
      Utility.showDialog(e.toString() + 'pmPlanId');
    }
  }
}
