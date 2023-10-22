import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/usecases/create_audit_usecase.dart';

class CreateAuditPresenter {
  CreateAuditPresenter(this.createAuditUsecase);
  CreateAuditUsecase createAuditUsecase;
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await createAuditUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await createAuditUsecase.getPreventiveCheckList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
}
