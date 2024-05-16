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

  Future<String?> getValue() async =>
      await viewIncidentReportUsecase.getValue();
  void saveValue({String? irId}) async {
    return viewIncidentReportUsecase.saveValue(irId: irId);
  }

  Future<List<HistoryModel>?> getIncidentReportHistory(
    moduleType,
    id,
    facilityId,
    isLoading,
  ) async =>
      await viewIncidentReportUsecase.getIncidentReportHistory(
        moduleType: moduleType,
        id: id,
        facilityId:facilityId,
        isLoading: isLoading,
      );

  Future<Map<String, dynamic>?> rejectIncidentReportButton({
    incidentReportRejectJsonString,
    required bool isLoading,
  }) async {
    return viewIncidentReportUsecase.rejectIncidentReportButton(
      incidentReportRejectJsonString: incidentReportRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> rejectIrButton({
    incidentReportRejectJsonString,
    required bool isLoading,
  }) async {
    return viewIncidentReportUsecase.rejectIrButton(
      incidentReportRejectJsonString: incidentReportRejectJsonString,
      isLoading: isLoading,
    );
  }

  // Future<void> incidentReportRejectButton({
  //   String? comment,
  //   String? id,
  //   bool? isLoading,
  // }) async =>
  //     await viewIncidentReportUsecase.incidentReportRejectButton(
  //       comment: comment,
  //       id: id,
  //       isLoading: isLoading ?? false,
  //     );

  Future<Map<String, dynamic>?> approveIncidentReportButton({
    incidentReportApproveJsonString,
    required bool isLoading,
  }) async {
    return viewIncidentReportUsecase.approveIncidentReportButton(
      incidentReportApproveJsonString: incidentReportApproveJsonString,
      isLoading: isLoading,
    );
  }
  Future<Map<String, dynamic>?> approveIncidentReportButton2ndStep({
    incidentReportApproveJsonString,
    required bool isLoading,
  }) async {
    return viewIncidentReportUsecase.approveIncidentReportButton2ndStep(
      incidentReportApproveJsonString: incidentReportApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> approveIrButton({
    incidentReportApproveJsonString,
    required bool isLoading,
  }) async {
    return viewIncidentReportUsecase.approveIrButton(
      incidentReportApproveJsonString: incidentReportApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewIncidentReportUsecase.getFacilityList();

  Future<String?> getUserAccessList() async =>
      await viewIncidentReportUsecase.getUserAccessList();

  ///
}
