import '../../domain/models/facility_model.dart';
import '../../domain/usecases/incident_report_usecase.dart';

class IncidentReportPresenter {
  IncidentReportPresenter(this.inventoryUsecase);
  IncidentReportUsecase inventoryUsecase;
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await inventoryUsecase.getFacilityList();
}
