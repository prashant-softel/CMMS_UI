import 'package:cmms/domain/models/observation_summary_model.dart';
import 'package:cmms/domain/usecases/observation_summary_usecase.dart';

class ObservationSummaryPresenter {
  ObservationSummaryPresenter(this.observationSummaryUseCase);
  ObservationSummaryUseCase observationSummaryUseCase;

  Future<List<ObservationSummaryModel?>?> observationSummaryData({
    required int facilityId,
    required String fromDate,
    required String toDate,
    required bool isLoading,
  }) async {
    return await observationSummaryUseCase.getObservationSummary(
      facilityId: facilityId,
      isLoading: isLoading,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}
