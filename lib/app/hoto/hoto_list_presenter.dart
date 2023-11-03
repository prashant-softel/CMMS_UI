import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/module_cleaning_list_plan_model.dart';
import 'package:cmms/domain/usecases/hoto_list_screen_usecase.dart';

class HotoListScreenPresenter {
  HotoListScreenPresenter(this.hotoListUsecase);
  HotoListScreenUsecase hotoListUsecase;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await hotoListUsecase.getFacilityList(isLoading: isLoading);

       Future<List<ModuleCleaningListPlanModel>> getModuleCleaningListPlan({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return hotoListUsecase.getModuleCleaningListPlan(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }
 
}
