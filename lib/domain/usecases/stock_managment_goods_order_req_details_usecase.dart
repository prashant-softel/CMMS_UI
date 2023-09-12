import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class GoodsOrdersReqDetailUsecase {
  GoodsOrdersReqDetailUsecase(this.repository);
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
  Future<Map<String, dynamic>> submitPurchaseOrderData({
    createGoReq,
    bool? isLoading,
  }) async =>
      await repository.submitPurchaseOrderData(
        createGoReq,
        isLoading,
      );
  Future<GetRODetailsByIDModel?> getRoDetailsByID({
    bool? isLoading,
    required int requestID,
  }) async =>
      await repository.getRoDetailsByID(
        requestID: requestID,
        isLoading: isLoading ?? false,
      );
}
