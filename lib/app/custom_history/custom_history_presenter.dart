import '../../domain/models/history_model.dart';
import '../../domain/usecases/custom_history_usecase.dart';

class CustomHistoryPresenter {
  CustomHistoryPresenter(this.customHistoryUsecase);
  CustomHistoryUsecase customHistoryUsecase;
  Future<List<HistoryModel>?> getJobCardHistory(
    moduleType,
    Id,
    isLoading,
  ) async =>
      await customHistoryUsecase.getJobCardHistory(
        moduleType: moduleType,
        Id: Id,
        isLoading: isLoading,
      );
}
