import 'package:cmms/domain/models/check_list_inspection_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ChecklistInspectionListUsecase {
  Repository repository;

  ChecklistInspectionListUsecase(this.repository);
  Future<List<GetChecklistInspection>> getChecklistInspection({
    bool? isLoading,
  }) async {
    return repository.getChecklistInspection(
      isLoading: isLoading,
    );
  }
}
