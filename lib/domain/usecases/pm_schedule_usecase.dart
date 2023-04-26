import 'package:cmms/domain/models/set_pm_schedule_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';
import '../models/inventory_category_model.dart';

class PmScheduleUsecase {
  PmScheduleUsecase(this.repository);
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
}
