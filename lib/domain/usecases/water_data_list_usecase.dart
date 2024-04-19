import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class WaterDataListUsecase {
  Repository repository;

  WaterDataListUsecase(this.repository);
  Future<Map<String, dynamic>> createWaterData({
    createWaterData,
    bool? isLoading,
  }) async =>
      await repository.createWaterData(
        createWaterData,
        isLoading,
      );
}
