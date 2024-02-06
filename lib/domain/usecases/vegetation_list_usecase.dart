import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class VegetationlistUsecase {
  VegetationlistUsecase(this.repository);
  Repository repository;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<List<VegetationPlanListModel>> getVegetationPlanList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return repository.getVegetationPlanList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToList(
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

  Future<Map<String, dynamic>> createVegetationPlan({
    createMcPlans,
    bool? isLoading,
  }) async =>
      await repository.createVegetationPlan(
        createMcPlans,
        isLoading,
      );

  Future<List<VegetationEquipmentModel>> getVegEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return repository.getVegEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
