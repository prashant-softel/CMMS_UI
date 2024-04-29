import 'package:cmms/domain/models/business_list_model.dart';

import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:cmms/domain/models/request_order_list.model.dart';

import 'package:cmms/domain/usecases/stock_management_add_goods_orders_usecase.dart';

import '../../domain/models/paiyed_model.dart';

class StockManagementAddGoodsOrdersPresenter {
  StockManagementAddGoodsOrdersPresenter(
      this.stockManagementAddGoodsOrdersUsecase);
  StockManagementAddGoodsOrdersUsecase stockManagementAddGoodsOrdersUsecase;
  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return stockManagementAddGoodsOrdersUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<PaiedModel?>?> updatePaidBy({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return stockManagementAddGoodsOrdersUsecase.updatePaidBy(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<BusinessListModel?>?> getBusinessList({
    required int ListType,
    required int facilityId,
    required bool isLoading,
  }) async {
    return stockManagementAddGoodsOrdersUsecase.getBusinessList(
      facilityId:facilityId,
        type: ListType, isLoading: isLoading);
  }

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await stockManagementAddGoodsOrdersUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  // Future<List<GetAssetItemsModel?>?> getEquipmentAssetsList({
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await stockManagementAddGoodsOrdersUsecase.getEquipmentAssetsList(
  //       facilityId: facilityId ?? 0,
  //       isLoading: isLoading ?? false,
  //     );

  Future<Map<String, dynamic>?> createGoodsOrder({
    createGo,
    required bool isLoading,
  }) async {
    return stockManagementAddGoodsOrdersUsecase.createGoodsOrder(
      createGo: createGo,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateGoodsOrder({
    createGo,
    required bool isLoading,
  }) async {
    return stockManagementAddGoodsOrdersUsecase.updateGoodsOrder(
      createGo: createGo,
      isLoading: isLoading,
    );
  }

  Future<GetPurchaseDetailsByIDModel?> getPurchaseDetailsById({
    bool? isLoading,
    required int id,
  }) async {
    return stockManagementAddGoodsOrdersUsecase.getPurchaseDetailsById(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await stockManagementAddGoodsOrdersUsecase.getFacilityList();
  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await stockManagementAddGoodsOrdersUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  void saveValue({String? goId}) async {
    return stockManagementAddGoodsOrdersUsecase.saveValue(goId: goId);
  }

  Future<String?> getValue() async =>
      await stockManagementAddGoodsOrdersUsecase.getValue();
  Future<List<GetRequestOrderListModel>> getRequestOrderList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return stockManagementAddGoodsOrdersUsecase.getRequestOrderList(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<List<GetRODetailsByIDModel?>?> getRoDetailsByID({
    bool? isLoading,
    required int requestID,
    required int facilityId
  }) async {
    return stockManagementAddGoodsOrdersUsecase.getRoDetailsByID(
      requestID: requestID,
      facilityId:facilityId,
      isLoading: isLoading ?? false,
    );
  }
}
