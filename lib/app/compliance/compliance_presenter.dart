import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/compliance_usecase.dart';

class CompliancePresenter {
  CompliancePresenter(this.complianceUsecase);
  ComplianceUsecase complianceUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await complianceUsecase.getFacilityList(isLoading: isLoading);
}
