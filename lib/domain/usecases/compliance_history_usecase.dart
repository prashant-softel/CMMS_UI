import 'package:cmms/domain/models/complicance_history_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ComplianceHistoryUsecase {
  ComplianceHistoryUsecase(this.repository);
  Repository repository;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);

  Future<List<StatutoryHistory>> getStatutoryHistory({
    required int compliance_id,
    required bool isLoading,
  }) async {
    return repository.getStatutoryHistory(
      compliance_id: compliance_id,
      isLoading: isLoading,
    );
  }

  void saveValue({String? compliance_id}) async =>
      repository.saveValue(LocalKeys.compliance_id, compliance_id);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.compliance_id);
  void clearValue() async => repository.clearData(
        LocalKeys.compliance_id,
      );
}
