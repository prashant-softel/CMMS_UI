import 'dart:typed_data';

import 'package:cmms/domain/domain.dart';

class ImportInventoryUsecase {
  final Repository repository;

  ImportInventoryUsecase(this.repository);

  Future<bool> browseFiles(Uint8List? fileBytes, String fileName,
      int importType, bool isLoading, int facilityId) async {
    await repository.browseFiles(
        fileBytes, fileName, importType, isLoading, facilityId);
    return true;
  }

  void saveValue({String? importType}) async =>
      repository.saveValue(LocalKeys.importType, importType);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.importType);
}
