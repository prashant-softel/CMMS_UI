import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/transaction_report_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/employe_stock_model.dart';
import '../repositories/local_storage_keys.dart';

class CreateMrsReturnUsecase {
  CreateMrsReturnUsecase(this.repository);
  Repository repository;
  Future<List<PlantStockListModel?>?> getCmmsItemList({
    int? facilityId,
    bool? isLoading,
    int? actorID,
    int? actorType,
    int? mrsId,
  }) async =>
      await repository.getPlantStockListReturn(
          facilityId, isLoading, actorID, actorType, mrsId);
  Future<Map<String, dynamic>> createReturnMrs({
    createReturnMrsJsonString,
    bool? isLoading,
  }) async =>
      await repository.createReturnMrs(
        createReturnMrsJsonString,
        isLoading,
      );
  void saveValue({String? whereUsedTypeId}) async =>
      repository.saveValue(LocalKeys.pmTaskId, whereUsedTypeId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmTaskId);
  void saveactivityValue({String? activity}) async =>
      repository.saveValue(LocalKeys.activity, activity);
  Future<String?> getactivityValue() async =>
      await repository.getStringValue(LocalKeys.activity);
}
