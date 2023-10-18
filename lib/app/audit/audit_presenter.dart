import 'package:cmms/domain/usecases/audit_usecase.dart';

import '../../domain/models/facility_model.dart';

class AuditPresenter {
  AuditPresenter(this.auditUsecase);
  AuditUsecase auditUsecase;
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await auditUsecase.getFacilityList();
}
