import 'package:cmms/domain/models/Compliance_Status_model.dart';
import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_by_id_model.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
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
  void saveRenewValue({String? reNew}) async =>
      repository.saveValue(LocalKeys.reNew, reNew);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.srId);
  Future<String?> getRewValue() async =>
      await repository.getStringValue(LocalKeys.reNew);

  Future<List<StatutoryComplianceModel>> getStatutoryComplianceDropDown(
      {required bool isLoading, required int? facilityId}) async {
    return repository.getStatutoryComplianceDropDown(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<ComplianceStatusModel>> statusOfAplication(
      {required bool isLoading, required int? facilityId}) async {
    return repository.statusOfAplication(
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
    int? position,
  }) async =>
      await repository.createCompliance(
        createCompliance,
        isLoading,
        position,
      );
  Future<List<GetStatutoryList>> getStatutoryDataList({
    required bool isLoading,
    required int? facility_id,
    bool? isExport,
  }) async {
    return repository.getStatutoryDataList(
        isLoading: isLoading, facility_id: facility_id, isExport: isExport);
  }

  void clearValue() async => repository.clearData(
        LocalKeys.srId,
      );
  void clearRenewValue() async => repository.clearData(
        LocalKeys.reNew,
      );
}
