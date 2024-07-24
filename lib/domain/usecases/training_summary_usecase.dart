import 'package:cmms/domain/models/training_summary_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class TrainingSummaryUseCase {
  final Repository repository;

  TrainingSummaryUseCase(this.repository);

  Future<List<TrainingSummaryModel?>?> getTrainingSummary({
    required int facilityId,
    bool? isLoading,
    required String fromDate,
    required String toDate,
  }) async {
    return await repository.getTrainingSummary(
        facilityId, isLoading, fromDate, toDate);
  }
}
