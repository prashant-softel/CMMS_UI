import 'package:get/get.dart';

import 'import_inventory_presenter.dart';

class ImportInventoryController extends GetxController {
  ///
  ImportInventoryController(
    this.importInventoryPresenter,
  );
  ImportInventoryPresenter importInventoryPresenter;
  RxString fileName = "".obs;
  int type = 0;
  @override
  void onInit() async {
    type = Get.arguments;
    print({"types", type});
    super.onInit();
  }
}
