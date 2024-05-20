import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateAuditUsecase {
  CreateAuditUsecase(this.repository);
  Repository repository;
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? type,
    int? facilityId,
    int? selectedfrequencyId,
    bool? isLoading,
  }) async =>
      await repository.getPreventiveCheckListForAudit(
        type: type,
        facilityId: facilityId,
        frequencyid: selectedfrequencyId,
        isLoading: isLoading,
      );
  Future<AuditPlanDetailModel?> getAuditPlanDetails({
    int? auditPlanId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAuditPlanDetails(
        auditPlanId,
        facilityId,
        isLoading,
      );
  Future<bool> createAuditNumber({
    checkAuditJsonString,
    bool? isLoading,
  }) async =>
      await repository.createAuditNumber(
          isLoading: isLoading, checkAuditJsonString: checkAuditJsonString);
  Future<Map<String, dynamic>> updateAuditNumber({
    checkAuditJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateAuditNumber(
          isLoading: isLoading, checkAuditJsonString: checkAuditJsonString);
  void saveValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String> getValue() async =>
      await repository.getStringValue(LocalKeys.type);
  void saveAuditIdValue({String? auditId}) async =>
      repository.saveValue(LocalKeys.auditId, auditId);
  Future<String> getAuditdValue() async =>
      await repository.getStringValue(LocalKeys.auditId);
}
