import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AuditListScreenUsecase {
  Repository repository;

  AuditListScreenUsecase(this.repository);
  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          bool? isExport,
          dynamic endDate,
          dynamic startDate,
          int? type}) async =>
      await repository.getAuditPlanList(
          facilityId, isLoading, isExport, startDate, endDate, type);
  void saveValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.type);
  deleteAuditPlan({required Object planId, required bool isLoading}) async =>
      await repository.deleteAuditPlan(
        planId,
        isLoading,
      );
  void clearValue() async => repository.clearData(LocalKeys.type);
  void clearStoreIdData() async => repository.clearData(LocalKeys.auditId);
}
