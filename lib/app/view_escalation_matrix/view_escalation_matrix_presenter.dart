
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/add_escalation_matrix_usecase.dart';
import 'package:cmms/domain/usecases/view_escalation_matrix_usecase.dart';



import '../../domain/models/facility_model.dart';

class ViewEscalationMatrixPresenter {
  ViewEscalationMatrixPresenter(this.viewIncidentReportUsecase);
  ViewEscalationMatrixUsecase viewIncidentReportUsecase;

 

  // Future<IncidentReportDetailsModel?> getIncidentReportDetail({
  //   bool? isLoading,  
  //   required int id,
  // }) async {
  //     return viewIncidentReportUsecase.getIncidentReportDetail(
  //       id: id,
  //       isLoading: isLoading ?? false,
  //     );
  // }

  //  Future<List<TypePermitModel?>?> getTypePermitList(
  //   {required int facility_id}
  //  ) async =>
  //     await viewIncidentReportUsecase.getTypePermitList(
  //       true,
  //       facility_id
  //       );

  //  Future<List<HistoryModel>?> getIncidentReportHistory(
  //   moduleType,
  //   id,
  //   isLoading,
  // ) async =>
  //     await viewIncidentReportUsecase.getIncidentReportHistory(
  //       moduleType: moduleType,
  //       id: id,
  //       isLoading: isLoading,
  //     );

 




  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewIncidentReportUsecase.getFacilityList();

 

  Future<String?> getUserAccessList() async =>
      await viewIncidentReportUsecase.getUserAccessList();

  ///
}
