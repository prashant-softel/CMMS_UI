import 'package:cmms/domain/usecases/escalation_matrix_list_usecase.dart';

import '../../domain/models/facility_model.dart';

class EscalationMatrixListPresenter {
  EscalationMatrixListPresenter(this.escalationMatrixListUsecase);
  EscalationMatrixListUsecase escalationMatrixListUsecase;

  Future<void> generateToken() async {
    return await escalationMatrixListUsecase.generateToken();
  }

  // Future<List<IncidentReportListModel>> getEscalationMatrixList({
  //   required bool isLoading,
  //   required int? facility_id,
  //   String? start_date,
  //   required String end_date,
  // }) async {
  //   return escalationMatrixListUsecase.getEscalationMatrixList(
  //     isLoading: isLoading,
  //     facility_id: facility_id,
  //     start_date: start_date,
  //     end_date: end_date,
  //   );
  // }

  // Future<void> incidentReportRejectButton({
  //   String? comment,
  //   String? id,
  //   bool? isLoading,
  // }) async =>
  //     await incidentReportListUsecase.incidentReportRejectButton(
  //       comment: comment,
  //       id: id,
  //       isLoading: isLoading ?? false,
  //     );

  // Future<void> incidentReportApproveButton({
  //   String? incidentId,
  //   bool? isLoading,
  // }) async =>
  //     await incidentReportListUsecase.incidentReportApproveButton(
  //       incidentId: incidentId,
  //       isLoading: isLoading ?? false,
  //     );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await escalationMatrixListUsecase.getFacilityList();
  

  ///
}
