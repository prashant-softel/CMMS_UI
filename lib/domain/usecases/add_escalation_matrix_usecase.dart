import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/escalation_details_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/status_list_model.dart';

class AddEscalationMatrixUsecase {
  final Repository _repository;

  AddEscalationMatrixUsecase(this._repository);
  Future<Map<String, dynamic>> createEscalationMatrix({
    createEscalationMatrix,
    required int moduleId,
    required int statusId,
    bool? isLoading,
  }) async =>
      await _repository.createEscalationMatrix(
        createEscalationMatrix,
        moduleId,
        statusId,
        isLoading,
      );

  Future<List<EscalationDetails?>> getEscalationDetail({
    int? moduleId,
    int? statusId,
    bool? isLoading,
  }) async =>
      await _repository.getEscalationDetail(
        moduleId: moduleId,
        statusId: statusId,
        isLoading: isLoading,
      );

  Future<List<ModuleModel?>?> getModuleList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getModule(
        type,
        facilityId,
        isLoading,
      );
  Future<StatusList?> getStatusList({
    int? moduleId,
    bool? isLoading,
  }) async =>
      await _repository.getStatusList(
        moduleId: moduleId,
        isLoading: isLoading ?? false,
      );

  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await _repository.getRoleList(
        isLoading,
      );

  void saveStatusValue({String? statusId}) async => _repository.saveValue(
        LocalKeys.statusId,
        statusId,
      );
  Future<String?> getStatusValue() async => await _repository.getStringValue(
        LocalKeys.statusId,
      );
  void clearStatusValue() async => _repository.clearData(
        LocalKeys.statusId,
      );

  void saveModuleValue({String? moduleId}) async => _repository.saveValue(
        LocalKeys.moduleId,
        moduleId,
      );
  Future<String?> getModuleValue() async => await _repository.getStringValue(
        LocalKeys.moduleId,
      );
  void clearModuleValue() async => _repository.clearData(
        LocalKeys.moduleId,
      );
}
