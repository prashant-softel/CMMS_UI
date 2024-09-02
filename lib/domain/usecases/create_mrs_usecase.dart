import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateMrsUsecase {
  CreateMrsUsecase(this.repository);
  Repository repository;
  Future<List<GetAssetItemsModel?>?> getEquipmentList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getEquipmentAssetsList(
        facilityId,
        isLoading,
      );
  void clearValue() async => repository.clearData(LocalKeys.mrsId);

  Future<Map<String, dynamic>> createMrs({
    createMrsJsonString,
    type,
    bool? isLoading,
  }) async =>
      await repository.createMrs(
        createMrsJsonString,
        type,
        isLoading,
      );

  void saveUsedTypeIdValue({String? whereUsedTypeId}) async =>
      repository.saveValue(LocalKeys.pmTaskId, whereUsedTypeId);
  Future<String?> getUsedTypeIdValue() async =>
      await repository.getStringValue(LocalKeys.pmTaskId);
  void savewhereUsedValue({String? whereUsed}) async =>
      repository.saveValue(LocalKeys.whereUsed, whereUsed);
  Future<String?> getwhereUsedValue() async =>
      await repository.getStringValue(LocalKeys.whereUsed);
  void saveToActortypeValue({String? to_actor_type_id}) async =>
      repository.saveValue(LocalKeys.toactortypeid, to_actor_type_id);
  Future<String?> getToActortypeValue() async =>
      await repository.getStringValue(LocalKeys.toactortypeid);
  void saveTypeValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getTypeValue() async =>
      await repository.getStringValue(LocalKeys.type);
  void saveFromActorIdValue({String? fromActorTypeId}) async =>
      repository.saveValue(LocalKeys.fromActorTypeId, fromActorTypeId);
  Future<String?> getFromActorIdValue() async =>
      await repository.getStringValue(LocalKeys.fromActorTypeId);
  void saveActivityValue({String? activityCtrlr}) async =>
      repository.saveValue(LocalKeys.activity, activityCtrlr);
  Future<String?> getActivityValue() async =>
      await repository.getStringValue(LocalKeys.activity);
}
