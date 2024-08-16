import 'package:cmms/domain/models/grievance_summary_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class GrievanceSummaryUseCase {
  final Repository repository;

  GrievanceSummaryUseCase(this.repository);

  Future<List<GrievanceReportModel?>?> getGrievanceSummary({
    required int facilityId,
    bool? isLoading,
    required String fromDate,
    required String toDate,
  }) async {
    return await repository.getGrievanceSummary(
        facilityId, isLoading, fromDate, toDate);
  }
}