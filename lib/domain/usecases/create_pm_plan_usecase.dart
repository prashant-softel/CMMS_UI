import 'package:cmms/domain/models/get_asset_data_list_model.dart';

import 'package:cmms/domain/repositories/repository.dart';

class CreatePmPlanUsecase {
  CreatePmPlanUsecase(this.repository);
  Repository repository;
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
}
