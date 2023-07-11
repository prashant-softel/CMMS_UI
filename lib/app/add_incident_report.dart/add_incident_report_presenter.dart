
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import 'package:cmms/domain/usecases/add_incident_report_usecase.dart';


import '../../domain/models/facility_model.dart';

class AddIncidentReportPresenter {
  AddIncidentReportPresenter(this.incidentReportUsecase);
  AddIncidentReportUsecase incidentReportUsecase;

  Future<void> generateToken() async {
    return await incidentReportUsecase.generateToken();
  }


   Future<List<TypePermitModel?>?> getTypePermitList(
    {required int facility_id}
   ) async =>
      await incidentReportUsecase.getTypePermitList(
        true,
        facility_id
        );

  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return incidentReportUsecase.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }



  Future<List<IncidentReportListModel>> getIncidentReportList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return incidentReportUsecase.getIncidentReportList(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

 
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await incidentReportUsecase.getFacilityList();

  Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await incidentReportUsecase.getFacilityPlantList();

  Future<String?> getUserAccessList() async =>
      await incidentReportUsecase.getUserAccessList();

  ///
}
