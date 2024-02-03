import 'package:cmms/domain/models/facility_model.dart';
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
}
