import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';

import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';

class StockManagementUpdateGoodsOrdersDetailsUsecase {
  final Repository _repository;

  StockManagementUpdateGoodsOrdersDetailsUsecase(this._repository);
  Future<List<CurrencyListModel>> getUnitCurrencyList(
      {required bool isLoading, required int? facilityId}) async {
    return _repository.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<BusinessListModel?>?> getBusinessList({
    required int type,
    bool isLoading = true,
  }) async =>
      await _repository.getBusinessList(
        businessType: type,
        isLoading: isLoading,
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
  Future<Map<String, dynamic>> createGoodsOrder({
    createGo,
    bool? isLoading,
  }) async =>
      await _repository.createGoodsOrder(
        createGo,
        isLoading,
      );
}
