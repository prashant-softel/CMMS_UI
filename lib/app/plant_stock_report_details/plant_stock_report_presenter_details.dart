import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/plant_stock_month.dart';
import 'package:cmms/domain/usecases/plant_stock_report_details_usecase.dart';

class PlantStockReportDetailsPresenter {
  PlantStockReportDetailsPresenter(this.plantStockReportDetailsUsecase);
  PlantStockReportDetailsUsecase plantStockReportDetailsUsecase;

   Future<List<PlantStockMonth?>?> getPlantStockMonthDetail({
     String? start_date,
    required String end_date,
    required int assetItemID,
    required int facilityID,
    bool? isLoading,
  }) async {
    return plantStockReportDetailsUsecase.getPlantStockMonthDetail(
      start_date:start_date,
      end_date: end_date,
       assetItemID: assetItemID,
      facilityID: facilityID,
      isLoading: isLoading ?? false,
    );
  }
void saveValue({String? assetId}) async {
  return plantStockReportDetailsUsecase.saveValue(assetId: assetId);
}
void savestartValue({String? startdate}) async {
  return plantStockReportDetailsUsecase.savestartValue(startdate: startdate);
}
void saveendValue({String? enddate}) async {
  return plantStockReportDetailsUsecase.saveendValue(enddate: enddate);
}

Future<String?> getValue() async {
  return await plantStockReportDetailsUsecase.getValue();
}
Future<String?> getStartdateValue() async {
  return await plantStockReportDetailsUsecase.getStartdateValue();
}
Future<String?> getEnddateValue() async {
  return await plantStockReportDetailsUsecase.getEnddateValue();
}
//  Future<List<PlantStockListModel?>?> getPlantStockList(
//           {int? facilityId,
//           bool? isLoading,
//           bool? isExport,
//           dynamic endDate,
//           dynamic startDate,
//           int? selectedmaterialId}) async =>
//       await plantStockReportDetailsUsecase.getPlantStockList(
//           facilityId: facilityId ?? 0,
//           isLoading: isLoading ?? false,
//           isExport: isExport,
//           endDate: endDate,
//           startDate: startDate,
//           selectedmaterialId: selectedmaterialId);
Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await plantStockReportDetailsUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}

