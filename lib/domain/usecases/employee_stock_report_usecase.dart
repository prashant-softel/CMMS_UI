import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/employe_stock_model.dart';
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
  Future<EmployeeStockListModel?> getCmmsItemList(
          {int? facilityId, bool? isLoading, int? userId}) async =>
      await repository.getCmmsItemList(
        facilityId,
        isLoading,
        userId,
      );
}
