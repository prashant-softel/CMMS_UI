import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/usecases/checklist_mis_plan_usecase.dart';

class ChecklistMisPlanPresenter {
  ChecklistMisPlanPresenter(this.checklistMisPlanUsecase);
  ChecklistMisPlanUsecase checklistMisPlanUsecase;

  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await checklistMisPlanUsecase.getAuditPlanList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  void saveValue({String? type}) async {
    return checklistMisPlanUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await checklistMisPlanUsecase.getValue();
  void clearValue() async => checklistMisPlanUsecase.clearValue();
  void clearStoreIdData() async => checklistMisPlanUsecase.clearStoreIdData();
}
