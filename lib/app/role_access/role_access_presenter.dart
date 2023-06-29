import 'package:cmms/domain/models/role_model.dart';

import '../../domain/models/access_level_model.dart';
import '../../domain/usecases/role_access_usecase.dart';

class RoleAccessPresenter {
  RoleAccessPresenter(this.roleAccessUsecase);
  RoleAccessUsecase roleAccessUsecase;
  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await roleAccessUsecase.getRoleList(
        isLoading: isLoading ?? false,
      );
  Future<AccessLevelModel?> getRoleAccessList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await roleAccessUsecase.getRoleAccessList(
        roleId: roleId,
        isLoading: isLoading,
      );
}
