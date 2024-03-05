import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/user_list_model.dart';

class EmployeeStockReportUsecase {
  EmployeeStockReportUsecase(this.repository);

  Repository repository;

  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(facilityId, isLoading, false);
  Future<List<PlantStockListModel>?> getEmployeeStockReportList(
          {int? facilityId,
          bool? isLoading,
          int? userId,
          dynamic endDate,
          dynamic startDate}) async =>
      await repository.getEmployeeStockReportList(
          facilityId, isLoading, userId, startDate, endDate);
}
