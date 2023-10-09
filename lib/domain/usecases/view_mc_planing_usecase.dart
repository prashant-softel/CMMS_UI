import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';

import 'package:cmms/domain/repositories/repository.dart';

class ViewMcPlaningUsecase {
  ViewMcPlaningUsecase(this.repository);
  Repository repository;
  Future<EndMCExecutionDetailsModel?> getMcPlanDetail({
    bool? isLoading,
    required int planId,
  }) async =>
      await repository.getMcPlanDetail(
        planId: planId,
        isLoading: isLoading ?? false,
      );
}
