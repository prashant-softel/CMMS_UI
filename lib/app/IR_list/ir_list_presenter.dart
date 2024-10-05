import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/usecases/ir_list_usecase.dart';

import '../../domain/models/facility_model.dart';

class IRListPresenter {
  IRListPresenter(this.irListUsecase);
  IRListUsecase irListUsecase;

  Future<void> generateToken() async {
    return await irListUsecase.generateToken();
  }

  Future<List<IncidentReportListModel>> getIncidentReportList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return irListUsecase.getIncidentReportList(
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
      await irListUsecase.incidentReportRejectButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<void> incidentReportApproveButton({
    String? incidentId,
    bool? isLoading,
  }) async =>
      await irListUsecase.incidentReportApproveButton(
        incidentId: incidentId,
        isLoading: isLoading ?? false,
      );

  void clearValue() async => irListUsecase.clearValue();
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await irListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await irListUsecase.getUserAccessList();

  ///
}
