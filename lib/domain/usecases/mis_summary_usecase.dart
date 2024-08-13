
import 'package:cmms/domain/repositories/repository.dart';

class MisSummaryUseCase {
  MisSummaryUseCase(this.repository);
  final Repository repository;

  // ObservationSummaryUseCase(this.repository);

  // Future<List<ObservationSummaryModel?>?> getObservationSummary({
  //   required int facilityId,
  //   bool? isLoading,
  //   required String fromDate,
  //   required String toDate,
  // }) async {
  //   return await repository.getObservationSummary(
  //       facilityId, isLoading, fromDate, toDate);
  // }
}
