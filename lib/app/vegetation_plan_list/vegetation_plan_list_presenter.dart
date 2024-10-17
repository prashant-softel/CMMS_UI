import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:cmms/domain/usecases/vegetation_list_usecase.dart';

class VegetationPlanListPresenter {
  VegetationPlanListPresenter(this.vegetationlistUsecase);
  VegetationlistUsecase vegetationlistUsecase;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await vegetationlistUsecase.getFacilityList(isLoading: isLoading);
  Future<List<VegetationPlanListModel>> getVegetationPlanList({
    required bool isLoading,
    required int? facility_id,
    bool? isExport,
    dynamic endDate,
    dynamic startDate,
  }) async {
    return vegetationlistUsecase.getVegetationPlanList(
        isLoading: isLoading,
        facility_id: facility_id,
        isExport: isExport,
        endDate: endDate,
        startDate: startDate);
  }

  deleteVegPlan(
          {required int planId, bool? isLoading, int? facilityId}) async =>
      await vegetationlistUsecase.deleteVegPlan(
          planId: planId, isLoading: isLoading, facilityId: facilityId);

  void clearValue() async => vegetationlistUsecase.clearValue();
}
