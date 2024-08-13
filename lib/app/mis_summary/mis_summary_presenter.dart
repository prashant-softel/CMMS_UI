import 'package:cmms/domain/usecases/mis_summary_usecase.dart';

class MisSummaryPresenter {
  MisSummaryPresenter(this.observationSummaryUseCase);
  MisSummaryUseCase observationSummaryUseCase;

  // Future<List<ObservationSummaryModel?>?> observationSummaryData({
  //   required int facilityId,
  //   required String fromDate,
  //   required String toDate,
  //   required bool isLoading,
  // }) async {
  //   return await observationSummaryUseCase.getObservationSummary(
  //     facilityId: facilityId,
  //     isLoading: isLoading,
  //     fromDate: fromDate,
  //     toDate: toDate,
  //   );
  // }
}
