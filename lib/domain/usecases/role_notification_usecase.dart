import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/get_notification_model.dart';

class RoleNotificationUsecase {
  RoleNotificationUsecase(this.repository);

  Repository repository;
  Future<GetNotificationModel?> getRoleNotificationList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await repository.getRoleNotificationList(
        roleId,
        isLoading,
      );
  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await repository.getRoleList(
        isLoading,
      );
  Future<bool> saveRoleNotification({
    saveRoleNotificationJsonString,
    bool? isLoading,
  }) async =>
      await repository.saveRoleNotification(
          isLoading: isLoading,
          saveRoleNotificationJsonString: saveRoleNotificationJsonString);
}
