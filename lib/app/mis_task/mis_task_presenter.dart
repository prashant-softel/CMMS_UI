import 'package:cmms/domain/models/audit_plan_list_model.dart';

import '../../domain/usecases/mis_task_usecase.dart';

class MisTaskPresenter {
  MisTaskPresenter(this.misTaskUsecase);
  MisTaskUsecase misTaskUsecase;

  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await misTaskUsecase.getAuditPlanList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  void saveValue({String? type}) async {
    return misTaskUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await misTaskUsecase.getValue();
  void clearValue() async => misTaskUsecase.clearValue();
  void clearStoreIdData() async => misTaskUsecase.clearStoreIdData();
}
