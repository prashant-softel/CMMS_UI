import 'package:cmms/domain/models/get_asset_data_list_model.dart';

import '../../domain/usecases/create_pm_plan_usecase.dart';

class CreatePmPlanPresenter {
  CreatePmPlanPresenter(this.createPmPlanUsecase);
  CreatePmPlanUsecase createPmPlanUsecase;
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await createPmPlanUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
