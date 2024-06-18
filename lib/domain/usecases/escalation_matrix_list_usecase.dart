import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/escalation_matrix_list_model.dart';

class EscalationMatrixListUsecase {
  final Repository _repository;

  EscalationMatrixListUsecase(this._repository);

  Future<List<EscalationMatListModel>> getEscalationMatrixList({
    required bool isLoading,
  }) async {
    return _repository.getEscalationMatrixList(
      isLoading: isLoading,
    );
  }

  void clearModuleValue() async => _repository.clearData(
        LocalKeys.moduleId,
      );
  void clearStatusValue() async => _repository.clearData(
        LocalKeys.statusId,
      );
}
