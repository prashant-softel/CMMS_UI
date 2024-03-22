import 'package:cmms/domain/models/business_list_model.dart';

import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/history_model.dart';

import 'package:cmms/domain/usecases/stock_management_receive_goods_orders_usecase.dart';

import '../../domain/models/paiyed_model.dart';

class ReceiveGoodsOrdersPresenter {
  ReceiveGoodsOrdersPresenter(this.receiveGoodsOrdersUsecase);

  ReceiveGoodsOrdersUsecase receiveGoodsOrdersUsecase;
  Future<List<CurrencyListModel>> getUnitCurrencyList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return receiveGoodsOrdersUsecase.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>?> goodsOrderCloseButton({
    goodsOrderCloseJsonString,
    required bool isLoading,
  }) async {
    return receiveGoodsOrdersUsecase.goodsOrderCloseButton(
      goodsOrderCloseJsonString: goodsOrderCloseJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<PaiedModel?>?> updatePaidBy({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return receiveGoodsOrdersUsecase.updatePaidBy(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<BusinessListModel?>?> getBusinessList({
    required int ListType,
    required int facilityId,
    required bool isLoading,
  }) async {
    return receiveGoodsOrdersUsecase.getBusinessList(
        type: ListType, isLoading: isLoading,facilityId: facilityId);
  }

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await receiveGoodsOrdersUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>?> createGoodsOrder({
    createGo,
    required bool isLoading,
  }) async {
    return receiveGoodsOrdersUsecase.createGoodsOrder(
      createGo: createGo,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> approveGOReceiveButton({
    goodsOrderApproveJsonString,
    required bool isLoading,
  }) async {
    return receiveGoodsOrdersUsecase.approveGOReceiveButton(
      goodsOrderApproveJsonString: goodsOrderApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> rejectGOReceiveButton({
    goodsOrderApproveJsonString,
    required bool isLoading,
  }) async {
    return receiveGoodsOrdersUsecase.rejectGOReceiveButton(
      goodsOrderApproveJsonString: goodsOrderApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateGOReceive({
    createGo,
    required bool isLoading,
  }) async {
    return receiveGoodsOrdersUsecase.updateGOReceive(
      createGo: createGo,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateGOReceiveIsSubmit0({
    createGo,
    required bool isLoading,
  }) async {
    return receiveGoodsOrdersUsecase.updateGOReceiveIsSubmit0(
      createGo: createGo,
      isLoading: isLoading,
    );
  }

  Future<GetPurchaseDetailsByIDModel?> getPurchaseDetailsById({
    bool? isLoading,
    required int id,
  }) async {
    return receiveGoodsOrdersUsecase.getPurchaseDetailsById(
      id: id,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await receiveGoodsOrdersUsecase.getFacilityList();
  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await receiveGoodsOrdersUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  void saveValue({String? goId}) async {
    return receiveGoodsOrdersUsecase.saveValue(goId: goId);
  }

  Future<String?> getValue() async =>
      await receiveGoodsOrdersUsecase.getValue();
}
