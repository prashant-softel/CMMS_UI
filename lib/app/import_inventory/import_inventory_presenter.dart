import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'dart:typed_data';

import '../../domain/import_inventory_usecase.dart';

class ImportInventoryPresenter {
  ImportInventoryPresenter(this.importInventoryUsecase);
  ImportInventoryUsecase importInventoryUsecase;

  Future<bool> browseFiles(Uint8List? fileBytes, String fileName,
      int importType, bool isLoading, int facilityId) async {
    await importInventoryUsecase.browseFiles(
        fileBytes, fileName, importType, isLoading, facilityId);
    return true;
  }
}
