import 'package:cmms/domain/models/complicance_history_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/compliance_history_usecase.dart';

class ComplianceHistoryPresenter {
  ComplianceHistoryPresenter(this.complianceHistoryUsecase);
  ComplianceHistoryUsecase complianceHistoryUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await complianceHistoryUsecase.getFacilityList(isLoading: isLoading);

  Future<List<StatutoryHistory>> getStatutoryHistory({
    required int compliance_id,
    required bool isLoading,
  }) async {
    return complianceHistoryUsecase.getStatutoryHistory(
      compliance_id: compliance_id,
      isLoading: isLoading,
    );
  }

  void saveValue({String? compliance_id}) async {
    return complianceHistoryUsecase.saveValue(compliance_id: compliance_id);
  }

  Future<String?> getValue() async => await complianceHistoryUsecase.getValue();
  void clearValue() async => complianceHistoryUsecase.clearValue();
}
