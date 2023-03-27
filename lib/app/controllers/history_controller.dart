import 'package:get/get.dart';

import '../../domain/repositories/local_storage_keys.dart';
import '../../domain/repositories/repository.dart';

class HistoryController extends GetxController {
  ///
  var repository = Get.find<Repository>();
  var token = '';

  ///
  @override
  void onInit() async {
    token = await repository.getSecureValue(LocalKeys.authToken);
    super.onInit();
  }

  getHistory(int? moduleType, int? id) {
    repository.getHistory(moduleType, id, true);
  }

  ///
}
