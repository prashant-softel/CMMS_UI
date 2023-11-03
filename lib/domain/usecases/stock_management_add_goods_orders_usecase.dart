import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';

import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_purchase_details_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';

class StockManagementAddGoodsOrdersUsecase {
  final Repository _repository;

  StockManagementAddGoodsOrdersUsecase(this._repository);
  Future<List<CurrencyListModel>> getUnitCurrencyList(
      {required bool isLoading, required int? facilityId}) async {
    return _repository.getUnitCurrencyList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<PaiedModel?>?> updatePaidBy(
      {required bool isLoading, required int? facilityId}) async {
    return _repository.updatePaidBy(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<HistoryModel>?> getHistory({
    moduleType,
    id,
    bool? isLoading,
  }) async =>
      await _repository.getHistory(
        moduleType,
        id,
        isLoading,
      );
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  Future<List<BusinessListModel?>?> getBusinessList({
    required int type,
    bool isLoading = true,
  }) async =>
      await _repository.getBusinessList(
        businessType: type,
        isLoading: isLoading,
      );
  // Future<List<GetAssetDataModel?>?> getAssetList({
  //   String? auth,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.getBusinessList(
  //       businessType: type,
  //       isLoading: isLoading,
  //     );
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
  // Future<List<GetAssetItemsModel?>?> getEquipmentAssetsList({
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.getEquipmentAssetsList(
  //       facilityId,
  //       isLoading,
  //     );
  Future<Map<String, dynamic>> createGoodsOrder({
    createGo,
    bool? isLoading,
  }) async =>
      await _repository.createGoodsOrder(
        createGo,
        isLoading,
      );
  Future<Map<String, dynamic>> updateGoodsOrder({
    createGo,
    bool? isLoading,
  }) async =>
      await _repository.updateGoodsOrder(
        createGo,
        isLoading,
      );
  Future<GetPurchaseDetailsByIDModel?> getPurchaseDetailsById({
    bool? isLoading,
    required int id,
  }) async =>
      await _repository.getPurchaseDetailsById(
        id: id,
        isLoading: isLoading ?? false,
      );
  void saveValue({String? goId}) async =>
      _repository.saveValue(LocalKeys.goId, goId);
  Future<String?> getValue() async =>
      await _repository.getStringValue(LocalKeys.goId);
}
