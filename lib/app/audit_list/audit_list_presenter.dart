import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/usecases/audit_list_screen_usecase.dart';

class AuditListScreenPresenter {
  AuditListScreenPresenter(this.auditListUsecase);
  AuditListScreenUsecase auditListUsecase;

  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          bool? isExport,
          dynamic endDate,
          dynamic startDate,
          int? type}) async =>
      await auditListUsecase.getAuditPlanList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          isExport: isExport,
          endDate: endDate,
          startDate: startDate,
          type: type);
  deleteAuditPlan(String? planId, {required bool isLoading}) async =>
      await auditListUsecase.deleteAuditPlan(
        planId: planId ?? 0,
        isLoading: isLoading,
      );
  void saveValue({String? type}) async {
    return auditListUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await auditListUsecase.getValue();
  void clearValue() async => auditListUsecase.clearValue();
  void clearStoreIdData() async => auditListUsecase.clearStoreIdData();
}
