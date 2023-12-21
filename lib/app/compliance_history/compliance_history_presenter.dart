import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/compliance_history_usecase.dart';

class ComplianceHistoryPresenter {
  ComplianceHistoryPresenter(this.complianceHistoryUsecase);
  ComplianceHistoryUsecase complianceHistoryUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await complianceHistoryUsecase.getFacilityList(isLoading: isLoading);
}
