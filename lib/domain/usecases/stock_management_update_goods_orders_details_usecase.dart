import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/calibration_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';

import '../models/business_list_model.dart';

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
}
