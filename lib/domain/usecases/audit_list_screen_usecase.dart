import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';

class AuditListScreenUsecase {
  Repository repository;

  AuditListScreenUsecase(this.repository);
  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await repository.getAuditPlanList(
          facilityId, isLoading, startDate, endDate);
}
