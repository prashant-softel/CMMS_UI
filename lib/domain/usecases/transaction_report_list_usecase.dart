import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/%20%20transaction_report_list_model.dart';
import 'package:cmms/domain/models/stock_management_update_goods_orders_model.dart';
import 'package:cmms/domain/models/user_list_model.dart';

import '../models/facility_model.dart';

class TransactionReportListUsecase {
  Repository repository;

  TransactionReportListUsecase(this.repository);

  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(
        facilityId,
        isLoading,
      );

  Future<List<TransactionReportListModel>> transactionReport({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
    int? actorID,
    int? actorType,
  }) async {
    return repository.transactionReport(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
      actorID: actorID,
      actorType: actorType,
    );
  }
}
