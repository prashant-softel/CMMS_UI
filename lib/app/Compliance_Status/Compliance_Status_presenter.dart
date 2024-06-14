

import 'package:cmms/domain/models/Compliance_Status_model.dart';
import 'package:cmms/domain/usecases/Compliance_Status_usecase.dart';

class ComplianceStatusPresenter {
  ComplianceStatusPresenter(this.complianceStatusUsecase);
  ComplianceStatusUsecase complianceStatusUsecase;


  Future<List<ComplianceStatusModel>> getComplianceStatus({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return complianceStatusUsecase.getComplianceStatus(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<bool> createComplianceStatus({
    facilitylistJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    complianceStatusUsecase.createComplianceStatus(
      facilitylistJsonString: facilitylistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteComplianceStatus(String? ComplianceStatus_id, {required bool isLoading}) async =>
      await complianceStatusUsecase.deleteComplianceStatus(
        ComplianceStatus_id: ComplianceStatus_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateComplianceStatus(
      {ComplianceStatusJsonString, required bool isLoading}) async {
    print("presenter");
    complianceStatusUsecase.updateComplianceStatus(
      ComplianceStatusJsonString: ComplianceStatusJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
