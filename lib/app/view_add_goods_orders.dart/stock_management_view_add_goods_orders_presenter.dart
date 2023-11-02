import 'package:cmms/domain/models/business_list_model.dart';

import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/history_model.dart';

import '../../domain/usecases/stock_management_view_add_goods_orders_usecase.dart';

class ViewAddGoodsOrdersPresenter {
  ViewAddGoodsOrdersPresenter(this.viewAddGoodsOrdersUsecase);
  ViewAddGoodsOrdersUsecase viewAddGoodsOrdersUsecase;
  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return viewAddGoodsOrdersUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>?> goodsOrderApprovedButton({
    goodsOrderApproveJsonString,
    required bool isLoading,
  }) async {
    return viewAddGoodsOrdersUsecase.goodsOrderApprovedButton(
      goodsOrderApproveJsonString: goodsOrderApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewAddGoodsOrdersUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> goodsOrderRejectButton({
    goodsOrderRejectJsonString,
    required bool isLoading,
  }) async {
    return viewAddGoodsOrdersUsecase.goodsOrderRejectButton(
      goodsOrderRejectJsonString: goodsOrderRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewAddGoodsOrdersUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  // Future<Map<String, dynamic>?> goodsOrderCloseButton({
  //   goodsOrderCloseJsonString,
  //   required bool isLoading,
  // }) async {
  //   return viewAddGoodsOrdersUsecase.goodsOrderCloseButton(
  //     goodsOrderCloseJsonString: goodsOrderCloseJsonString,
  //     isLoading: isLoading,
  //   );
  // }

  Future<List<BusinessListModel?>?> getBusinessList({
    required int ListType,
    required bool isLoading,
  }) async {
    return viewAddGoodsOrdersUsecase.getBusinessList(
        type: ListType, isLoading: isLoading);
  }

  Future<List<GetAssetItemsModel?>?> getEquipmentAssetsList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewAddGoodsOrdersUsecase.getEquipmentAssetsList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>?> createGoodsOrder({
    createGo,
    required bool isLoading,
  }) async {
    return viewAddGoodsOrdersUsecase.createGoodsOrder(
      createGo: createGo,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateGoodsOrder({
    createGo,
    required bool isLoading,
  }) async {
    return viewAddGoodsOrdersUsecase.updateGoodsOrder(
      createGo: createGo,
      isLoading: isLoading,
    );
  }

  Future<GetPurchaseDetailsByIDModel?> getPurchaseDetailsById({
    bool? isLoading,
    required int id,
  }) async {
    return viewAddGoodsOrdersUsecase.getPurchaseDetailsById(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  void saveValue({String? goId}) async {
    return viewAddGoodsOrdersUsecase.saveValue(goId: goId);
  }

  Future<String?> getValue() async =>
      await viewAddGoodsOrdersUsecase.getValue();
  void saveTypeValue({String? goType}) async {
    return viewAddGoodsOrdersUsecase.saveTypeValue(goType: goType);
  }

  Future<String?> getGoTypeValue() async =>
      await viewAddGoodsOrdersUsecase.getGoTypeValue();
}
