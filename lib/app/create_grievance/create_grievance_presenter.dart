import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';

import 'package:cmms/domain/usecases/create_grievance_usecase.dart';

class CreateGrievancePresenter {
  CreateGrievancePresenter(this.createGrievanceUsecase);
  CreateGrievanceUsecase createGrievanceUsecase;
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await createGrievanceUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<GetRODetailsByIDModel?> getRoDetailsByID({
    bool? isLoading,
    required int requestID,
    required int facilityId
  }) async {
    return createGrievanceUsecase.getRoDetailsByID(
      requestID: requestID,
      facilityId:facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<HistoryModel>?> getRoHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await createGrievanceUsecase.getRoHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> submitPurchaseOrderData({
    createGoReq,
    required bool isLoading,
  }) async {
    return createGrievanceUsecase.submitPurchaseOrderData(
      createGoReq: createGoReq,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updatePurchaseOrderData({
    createGoReq,
    required bool isLoading,
  }) async {
    return createGrievanceUsecase.updatePurchaseOrderData(
      createGoReq: createGoReq,
      isLoading: isLoading,
    );
  }

  void saveValue({String? roId}) async {
    return createGrievanceUsecase.saveValue(roId: roId);
  }

  Future<String?> getValue() async => await createGrievanceUsecase.getValue();
}
