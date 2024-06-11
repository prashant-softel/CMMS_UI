import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_by_id_model.dart';
import 'package:cmms/domain/usecases/compliance_usecase.dart';

class CompliancePresenter {
  CompliancePresenter(this.complianceUsecase);
  ComplianceUsecase complianceUsecase;

  void saveValue({String? srId}) async {
    return complianceUsecase.saveValue(srId: srId);
  }

  Future<String?> getValue() async => await complianceUsecase.getValue();
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

  Future<GetStatutoryById?> getStatutoryDetail(
      {bool? isLoading, required int id}) async {
    return complianceUsecase.getStatutoryDetail(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> createCompliance({
    createCompliance,
    required bool isLoading,
  }) async {
    return complianceUsecase.createCompliance(
      createCompliance: createCompliance,
      isLoading: isLoading,
    );
  }
}
