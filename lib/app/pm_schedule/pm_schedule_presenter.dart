import 'package:cmms/domain/models/set_pm_schedule_model.dart';

import '../../../domain/models/inventory_category_model.dart';
import '../../../domain/usecases/pm_schedule_usecase.dart';
import '../../domain/models/frequency_model.dart';

class PmSchedulePresenter {
  PmSchedulePresenter(this.pmScheduleUsecase);
  PmScheduleUsecase pmScheduleUsecase;
  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await pmScheduleUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<GetPmScheduleListModel?>?> getPMScheduleData({
    int? facilityId,
    int? selectedEquipmentId,
    bool? isLoading,
  }) async =>
      await pmScheduleUsecase.getPMScheduleData(
        facilityId: facilityId ?? 0,
        selectedEquipmentId: selectedEquipmentId,
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await pmScheduleUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<List<dynamic>> savePmSchedule({
    pmScheduleJsonString,
    required bool isLoading,
  }) async {
    return pmScheduleUsecase.savePmSchedule(
      pmScheduleJsonString: pmScheduleJsonString,
      isLoading: isLoading,
    );
  }
}
