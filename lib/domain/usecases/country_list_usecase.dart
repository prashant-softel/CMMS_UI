import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/country_model.dart';
import '../models/frequency_model.dart';

class CountrylistUsecase {
  CountrylistUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(auth, facilityId, isLoading, 0);

  Future<List<CountryModel?>?> getCountryList({
    // int? type,
    // int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getCountryList(
        // type,
        // facilityId,
        isLoading,
      );

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createModulelistNumber({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createModuleListNumber(
          isLoading: isLoading, modulelistJsonString: modulelistJsonString);
  deleteModulelist(
          {required Object module_id, required bool isLoading}) async =>
      await repository.deleteModulelist(
        module_id,
        isLoading,
      );
  Future<bool> updateModulelistNumber({
    modulelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateModulelistNumber(
        isLoading: isLoading,
        modulelistJsonString: modulelistJsonString,
      );
}
