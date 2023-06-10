import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/state.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/blood_model.dart';
import '../models/country_model.dart';
import '../models/frequency_model.dart';
import '../models/modulelist_model.dart';
import '../models/set_pm_schedule_model.dart';
import '../models/state_model.dart';

class StatelistUsecase {
  StatelistUsecase(this.repository);
  Repository repository;

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
  Future<List<GetPmScheduleListModel?>?> getPMScheduleData({
    int? selectedEquipmentId,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPMScheduleData(
        selectedEquipmentId,
        facilityId,
        isLoading,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<List<dynamic>> savePmSchedule({
    pmScheduleJsonString,
    bool? isLoading,
  }) async =>
      await repository.savePmSchedule(
        pmScheduleJsonString,
        isLoading,
      );
  Future<List<CountryState?>?> getStateList({
    // int? type,
    // bool? isLoading,
    int? selectedCountryId

  }) async =>
      await repository.getStateList(
        selectedCountryId!,
      );

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


  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPreventiveCheckList(
        type,
        facilityId,
        isLoading,
      );
  // Future<List<FrequencyModel?>?> getFrequencyList({
  //   bool? isLoading,
  // }) async =>
  //     await repository.getFrequencyList(
  //       isLoading,
  //     );
  Future<bool> createChecklistNumber({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createCheckListNumber(
          isLoading: isLoading, checklistJsonString: checklistJsonString);
  deleteCkecklist(
      {required Object checklist_id, required bool isLoading}) async =>
      await repository.deleteCkecklist(
        checklist_id,
        isLoading,
      );
  Future<bool> updateChecklistNumber({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateChecklistNumber(
        isLoading: isLoading,
        checklistJsonString: checklistJsonString,
      );

}
