import 'package:get/get.dart';

import '../../domain/models/history_model.dart';
import 'calibration_history_presenter.dart';

class CalibrationHistoryController extends GetxController {
  ///
  CalibrationHistoryController(
    this.calibrationHistoryPresenter,
  );
  CalibrationHistoryPresenter calibrationHistoryPresenter;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  @override
  void onInit() async {
    getHistory();

    super.onInit();
  }

  Future<void> getHistory() async {
    int moduleType = 101;
    int Id = 1;
    historyList?.value = await calibrationHistoryPresenter.getJobCardHistory(
          moduleType,
          Id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }
}
