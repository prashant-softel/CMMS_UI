

import 'package:cmms/domain/models/Compliance_Status_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ComplianceStatusUsecase {
  ComplianceStatusUsecase(this.repository);
  Repository repository;

  Future<List<ComplianceStatusModel>> getComplianceStatus(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getComplianceStatus(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }


  deleteComplianceStatus(
      {required Object ComplianceStatus_id, required bool isLoading}) async =>
      await repository.deleteComplianceStatus(
        ComplianceStatus_id,
        isLoading,
      );
  Future<bool> updateComplianceStatus({
    ComplianceStatusJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateComplianceStatus(
        isLoading: isLoading,
        ComplianceStatusJsonString: ComplianceStatusJsonString,
      );

  Future<bool> createComplianceStatus({
    facilitylistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createComplianceStatus(
          isLoading: isLoading, ComplianceStatusJsonString: facilitylistJsonString);

}
