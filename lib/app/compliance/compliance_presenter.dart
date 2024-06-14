import 'package:cmms/domain/models/Compliance_Status_model.dart';
import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_by_id_model.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/usecases/compliance_usecase.dart';

class CompliancePresenter {
  CompliancePresenter(this.complianceUsecase);
  ComplianceUsecase complianceUsecase;

  void saveValue({
    String? srId,
  }) async {
    return complianceUsecase.saveValue(srId: srId);
  }

  void saveRenewValue({
    String? reNew,
  }) async {
    return complianceUsecase.saveRenewValue(reNew: reNew);
  }

  Future<String?> getValue() async => await complianceUsecase.getValue();
  Future<String?> getRewValue() async => await complianceUsecase.getRewValue();

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await complianceUsecase.getFacilityList(isLoading: isLoading);
  Future<List<StatutoryComplianceModel>> getStatutoryComplianceDropDown({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return complianceUsecase.getStatutoryComplianceDropDown(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<ComplianceStatusModel>> statusOfAplication({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return complianceUsecase.statusOfAplication(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await complianceUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<GetStatutoryById?> getStatutoryDetail(
      {bool? isLoading, required int id}) async {
    return complianceUsecase.getStatutoryDetail(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> createCompliance(
      {createCompliance, required bool isLoading, int? position}) async {
    return complianceUsecase.createCompliance(
      createCompliance: createCompliance,
      isLoading: isLoading,
      position: position,
    );
  }

  Future<List<GetStatutoryList>> getStatutoryDataList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
  }) async {
    return complianceUsecase.getStatutoryDataList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
    );
  }

  void clearRenewValue() async => complianceUsecase.clearRenewValue();
  void clearValue() async => complianceUsecase.clearValue();
}
