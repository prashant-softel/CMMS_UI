
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:cmms/domain/models/modulelist_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/add_escalation_matrix_usecase.dart';



import '../../domain/models/facility_model.dart';

class AddEscalationMatrixPresenter {
  AddEscalationMatrixPresenter(this.viewIncidentReportUsecase);
  AddEscalationMatrixUsecase viewIncidentReportUsecase;

 

   Future<Map<String, dynamic>?> createEscalationMatrix({
    createEscalationMatrix,
    required bool isLoading,
  }) async {
    return viewIncidentReportUsecase.createEscalationMatrix(
      createEscalationMatrix: createEscalationMatrix,
      isLoading: isLoading,
    );
  }

   Future<List<TypePermitModel?>?> getTypePermitList(
    {required int facility_id}
   ) async =>
      await viewIncidentReportUsecase.getTypePermitList(
        true,
        facility_id
        );

    Future<List<ModuleListModel?>?> getModuleList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await viewIncidentReportUsecase.getModuleList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

   Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await viewIncidentReportUsecase.getRoleList(
        isLoading: isLoading ?? false,
      );

 
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewIncidentReportUsecase.getFacilityList();

 

  Future<String?> getUserAccessList() async =>
      await viewIncidentReportUsecase.getUserAccessList();

  ///
}
