import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/sm_report_list_model.dart';

import '../../domain/models/get_asset_data_list_model.dart';
import '../../domain/usecases/sm_report_list_usecase.dart';

class SmReportPresenter {
  SmReportPresenter(this.smReportUsecase);
  SmReportUsecase smReportUsecase;
  Future<List<SmReportListModel?>?> getAvailbleSmReportList(
          {facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          dynamic selectedAssetsNameIdList}) async =>
      await smReportUsecase.getAvailbleSmReportList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate,
          selectedAssetsNameIdList: selectedAssetsNameIdList);
  Future<List<SmReportListModel?>?> getCansumeSmReportList(
          {facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate,
          dynamic selectedAssetsNameIdList}) async =>
      await smReportUsecase.getCansumeSmReportList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate,
          selectedAssetsNameIdList: selectedAssetsNameIdList);

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    facilityId,
    bool? isLoading,
  }) async =>
      await smReportUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await smReportUsecase.getFacilityList();
}
