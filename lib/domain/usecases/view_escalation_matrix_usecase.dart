import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/escalation_details_model.dart';

class ViewEscalationMatrixUsecase {
  ViewEscalationMatrixUsecase(this.repository);
  final Repository repository;

  Future<List<EscalationDetails?>> getEscalationDetail({
    int? moduleId,
    int? statusId,
    bool? isLoading,
  }) async =>
      await repository.getEscalationDetail(
        moduleId: moduleId,
        statusId: statusId,
        isLoading: isLoading,
      );

  void saveStatusValue({String? statusId}) async => repository.saveValue(
        LocalKeys.statusId,
        statusId,
      );
  Future<String?> getStatusValue() async => await repository.getStringValue(
        LocalKeys.statusId,
      );
  void clearStatusValue() async => repository.clearData(
        LocalKeys.statusId,
      );

  void saveModuleValue({String? moduleId}) async => repository.saveValue(
        LocalKeys.moduleId,
        moduleId,
      );
  Future<String?> getModuleValue() async => await repository.getStringValue(
        LocalKeys.moduleId,
      );
  void clearModuleValue() async => repository.clearData(
        LocalKeys.moduleId,
      );
}
