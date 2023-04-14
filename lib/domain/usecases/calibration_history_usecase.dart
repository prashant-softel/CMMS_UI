import 'package:cmms/domain/domain.dart';

import '../models/history_model.dart';

class CalibrationHistoryUsecase {
  final Repository repository;

  CalibrationHistoryUsecase(this.repository);
  Future<List<HistoryModel>?> getJobCardHistory({
    moduleType,
    Id,
    bool? isLoading,
  }) async =>
      await repository.getJobCardHistory(
        moduleType,
        Id,
        isLoading,
      );
}
