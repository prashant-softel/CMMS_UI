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

  Future<Map<String, dynamic>?> createVegetationPlan(
      {createVegetationPlans,
      required bool isLoading,
      int? facility_Id}) async {
    return vegetationlistUsecase.createVegetationPlan(
        createVegetationPlans: createVegetationPlans,
        isLoading: isLoading,
        facility_Id: facility_Id);
  }

  Future<List<EmployeeModel?>?> getAssignedToEmployee({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await vegetationlistUsecase.getAssignedToEmployee(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId,
        isLoading: isLoading ?? false,
      );

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
    required int facilityId,
  }) async {
    return vegetationlistUsecase.getVegPlanDetail(
      planId: planId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> updateVegPlan(
      {updateVegPlans, required bool isLoading, int? facilityId}) async {
    return vegetationlistUsecase.updateVegPlan(
        updateVegPlans: updateVegPlans,
        isLoading: isLoading,
        facilityId: facilityId);
  }

  void saveValue({String? vegid}) async {
    return vegetationlistUsecase.saveValue(vegid: vegid);
  }

  Future<String?> getValue() async => await vegetationlistUsecase.getValue();
  void clearValue() async => vegetationlistUsecase.clearValue();
}
