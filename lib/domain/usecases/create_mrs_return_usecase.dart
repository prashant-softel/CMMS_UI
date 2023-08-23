import 'package:cmms/domain/repositories/repository.dart';

import '../models/employe_stock_model.dart';

class CreateMrsReturnUsecase {
  CreateMrsReturnUsecase(this.repository);
  Repository repository;
  Future<EmployeeStockListModel?> getCmmsItemList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getCmmsItemList(
        facilityId,
        isLoading,
      );
  Future<Map<String, dynamic>> createMrs({
    createMrsJsonString,
    bool? isLoading,
  }) async =>
      await repository.createMrs(
        createMrsJsonString,
        isLoading,
      );
}
