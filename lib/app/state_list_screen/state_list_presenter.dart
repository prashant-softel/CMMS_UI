import 'package:cmms/domain/models/set_pm_schedule_model.dart';

import '../../../domain/models/inventory_category_model.dart';
import '../../../domain/usecases/pm_schedule_usecase.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/state.dart';
import '../../domain/models/state_model.dart';
import '../../domain/usecases/state_list_usecase.dart';

class StateListPresenter {
  StateListPresenter(this.statelistUsecase);
  StatelistUsecase statelistUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await statelistUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<CountryState?>?> getStateList({
    // int? facilityId,
    int? selectedCountryId,
    // bool? isLoading,
  }) async =>
      await statelistUsecase.getStateList(
        selectedCountryId: selectedCountryId,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await statelistUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<List<dynamic>> savePmSchedule({
    pmScheduleJsonString,
    required bool isLoading,
  }) async {
    return statelistUsecase.savePmSchedule(
      pmScheduleJsonString: pmScheduleJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<CountryModel?>?> getCountryList({
    bool? isLoading,
  }) async =>
      await statelistUsecase.getCountryList(
        isLoading: isLoading ?? false,
      );
}
