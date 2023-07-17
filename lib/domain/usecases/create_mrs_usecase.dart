import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateMrsUsecase {
  CreateMrsUsecase(this.repository);
  Repository repository;
  Future<List<GetAssetItemsModel?>?> getEquipmentList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getEquipmentAssetsList(
        facilityId,
        isLoading,
      );
  Future<Map<String, dynamic>> createMrs({
    createMrsJsonString,
    bool? isLoading,
  }) async =>
      await repository.createMrs(
        createMrsJsonString,
        isLoading,
      );
}
