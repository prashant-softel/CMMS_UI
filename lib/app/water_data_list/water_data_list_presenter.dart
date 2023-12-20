import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/usecases/water_data_usecase.dart';

class WaterDataListPresenter {
  WaterDataListPresenter(this.waterDataListUsecase);
  WaterDataListUsecase waterDataListUsecase;

  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await waterDataListUsecase.getAuditPlanList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  void saveValue({String? type}) async {
    return waterDataListUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await waterDataListUsecase.getValue();
  void clearValue() async => waterDataListUsecase.clearValue();
  void clearStoreIdData() async => waterDataListUsecase.clearStoreIdData();
}
