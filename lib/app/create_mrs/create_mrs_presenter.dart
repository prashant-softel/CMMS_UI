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
  Future<Map<String, dynamic>?> createMrs({
    createMrsJsonString,
    required bool isLoading,
  }) async {
    return createmrsUsecase.createMrs(
      createMrsJsonString: createMrsJsonString,
      isLoading: isLoading,
    );
  }
}
