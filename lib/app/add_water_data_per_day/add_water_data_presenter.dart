import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/usecases/add_water_data_usecase.dart';

class AddWaterDataPresenter {
  AddWaterDataPresenter(this.addwaterDataUsecase);
  AddWaterDataUsecase addwaterDataUsecase;

  Future<List<AuditPlanListModel>?> getAuditPlanList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await addwaterDataUsecase.getAuditPlanList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  void saveValue({String? type}) async {
    return addwaterDataUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await addwaterDataUsecase.getValue();
  void clearValue() async => addwaterDataUsecase.clearValue();
  void clearStoreIdData() async => addwaterDataUsecase.clearStoreIdData();
}
