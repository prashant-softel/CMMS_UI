import 'package:cmms/domain/domain.dart';

import '../models/history_model.dart';

class CustomHistoryUsecase {
  final Repository repository;

  CustomHistoryUsecase(this.repository);
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
