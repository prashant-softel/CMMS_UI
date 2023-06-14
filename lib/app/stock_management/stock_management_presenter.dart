import 'package:cmms/domain/usecases/stock_management_usecase.dart';

import '../../domain/models/facility_model.dart';

class StockManagementDashboardPresenter {
  StockManagementDashboardPresenter(this.stockmanagementdashboardUsecase);
  StockManagementDashboardUsecase stockmanagementdashboardUsecase;
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await stockmanagementdashboardUsecase.getFacilityList();
}
