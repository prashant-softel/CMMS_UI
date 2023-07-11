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
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return incidentReportListUsecase.getIncidentReportList(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

 
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await incidentReportListUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await incidentReportListUsecase.getUserAccessList();

  ///
}
