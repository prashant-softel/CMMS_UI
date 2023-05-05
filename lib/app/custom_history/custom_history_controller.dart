import 'package:get/get.dart';

import '../../domain/models/history_model.dart';
import 'custom_history_presenter.dart';

class CustomHistoryController extends GetxController {
  ///
  CustomHistoryController(
    this.customHistoryPresenter,
  );
  CustomHistoryPresenter customHistoryPresenter;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  @override
  void onInit() async {
    getHistory();

    super.onInit();
  }

  Future<void> getHistory() async {
    int moduleType = 21;
    int Id = 5326;
    historyList?.value = await customHistoryPresenter.getJobCardHistory(
          moduleType,
          Id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }
}
