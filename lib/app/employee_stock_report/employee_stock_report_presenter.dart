import 'package:cmms/domain/models/get_notification_model.dart';

import '../../domain/models/employe_stock_model.dart';
import '../../domain/models/user_list_model.dart';
import '../../domain/usecases/employee_stock_report_usecase.dart';

class EmployeeStockReportPresenter {
  EmployeeStockReportPresenter(this.employeeStockReportUsecase);
  EmployeeStockReportUsecase employeeStockReportUsecase;
  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await employeeStockReportUsecase.getUserList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<EmployeeStockListModel?> getCmmsItemList(
          {int? facilityId, bool? isLoading, int? userId}) async =>
      await employeeStockReportUsecase.getCmmsItemList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          userId: userId);
}
