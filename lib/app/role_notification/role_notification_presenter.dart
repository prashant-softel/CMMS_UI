import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/role_model.dart';
import 'package:cmms/domain/usecases/role_notification_usecase.dart';

class RoleNotificationPresenter {
  RoleNotificationPresenter(this.roleNotificationUsecase);
  RoleNotificationUsecase roleNotificationUsecase;
  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await roleNotificationUsecase.getRoleList(
        isLoading: isLoading ?? false,
      );
  Future<GetNotificationModel?> getRoleNotificationList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await roleNotificationUsecase.getRoleNotificationList(
        roleId: roleId,
        isLoading: isLoading,
      );
  Future<bool> saveRoleNotification({
    saveRoleNotificationJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    roleNotificationUsecase.saveRoleNotification(
      saveRoleNotificationJsonString: saveRoleNotificationJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
