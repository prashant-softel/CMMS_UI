import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
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
void savestartValue({String? startdate}) async {
  repository.saveValue(LocalKeys.startdate, startdate);
}
void saveendValue({String? enddate}) async {
  repository.saveValue(LocalKeys.enddate, enddate);
}

Future<String?> getValue() async {
  return await repository.getStringValue(LocalKeys.assetId);
}
Future<String?> getStartdateValue() async {
  return await repository.getStringValue(LocalKeys.startdate);
}
Future<String?> getEnddateValue() async {
  return await repository.getStringValue(LocalKeys.enddate);
}
// Future<List<PlantStockListModel?>?> getPlantStockList(
//           {int? facilityId,
//           bool? isExport,
//           bool? isLoading,
//           dynamic endDate,
//           dynamic startDate,
//           int? selectedmaterialId}) async =>
//       await repository.getPlantStockList(
//           facilityId, isLoading,isExport, startDate, endDate, selectedmaterialId);
Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
      void clearValue() async => repository.clearData(
        LocalKeys.assetId,
      );
       void clearstartValue() async => repository.clearData(
        LocalKeys.startdate,
      );
       void clearendValue() async => repository.clearData(
        LocalKeys.enddate,
      );
}

