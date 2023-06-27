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

  Future<List<BusinessTypeModel>> getBusinessTypeList({
    int? businessType,
    bool? isLoading,
  }) async =>
      await stockManagementUpdateGoodsOrdersDetailsUsecase.getBusinessTypeList(
        isLoading: isLoading ?? false,
        businessType: businessType,
      );
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
}
