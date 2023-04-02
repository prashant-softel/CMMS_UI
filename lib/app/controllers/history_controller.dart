import 'package:get/get.dart';

import '../../domain/models/history_model.dart';
import '../../domain/repositories/local_storage_keys.dart';
import '../../domain/repositories/repository.dart';

class HistoryController extends GetxController {
  ///
  var repository = Get.find<Repository>();
  var token = '';

  ///
  @override
  void onInit() async {
    token = await repository.getSecuredValue(LocalKeys.authToken);
    super.onInit();
  }

  Future<List<HistoryModel>?> getJobCardHistory(
    int? moduleType,
    int? jobCardId,
  ) async {
    var jobCardHistoryList =
        await repository.getJobCardHistory(moduleType, jobCardId, true);
    return jobCardHistoryList;
  }

  ///
}
