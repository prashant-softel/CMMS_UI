import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/module_cleaning_list_plan_model.dart';
import 'package:cmms/domain/usecases/audit_list_screen_usecase.dart';
import 'package:cmms/domain/usecases/hoto_list_screen_usecase.dart';
import 'package:cmms/domain/usecases/module_cleaning_list_plan_usecase.dart';

class AuditListScreenPresenter {
  AuditListScreenPresenter(this.auditListUsecase);
  AuditListScreenUsecase auditListUsecase;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await auditListUsecase.getFacilityList(isLoading: isLoading);

       Future<List<ModuleCleaningListPlanModel>> getModuleCleaningListPlan({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return auditListUsecase.getModuleCleaningListPlan(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }
 
}
