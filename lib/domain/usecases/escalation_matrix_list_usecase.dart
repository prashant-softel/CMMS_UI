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

  Future<Map<String, dynamic>> escalateModule({
    required int moduleId,
    required int statusId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await _repository.escalateModule(
        moduleId,
        statusId,
        facilityId,
        isLoading,
      );

  void clearModuleValue() async => _repository.clearData(
        LocalKeys.moduleId,
      );
  void clearStatusValue() async => _repository.clearData(
        LocalKeys.statusId,
      );
}
