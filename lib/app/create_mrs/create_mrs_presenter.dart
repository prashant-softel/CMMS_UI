import 'package:cmms/domain/usecases/create_mrs_usecase.dart';

import '../../domain/models/get_asset_items_model.dart';

class CreateMrsPresenter {
  CreateMrsPresenter(this.createmrsUsecase);
  CreateMrsUsecase createmrsUsecase;
  Future<List<GetAssetItemsModel?>?> getEquipmentList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await createmrsUsecase.getEquipmentList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  void clearValue() async {
    return createmrsUsecase.clearValue();
  }

  Future<Map<String, dynamic>?> createMrs(
      {createMrsJsonString, type, required bool isLoading, int? route}) async {
    return createmrsUsecase.createMrs(
        createMrsJsonString: createMrsJsonString,
        type: type,
        isLoading: isLoading,
        route: route);
  }

  void saveUsedTypeIdValue({String? whereUsedTypeId}) async {
    return createmrsUsecase.saveUsedTypeIdValue(
        whereUsedTypeId: whereUsedTypeId);
  }

  Future<String?> getUsedTypeIdValue() async =>
      await createmrsUsecase.getUsedTypeIdValue();
  void savewhereUsedValue({String? whereUsed}) async {
    return createmrsUsecase.savewhereUsedValue(whereUsed: whereUsed);
  }

  Future<String?> getwhereUsedValue() async =>
      await createmrsUsecase.getwhereUsedValue();
  void saveToActortypeValue({String? to_actor_type_id}) async {
    return createmrsUsecase.saveToActortypeValue(
        to_actor_type_id: to_actor_type_id);
  }

  Future<String?> getToActortypeValue() async =>
      await createmrsUsecase.getToActortypeValue();
  void saveTypeValue({String? type}) async {
    return createmrsUsecase.saveTypeValue(type: type);
  }

  Future<String?> getTypeValue() async => await createmrsUsecase.getTypeValue();
  void saveFromActorIdValue({String? fromActorTypeId}) async {
    return createmrsUsecase.saveFromActorIdValue(
        fromActorTypeId: fromActorTypeId);
  }

  Future<String?> getFromActorIdValue() async =>
      await createmrsUsecase.getFromActorIdValue();
  void saveActivityValue({String? activityCtrlr}) async {
    return createmrsUsecase.saveActivityValue(activityCtrlr: activityCtrlr);
  }

  Future<String?> getActivityValue() async =>
      await createmrsUsecase.getActivityValue();
}
