import 'dart:typed_data';

import 'package:cmms/domain/domain.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ImportInventoryUsecase {
  final Repository repository;

  ImportInventoryUsecase(this.repository);

  Future<bool> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading, int importType) async {
    await repository.browseFiles(
      fileBytes,
      fileName,
      isLoading,
      importType
    );
    return true;
  }
}
