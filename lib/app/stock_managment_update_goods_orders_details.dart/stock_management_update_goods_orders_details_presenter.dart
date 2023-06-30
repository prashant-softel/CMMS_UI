import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:cmms/domain/usecases/stock_management_update_goods_orders_details_usecase.dart';

class StockManagementUpdateGoodsOrdersDetailsPresenter {
  StockManagementUpdateGoodsOrdersDetailsPresenter(
      this.stockManagementUpdateGoodsOrdersDetailsUsecase);
  StockManagementUpdateGoodsOrdersDetailsUsecase
      stockManagementUpdateGoodsOrdersDetailsUsecase;
  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return stockManagementUpdateGoodsOrdersDetailsUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<BusinessListModel?>?> getBusinessList({
    required int ListType,
    required bool isLoading,
  }) async {
    return stockManagementUpdateGoodsOrdersDetailsUsecase.getBusinessList(
        type: ListType, isLoading: isLoading);
  }

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await stockManagementUpdateGoodsOrdersDetailsUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>?> createGoodsOrder({
    createGo,
    required bool isLoading,
  }) async {
    return stockManagementUpdateGoodsOrdersDetailsUsecase.createGoodsOrder(
      createGo: createGo,
      isLoading: isLoading,
    );
  }
}
