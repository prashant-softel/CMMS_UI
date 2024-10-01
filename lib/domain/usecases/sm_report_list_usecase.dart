import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/sm_report_list_model.dart';

class SmReportUsecase {
  final Repository _repository;

  SmReportUsecase(this._repository);
  Future<List<SmReportListModel?>?> getAvailbleSmReportList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          dynamic selectedAssetsNameIdList}) async =>
      await _repository.getAvailbleSmReportList(
          facilityId, isLoading, startDate, endDate, selectedAssetsNameIdList);

  Future<List<SmReportListModel?>?> getCansumeSmReportList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          dynamic selectedAssetsNameIdList}) async =>
      await _repository.getCansumeSmReportList(
          facilityId, isLoading, startDate, endDate, selectedAssetsNameIdList);
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
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
}
