import 'package:cmms/domain/models/plant_stock_month.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class PlantStockReportDetailsUsecase {
  Repository repository;

  PlantStockReportDetailsUsecase(this.repository);

   Future<List<PlantStockMonth?>?> getPlantStockMonthDetail({
     String? start_date,
    required String end_date,
    required int assetItemID,
    required int facilityID,
    bool? isLoading,
  }) async =>
      await repository.getPlantStockMonthDetail(
      start_date: start_date,
      end_date: end_date,
      assetItemID: assetItemID,
        facilityID: facilityID,
        isLoading: isLoading ?? false,
      );


void saveValue({String? assetId}) async {
  repository.saveValue(LocalKeys.assetId, assetId);
}

Future<String?> getValue() async {
  return await repository.getStringValue(LocalKeys.assetId);
}
}
