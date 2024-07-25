import 'package:cmms/domain/models/training_summary_model.dart';
import 'package:cmms/domain/usecases/training_summary_usecase.dart';

class TrainingSummaryPresenter {
  TrainingSummaryPresenter(this.trainingSummaryUseCase);
  TrainingSummaryUseCase trainingSummaryUseCase;

  Future<List<TrainingSummaryModel?>?> trainingSummaryData({
    required int facilityId,
    required String fromDate,
    required String toDate,
    required bool isLoading,
  }) async {
    return await trainingSummaryUseCase.getTrainingSummary(
      facilityId: facilityId,
      isLoading: isLoading,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}
