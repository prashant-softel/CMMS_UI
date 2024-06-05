

import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class StatutoryComplianceUsecase {
  StatutoryComplianceUsecase(this.repository);
  Repository repository;

  Future<List<StatutoryComplianceModel>> getStatutoryCompliance(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getStatutoryCompliance(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }


  deleteStatutoryCompliance(
      {required Object StatutoryCompliance_id, required bool isLoading}) async =>
      await repository.deleteStatutoryCompliance(
        StatutoryCompliance_id,
        isLoading,
      );
  Future<bool> updateStatutoryCompliance({
    StatutoryComplianceJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateStatutoryCompliance(
        isLoading: isLoading,
        StatutoryComplianceJsonString: StatutoryComplianceJsonString,
      );

  Future<bool> createStatutoryCompliance({
    facilitylistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createStatutoryCompliance(
          isLoading: isLoading, StatutoryComplianceJsonString: facilitylistJsonString);

}
