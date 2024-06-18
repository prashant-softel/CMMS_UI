import 'package:cmms/domain/models/escalation_details_model.dart';
import 'package:cmms/domain/usecases/view_escalation_matrix_usecase.dart';

class ViewEscalationMatrixPresenter {
  ViewEscalationMatrixPresenter(this.viewIncidentReportUsecase);
  ViewEscalationMatrixUsecase viewIncidentReportUsecase;

  Future<List<EscalationDetails?>> getEscalationDetail({
    int? moduleId,
    int? statusId,
    bool? isLoading,
  }) async =>
      await viewIncidentReportUsecase.getEscalationDetail(
        moduleId: moduleId,
        statusId: statusId,
        isLoading: isLoading,
      );

  void saveStatusValue({String? statusId}) async {
    return viewIncidentReportUsecase.saveStatusValue(statusId: statusId);
  }

  void clearStatusValue() async => viewIncidentReportUsecase.clearStatusValue();

  Future<String?> getStatusValue() async =>
      await viewIncidentReportUsecase.getStatusValue();

  void saveModuleValue({String? moduleId}) async {
    return viewIncidentReportUsecase.saveModuleValue(moduleId: moduleId);
  }

  void clearModuleValue() async => viewIncidentReportUsecase.clearModuleValue();

  Future<String?> getModuleValue() async =>
      await viewIncidentReportUsecase.getModuleValue();
}
