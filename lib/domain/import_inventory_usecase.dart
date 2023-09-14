import 'dart:typed_data';

import 'package:cmms/domain/domain.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ImportInventoryUsecase {
  final Repository repository;

  ImportInventoryUsecase(this.repository);

  Future<bool> browseFiles(Uint8List? fileBytes, String fileName,
      int importType, bool isLoading, int facilityId) async {
    await repository.browseFiles(
        fileBytes, fileName, importType, isLoading, facilityId);
    return true;
  }
}
