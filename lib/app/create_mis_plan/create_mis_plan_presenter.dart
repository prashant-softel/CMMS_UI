import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/usecases/create_mis_plan_usecase.dart';

class CreateMisPlanPresenter {
  CreateMisPlanPresenter(this.createMisPlanUsecase);
  CreateMisPlanUsecase createMisPlanUsecase;
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await createMisPlanUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? facilityId,
    int? type,
    int? selectedfrequencyId,
    bool? isLoading,
  }) async =>
      await createMisPlanUsecase.getPreventiveCheckList(
        facilityId: facilityId ?? 0,
        type: type,
        selectedfrequencyId: selectedfrequencyId,
        isLoading: isLoading ?? false,
      );
  Future<bool> createAuditNumber({
    checkAuditJsonString,
    required bool isLoading,
  }) async {
    createMisPlanUsecase.createAuditNumber(
      checkAuditJsonString: checkAuditJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  void saveValue({String? type}) async {
    return createMisPlanUsecase.saveValue(type: type);
  }

  Future<String?> getValue() async => await createMisPlanUsecase.getValue();
}
