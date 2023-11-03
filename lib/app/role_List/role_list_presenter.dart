
import '../../domain/models/role_model.dart';
import '../../domain/usecases/role_list_usecase.dart';

class RoleListPresenter {
  RoleListPresenter(this.roleUsecase);
  RolelistUsecase roleUsecase;


  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await roleUsecase.getRoleList(
        isLoading: isLoading ?? false,
      );


    Future<bool> createRoleList({
    modulelistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    roleUsecase.createRoleList(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

deleteRoleList(String? module_id, {required bool isLoading}) async =>
    await roleUsecase.deleteRoleList(
      module_id: module_id ?? 0,
      isLoading: isLoading,
    );

  Future<bool> updateRoleList(
      {modulelistJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    roleUsecase.updateRoleList(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
