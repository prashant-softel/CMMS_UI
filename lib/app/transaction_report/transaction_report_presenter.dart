import 'package:cmms/domain/models/get_transction_report_model.dart';
import 'package:cmms/domain/usecases/transaction_report_usecase.dart';

import '../../domain/models/get_asset_data_list_model.dart';

class TransactionStockReportPresenter {
  TransactionStockReportPresenter(this.transactionStockReportUsecase);
  TransactionStockReportUsecase transactionStockReportUsecase;

  Future<List<TransactionStockReportListModel?>?> getTransactionStockList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          List<int>? selectedAssetsNameIdList}) async =>
      await transactionStockReportUsecase.getTransactionStockList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
        endDate: endDate,
        startDate: startDate,
      );
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await transactionStockReportUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
