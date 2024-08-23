import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class VegetationlistUsecase {
  VegetationlistUsecase(this.repository);
  Repository repository;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<List<VegetationPlanListModel>> getVegetationPlanList({
    required bool isLoading,
    required int? facility_id,
    bool? isExport,
  }) async {
    return repository.getVegetationPlanList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
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
    createVegetationPlans,
    bool? isLoading,
  }) async =>
      await repository.createVegetationPlan(
        createVegetationPlans,
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

  Future<List<EmployeeModel?>?> getAssignedToEmployee({
    String? auth,
    int? facilityId,
    int? featureId,
    int? isattendanceneeded,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToListWOAttend(
        auth,
        facilityId,
        featureId,
        isattendanceneeded,
        isLoading,
      );

  Future<VegPlanDetailModel?> getVegPlanDetail({
    bool? isLoading,
    required int planId,
    required int facilityId,
  }) async =>
      await repository.getVegPlanDetail(
        planId: planId,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>> updateVegPlan({
    updateVegPlans,
    bool? isLoading,
  }) async =>
      await repository.updateVegPlan(
        updateVegPlans,
        isLoading,
      );

  deleteVegPlan({
    required int planId,
    bool? isLoading,
  }) async =>
      await repository.deleteVegPlan(
        planId: planId,
        isLoading: isLoading,
      );

  void saveValue({String? vegid}) async =>
      repository.saveValue(LocalKeys.vegid, vegid);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.vegid);
  void clearValue() async => repository.clearData(
        LocalKeys.vegid,
      );
}
