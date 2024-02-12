import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:cmms/domain/usecases/vegetation_list_usecase.dart';

class AddVegetationPresenter {
  AddVegetationPresenter(this.vegetationlistUsecase);
  VegetationlistUsecase vegetationlistUsecase;

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await vegetationlistUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>?> createVegetationPlan({
    createVegetationPlans,
    required bool isLoading,
  }) async {
    return vegetationlistUsecase.createVegetationPlan(
      createVegetationPlans: createVegetationPlans,
      isLoading: isLoading,
    );
  }

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await vegetationlistUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      ); 

   Future<List<VegetationEquipmentModel>> getVegEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return vegetationlistUsecase.getVegEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<VegPlanDetailModel?> getVegPlanDetail({
    bool? isLoading,
    required int planId,
  }) async {
    return vegetationlistUsecase.getVegPlanDetail(
      planId: planId,
      isLoading: isLoading ?? false,
    );
  }
}
