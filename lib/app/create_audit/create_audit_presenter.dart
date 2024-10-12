import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
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
  Future<List<EmployeeModel?>?> getEmployeePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return createAuditUsecase.getEmployeePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeModel?>?> getAssignedToEmployee({
    String? auth,
    int? facilityId,
    int? featureId,
    bool? isLoading,
  }) async =>
      await createAuditUsecase.getAssignedToEmployee(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        featureId: featureId,
        isLoading: isLoading ?? false,
      );
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? facilityId,
    int? type,
    int? selectedfrequencyId,
    bool? isLoading,
  }) async =>
      await createAuditUsecase.getPreventiveCheckList(
        facilityId: facilityId ?? 0,
        type: type,
        selectedfrequencyId: selectedfrequencyId,
        isLoading: isLoading ?? false,
      );
  Future<bool> createAuditNumber(
      {checkAuditJsonString, required bool isLoading, int? type}) async {
    createAuditUsecase.createAuditNumber(
        checkAuditJsonString: checkAuditJsonString,
        isLoading: isLoading,
        type: type);
    return true;
  }

  Future<Map<String, dynamic>?> updateAuditNumber({
    checkAuditJsonString,
    required bool isLoading,
  }) async {
    createAuditUsecase.updateAuditNumber(
      checkAuditJsonString: checkAuditJsonString,
      isLoading: isLoading,
    );
    return null;
  }

  Future<AuditPlanDetailModel?> getAuditPlanDetails({
    int? auditPlanId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await createAuditUsecase.getAuditPlanDetails(
        auditPlanId: auditPlanId,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  void saveValue({String? type}) async {
    return createAuditUsecase.saveValue(type: type);
  }

  Future<String> getValue() async => await createAuditUsecase.getValue();
  void saveAuditIdValue({String? auditId}) async {
    return createAuditUsecase.saveAuditIdValue(auditId: auditId);
  }

  Future<String> getAuditdValue() async =>
      await createAuditUsecase.getAuditdValue();
}
