import 'package:cmms/domain/models/escalation_matrix_list_model.dart';
import 'package:cmms/domain/usecases/escalation_matrix_list_usecase.dart';

import '../../domain/models/facility_model.dart';

class EscalationMatrixListPresenter {
  EscalationMatrixListPresenter(this.escalationMatrixListUsecase);
  EscalationMatrixListUsecase escalationMatrixListUsecase;

  Future<void> generateToken() async {
    return await escalationMatrixListUsecase.generateToken();
  }

  Future<List<EscalationMatListModel>> getEscalationMatrixList({
    required bool isLoading,
  }) async {
    return escalationMatrixListUsecase.getEscalationMatrixList(
      isLoading: isLoading,
    );
  }

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
