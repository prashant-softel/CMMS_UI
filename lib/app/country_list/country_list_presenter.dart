
import '../../domain/models/blood_model.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/usecases/blood_list_usecase.dart';
import '../../domain/usecases/country_list_usecase.dart';

class CountryListPresenter {
  CountryListPresenter(this.countryUsecase);
  CountrylistUsecase countryUsecase;

  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   bool? isLoading,
  // }) async =>
  //     await countryUsecase.getInventoryCategoryList(
  //       isLoading: isLoading ?? false,
  //     );
  // Future<List<ModuleListModel?>?> getModuleList({
  //   int? facilityId,
  //   int? type,
  //   bool? isLoading,
  // }) async =>
  //     await countryUsecase.getModuleList(
  //       facilityId: facilityId ?? 0,
  //       type: type,
  //       isLoading: isLoading ?? false,
  //     );
  Future<List<CountryModel?>?> getCountryList({

    bool? isLoading,
  }) async =>
      await countryUsecase.getCountryList(
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await countryUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createModulelistNumber({
    modulelistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    countryUsecase.createModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteModulelist(String? module_id, {required bool isLoading}) async =>
      await countryUsecase.deleteModulelist(
        module_id: module_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateModulelistNumber(
      {modulelistJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    countryUsecase.updateModulelistNumber(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
