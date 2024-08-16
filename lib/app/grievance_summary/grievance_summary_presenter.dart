import 'package:cmms/domain/models/grievance_summary_model.dart';
import 'package:cmms/domain/models/observation_summary_model.dart';
import 'package:cmms/domain/usecases/grievance_summary_usecase.dart';
import 'package:cmms/domain/usecases/observation_summary_usecase.dart';

class GrievanceSummaryPresenter {
  GrievanceSummaryPresenter(this.grievanceSummaryUseCase);
  GrievanceSummaryUseCase grievanceSummaryUseCase;

  Future<List<GrievanceReportModel?>?> grievanceSummaryData({
    required int facilityId,
    required String fromDate,
    required String toDate,
    required bool isLoading,
  }) async {
    return await grievanceSummaryUseCase.getGrievanceSummary(
      facilityId: facilityId,
      isLoading: isLoading,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}
