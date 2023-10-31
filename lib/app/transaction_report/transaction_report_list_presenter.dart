import 'package:cmms/domain/models/stock_management_update_goods_orders_model.dart';

import '../../domain/models/  transaction_report_list_model.dart';
import '../../domain/models/user_list_model.dart';
import '../../domain/usecases/transaction_report_list_usecase.dart';

class TransactionReportListPresenter {
  TransactionReportListPresenter(this.transactionReportListUsecase);
  TransactionReportListUsecase transactionReportListUsecase;
  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await transactionReportListUsecase.getUserList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<TransactionReportListModel>> transactionReport({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return transactionReportListUsecase.transactionReport(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }
}
