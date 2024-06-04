

import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/usecases/Statutory_Compliance_usecase.dart';

class StatutoryCompliancePresenter {
  StatutoryCompliancePresenter(this.statutoryComplianceUsecase);
  StatutoryComplianceUsecase statutoryComplianceUsecase;


  Future<List<StatutoryComplianceModel>> getStatutoryCompliance({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return statutoryComplianceUsecase.getStatutoryCompliance(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<bool> createStatutoryCompliance({
    facilitylistJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    statutoryComplianceUsecase.createStatutoryCompliance(
      facilitylistJsonString: facilitylistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteStatutoryCompliance(String? StatutoryCompliance_id, {required bool isLoading}) async =>
      await statutoryComplianceUsecase.deleteStatutoryCompliance(
        StatutoryCompliance_id: StatutoryCompliance_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateStatutoryCompliance(
      {StatutoryComplianceJsonString, required bool isLoading}) async {
    print("presenter");
    statutoryComplianceUsecase.updateStatutoryCompliance(
      StatutoryComplianceJsonString: StatutoryComplianceJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
