
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';

import 'package:cmms/domain/usecases/view_incident_report_usecase.dart';


import '../../domain/models/facility_model.dart';

class ViewIncidentReportPresenter {
  ViewIncidentReportPresenter(this.viewIncidentReportUsecase);
  ViewIncidentReportUsecase viewIncidentReportUsecase;

 

  Future<IncidentReportDetailsModel?> getIncidentReportDetail({
    bool? isLoading,  
    required int id,
  }) async {
      return viewIncidentReportUsecase.getIncidentReportDetail(
        id: id,
        isLoading: isLoading ?? false,
      );
  }

   Future<List<HistoryModel>?> getIncidentReportHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewIncidentReportUsecase.getIncidentReportHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );


     Future<void> incidentReportRejectButton({
    String? comment,
    String? id,
    bool? isLoading,
  }) async =>
      await viewIncidentReportUsecase.incidentReportRejectButton(
        comment: comment,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<void> incidentReportApproveButton({
    String? incidentId,
    bool? isLoading,
  }) async =>
      await viewIncidentReportUsecase.incidentReportApproveButton(
        incidentId: incidentId,
        isLoading: isLoading ?? false,
      );


 




  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewIncidentReportUsecase.getFacilityList();

 

  Future<String?> getUserAccessList() async =>
      await viewIncidentReportUsecase.getUserAccessList();

  ///
}
