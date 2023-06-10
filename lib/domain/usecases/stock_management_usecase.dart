import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class StockManagementDashboardUsecase {
  Repository repository;

  StockManagementDashboardUsecase(this.repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);
}
