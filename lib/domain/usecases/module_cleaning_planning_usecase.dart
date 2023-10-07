import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';

class ModuleCleaningPlanningUsecase {
  final Repository repository;

  ModuleCleaningPlanningUsecase(this.repository);
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return repository.getEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
