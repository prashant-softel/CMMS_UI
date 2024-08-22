import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/usecases/view_compliance_usecase.dart';

class ViewCompliancePresenter {
  ViewCompliancePresenter(this.viewComplianceUsecase);
  ViewComplianceUsecase viewComplianceUsecase;

  void saveValue({String? srId}) async {
    return viewComplianceUsecase.saveValue(srId: srId);
  }

  Future<String?> getValue() async => await viewComplianceUsecase.getValue();
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await viewComplianceUsecase.getFacilityList(isLoading: isLoading);
  Future<List<StatutoryComplianceModel>> getStatutoryComplianceDropDown({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return viewComplianceUsecase.getStatutoryComplianceDropDown(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>?> complianceApprovedButton(
      {complianceApprovedJsonString,
      required bool isLoading,
      
      int? position}) async {
    return viewComplianceUsecase.complianceApprovedButton(
      complianceApprovedJsonString: complianceApprovedJsonString,
      isLoading: isLoading,
      position: position,
    );
  }

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewComplianceUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<GetStatutoryById?> getStatutoryDetail(
      {bool? isLoading, required int id}) async {
    return viewComplianceUsecase.getStatutoryDetail(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  
}
