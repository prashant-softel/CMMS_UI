import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/usecases/view_water_data_usecase%20copy%202.dart';

class ViewWaterDataPresenter {
  ViewWaterDataPresenter(this.viewWaterDataUsecase);
  ViewWaterDataUsecase viewWaterDataUsecase;

  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await viewWaterDataUsecase.getAuditPlanList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  void saveValue({String? type}) async {
    return viewWaterDataUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await viewWaterDataUsecase.getValue();
  void clearValue() async => viewWaterDataUsecase.clearValue();
  void clearStoreIdData() async => viewWaterDataUsecase.clearStoreIdData();
}
