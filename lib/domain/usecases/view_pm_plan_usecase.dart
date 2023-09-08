import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';

import 'package:cmms/domain/repositories/repository.dart';

class ViewPmPlanUsecase {
  ViewPmPlanUsecase(this.repository);
  Repository repository;
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );
}
