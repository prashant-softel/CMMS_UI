import 'package:cmms/domain/usecases/evaluation_dashboard_usecase.dart';

import '../../domain/models/facility_model.dart';

class EvaluationPresenter {
  EvaluationPresenter(this.evaluationUsecase);
  EvaluationUsecase evaluationUsecase;
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await evaluationUsecase.getFacilityList();
  void clearValue() async => evaluationUsecase.clearValue();
}
