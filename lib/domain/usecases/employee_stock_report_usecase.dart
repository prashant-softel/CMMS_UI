import 'package:cmms/domain/models/get_employee_stock_report_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/user_list_model.dart';

class EmployeeStockReportUsecase {
  EmployeeStockReportUsecase(this.repository);

  Repository repository;

  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(
        facilityId,
        isLoading,
      );
  Future<List<EmployeeStockReportListModel>?> getEmployeeStockReportList(
          {int? facilityId,
          bool? isLoading,
          int? userId,
          dynamic endDate,
          dynamic startDate}) async =>
      await repository.getEmployeeStockReportList(
          facilityId, isLoading, userId, startDate, endDate);
}
