
import '../../domain/models/get_plant_Stock_list.dart';
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
  Future<List<PlantStockListModel>?> getEmployeeStockReportList(
          {int? facilityId,
          bool? isLoading,
          int? userId,
          dynamic endDate,
          dynamic startDate}) async =>
      await employeeStockReportUsecase.getEmployeeStockReportList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          userId: userId,
          endDate: endDate,
          startDate: startDate);
}
