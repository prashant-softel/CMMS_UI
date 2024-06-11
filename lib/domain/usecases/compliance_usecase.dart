import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ComplianceUsecase {
  ComplianceUsecase(this.repository);
  Repository repository;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  void saveValue({String? srId}) async =>
      repository.saveValue(LocalKeys.srId, srId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.srId);
  Future<List<StatutoryComplianceModel>> getStatutoryComplianceDropDown(
      {required bool isLoading, required int? facilityId}) async {
    return repository.getStatutoryComplianceDropDown(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );
  Future<GetStatutoryById?> getStatutoryDetail({
    bool? isLoading,
    required int id,
  }) async =>
      await repository.getStatutoryDetail(
        id: id,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>> createCompliance({
    createCompliance,
    bool? isLoading,
  }) async =>
      await repository.createCompliance(
        createCompliance,
        isLoading,
      );
}
