import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class RoleAccessUsecase {
  RoleAccessUsecase(this.repository);

  Repository repository;
  Future<AccessLevelModel?> getRoleAccessList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await repository.getRoleAccessList(
        roleId,
        isLoading,
      );
  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await repository.getRoleList(
        isLoading,
      );
}
