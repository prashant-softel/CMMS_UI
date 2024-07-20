import 'package:cmms/domain/models/check_list_inspection_model.dart';
import 'package:cmms/domain/usecases/checklist_inspection_list_usecase.dart';

class ChecklistInspectionListPresenter {
  ChecklistInspectionListPresenter(this.checklistInspectionListUsecase);
  ChecklistInspectionListUsecase checklistInspectionListUsecase;

  Future<List<GetChecklistInspection>> getChecklistInspection({
    bool? isLoading,
  }) async {
    return checklistInspectionListUsecase.getChecklistInspection(
      isLoading: isLoading,
    );
  }
}
