import 'dart:async';

import 'package:cmms/app/calibration_view/calibration_view_presenter.dart';
import 'package:cmms/domain/models/calibration_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CalibrationViewController extends GetxController {
  ///
  CalibrationViewController(
    this.calibrationViewPresenter,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  CalibrationViewPresenter calibrationViewPresenter;
  final HomeController homecontroller = Get.find();

  int? calibrationId = 0;
  Rx<CalibrationDetailModel?> calibrationDetailModel =
      CalibrationDetailModel().obs;

  var isToggleOn = false.obs;
  int moduleType = 101;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getCalibrationView(
            calibrationId: calibrationId,
            isloading: true,
            facilityId: facilityId);
      });
    });
    calibrationId = Get.arguments;
    print('calibrationId:$calibrationId');
    if (calibrationId != 0) {
      await getCalibrationView(
          calibrationId: calibrationId,
          isloading: true,
          facilityId: facilityId);
      await getHistory(calibrationId: calibrationId, moduleType: moduleType);
    }

    super.onInit();
  }

  Future<void> getHistory({int? calibrationId, int? moduleType}) async {
    //
    historyList?.value = await calibrationViewPresenter.getHistory(
          moduleType,
          calibrationId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getCalibrationView(
      {int? calibrationId, bool? isloading, required int facilityId}) async {
//calibrationId = 5326;
    final _calibrationDetails =
        await calibrationViewPresenter.getCalibrationView(
            calibrationId: calibrationId,
            isloading: isloading,
            facilityId: facilityId);
    print({"vasddf", _calibrationDetails});
    if (_calibrationDetails != null) {
      calibrationDetailModel.value = _calibrationDetails;
    }
  }

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }
}
