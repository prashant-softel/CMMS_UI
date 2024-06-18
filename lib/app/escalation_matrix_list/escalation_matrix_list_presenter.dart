import 'package:cmms/domain/models/escalation_matrix_list_model.dart';
import 'package:cmms/domain/usecases/escalation_matrix_list_usecase.dart';

class EscalationMatrixListPresenter {
  EscalationMatrixListPresenter(this.escalationMatrixListUsecase);
  EscalationMatrixListUsecase escalationMatrixListUsecase;

  Future<List<EscalationMatListModel>> getEscalationMatrixList({
    required bool isLoading,
  }) async {
    return escalationMatrixListUsecase.getEscalationMatrixList(
      isLoading: isLoading,
    );
  }

  void clearStatusValue() async =>
      escalationMatrixListUsecase.clearStatusValue();

  void clearModuleValue() async =>
      escalationMatrixListUsecase.clearModuleValue();
}
