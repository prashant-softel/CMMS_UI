import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';

class PurchaseGoodsorderViewUsecase {
  final Repository _repository;

  PurchaseGoodsorderViewUsecase(this._repository);
  Future<List<GetRODetailsByIDModel?>?> getRoDetailsByID({
    bool? isLoading,
    required int facilityId,
    required int requestID,
  }) async =>
      await _repository.getRoDetailsByID(
        requestID: requestID,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<CurrencyListModel>> getUnitCurrencyList(
      {required bool isLoading, required int? facilityId}) async {
    return _repository.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );
  Future<Map<String, dynamic>> approveGoodsOrder({
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.approveGoodsOrder(
        goodsOrderApproveJsonString,
        isLoading,
      );
  // Future<bool> approveGoodsOrder({
  //   approvetoJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.approveGoodsOrder(
  //         approvetoJsonString: approvetoJsonString, isLoading: isLoading);

  // Future<bool> rejectGoodsOrder({
  //   rejecttoJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.rejectGoodsOrder(
  //         rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);

  Future<Map<String, dynamic>> rejectGoodsOrder({
    goodsOrderRejectJsonString,
    bool? isLoading,
  }) async =>
      await _repository.rejectGoodsOrder(
        goodsOrderRejectJsonString,
        isLoading,
      );

  void saveValue({String? roId}) async =>
      _repository.saveValue(LocalKeys.roId, roId);
  Future<String?> getValue() async =>
      await _repository.getStringValue(LocalKeys.roId);
}
