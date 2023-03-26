import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/facility_model.dart';
import '../models/frequency_model.dart';

class CreatePreventiveChecklistUsecase {
  CreatePreventiveChecklistUsecase(this.repository);
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
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createChecklistNumber({
    checklistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createCheckListNumber(isLoading: isLoading,checklistJsonString:checklistJsonString);
     Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);
   
}
