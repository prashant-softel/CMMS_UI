
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import 'package:cmms/domain/usecases/add_incident_report_usecase.dart';
import 'package:cmms/domain/usecases/view_incident_report_usecase.dart';


import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

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

 




  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewIncidentReportUsecase.getFacilityList();

 

  Future<String?> getUserAccessList() async =>
      await viewIncidentReportUsecase.getUserAccessList();

  ///
}
