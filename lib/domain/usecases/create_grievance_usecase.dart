import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateGrievanceUsecase {
  CreateGrievanceUsecase(this.repository);
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
  Future<Map<String, dynamic>> updatePurchaseOrderData({
    createGoReq,
    bool? isLoading,
  }) async =>
      await repository.updatePurchaseOrderData(
        createGoReq,
        isLoading,
      );
  Future<List<HistoryModel>?> getRoHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getRoHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );
  Future<GetRODetailsByIDModel?> getRoDetailsByID({
    bool? isLoading,
    required int facilityId,
    required int requestID,
  }) async =>
      await repository.getRoDetailsByID(
        requestID: requestID,
        facilityId:facilityId,
        isLoading: isLoading ?? false,
      );
  void saveValue({String? roId}) async =>
      repository.saveValue(LocalKeys.roId, roId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.roId);
}
