import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/usecases/water_data_usecase%20copy.dart';

class WaterDataPresenter {
  WaterDataPresenter(this.waterDataUsecase);
  WaterDataUsecase waterDataUsecase;

  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await waterDataUsecase.getAuditPlanList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  void saveValue({String? type}) async {
    return waterDataUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await waterDataUsecase.getValue();
  void clearValue() async => waterDataUsecase.clearValue();
  void clearStoreIdData() async => waterDataUsecase.clearStoreIdData();
}
