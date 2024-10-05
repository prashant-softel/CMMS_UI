import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';

import '../models/facility_model.dart';

class IRListUsecase {
  final Repository _repository;

  IRListUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<List<IncidentReportListModel>> getIncidentReportList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return _repository.getIncidentReportList(
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
  }) async {
    await _repository.incidentReportRejectButton(
      comment,
      id,
      isLoading,
    );
  }

  Future<void> incidentReportApproveButton({
    String? incidentId,
    bool? isLoading,
  }) async {
    await _repository.incidentReportApproveButton(
      incidentId,
      isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  void clearValue() async => _repository.clearData(LocalKeys.irId);
}
