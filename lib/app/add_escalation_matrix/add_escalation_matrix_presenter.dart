import 'package:cmms/domain/models/escalation_details_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/models/status_list_model.dart';
import 'package:cmms/domain/usecases/add_escalation_matrix_usecase.dart';

class AddEscalationMatrixPresenter {
  AddEscalationMatrixPresenter(this.addEscalationMatrixUsecase);
  AddEscalationMatrixUsecase addEscalationMatrixUsecase;

  Future<Map<String, dynamic>?> createEscalationMatrix({
    createEscalationMatrix,
    required int moduleId,
    required int statusId,
    required bool isLoading,
  }) async {
    return addEscalationMatrixUsecase.createEscalationMatrix(
      createEscalationMatrix: createEscalationMatrix,
      moduleId: moduleId,
      statusId: statusId,
      isLoading: isLoading,
    );
  }

  Future<List<EscalationDetails?>> getEscalationDetail({
    int? moduleId,
    int? statusId,
    bool? isLoading,
  }) async =>
      await addEscalationMatrixUsecase.getEscalationDetail(
        moduleId: moduleId,
        statusId: statusId,
        isLoading: isLoading,
      );

  Future<List<ModuleModel?>?> getModuleList({
    int? facilityId,
    int? type,
    bool? isLoading,
  }) async =>
      await addEscalationMatrixUsecase.getModuleList(
        facilityId: facilityId ?? 0,
        type: type,
        isLoading: isLoading ?? false,
      );

  Future<StatusList?> getStatusList({
    int? moduleId,
    bool? isLoading,
  }) async =>
      await addEscalationMatrixUsecase.getStatusList(
        moduleId: moduleId,
        isLoading: isLoading ?? false,
      );

  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await addEscalationMatrixUsecase.getRoleList(
        isLoading: isLoading ?? false,
      );

  void saveStatusValue({String? statusId}) async {
    return addEscalationMatrixUsecase.saveStatusValue(statusId: statusId);
  }

  void clearStatusValue() async =>
      addEscalationMatrixUsecase.clearStatusValue();

  Future<String?> getStatusValue() async =>
      await addEscalationMatrixUsecase.getStatusValue();

  void saveModuleValue({String? moduleId}) async {
    return addEscalationMatrixUsecase.saveModuleValue(moduleId: moduleId);
  }

  void clearModuleValue() async =>
      addEscalationMatrixUsecase.clearModuleValue();

  Future<String?> getModuleValue() async =>
      await addEscalationMatrixUsecase.getModuleValue();
}
