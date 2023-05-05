import 'dart:typed_data';

import 'package:get/get.dart';

import 'import_inventory_presenter.dart';

class ImportInventoryController extends GetxController {
  ///
  ImportInventoryController(
    this.importInventoryPresenter,
  );
  ImportInventoryPresenter importInventoryPresenter;
  RxString fileName = "".obs;
  Uint8List? fileBytes;

  int type = 0;
  @override
  void onInit() async {
    type = Get.arguments;
    super.onInit();
  }

  Future<bool> browseFiles({Uint8List? fileBytes}) async {
    await importInventoryPresenter.browseFiles(fileBytes, fileName.value, true);
    return true;
  }
}
