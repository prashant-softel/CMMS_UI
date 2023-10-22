import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_transction_report_model.dart';

class TransactionStockReportUsecase {
  final Repository _repository;

  TransactionStockReportUsecase(this._repository);
  Future<List<TransactionStockReportListModel?>?> getTransactionStockList({
    int? facilityId,
    bool? isLoading,
    dynamic endDate,
    dynamic startDate,
  }) async =>
      await _repository.getTransactionStockList(
          facilityId, isLoading, startDate, endDate);
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
}
