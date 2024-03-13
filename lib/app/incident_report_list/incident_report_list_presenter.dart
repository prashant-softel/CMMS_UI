import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/usecases/incident_report_list_usecase.dart';

import '../../domain/models/facility_model.dart';

class IncidentReportListPresenter {
  IncidentReportListPresenter(this.incidentReportListUsecase);
  IncidentReportListUsecase incidentReportListUsecase;

  Future<void> generateToken() async {
    return await incidentReportListUsecase.generateToken();
  }

  Future<List<IncidentReportListModel>> getIncidentReportList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return incidentReportListUsecase.getIncidentReportList(
      isLoading: isLoading,
      isExport: isExport,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<void> incidentReportRejectButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await incidentReportListUsecase.incidentReportRejectButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<void> incidentReportApproveButton({
    String? incidentId,
    bool? isLoading,
  }) async =>
      await incidentReportListUsecase.incidentReportApproveButton(
        incidentId: incidentId,
        isLoading: isLoading ?? false,
      );

  void clearValue() async => incidentReportListUsecase.clearValue();
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await incidentReportListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await incidentReportListUsecase.getUserAccessList();

  ///
}
