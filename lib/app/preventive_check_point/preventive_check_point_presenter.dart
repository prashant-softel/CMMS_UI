import '../../domain/models/preventive_checklist_model.dart';
import '../../domain/usecases/preventive_checkpoint_usecase.dart';

class PreventiveCheckPointPresenter {
  PreventiveCheckPointPresenter(this.preventiveCheckPointUsecase);
  PreventiveCheckPointUsecase preventiveCheckPointUsecase;
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await preventiveCheckPointUsecase.getPreventiveCheckList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );
        Future<bool> createCheckPoint({
    checkpointJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
     preventiveCheckPointUsecase.createCheckpoint(
      checkpointJsonString: checkpointJsonString,
      isLoading: isLoading,
    );
    return true;
  }
  getCheckPointlist({
    int? selectedchecklistId,
    bool? isLoading,
  }) async =>
      await preventiveCheckPointUsecase.getCheckPointlist(
        selectedchecklistId: selectedchecklistId ?? 0,
      
        isLoading: isLoading ?? false,
      );
}
