import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/user_list_model.dart';

import '../models/facility_model.dart';

class StockManagementGoodsOrdersUsecase {
  Repository repository;

  StockManagementGoodsOrdersUsecase(this.repository);

  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(
        facilityId,
        isLoading,
      );
}
