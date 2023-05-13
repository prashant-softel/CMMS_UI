import 'package:cmms/domain/models/asset_type_list_model.dart';
import 'package:cmms/domain/usecases/asset_type_list_usecase.dart';

class AssetTypeListPresenter {
  AssetTypeListPresenter(this.assetTypeListUsecase);
  AssetTypeListUsecase assetTypeListUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();

  Future<List<AssetTypeListModel>> getAssetTypeList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return assetTypeListUsecase.getAssetTypeList(
        isLoading: isLoading, job_type_id: job_type_id);
  }
}
