import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:cmms/domain/models/user_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/access_level_model.dart';

class ViewUserDetailUsecase {
  ViewUserDetailUsecase(this.repository);
  Repository repository;
  Future<UserDetailsModel?> getUserDetails({
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getUserDetails(
        userId,
        isLoading,
      );
  Future<AccessLevelModel?> getRoleAccessList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await repository.getRoleAccessList(
        roleId,
        isLoading,
      );
  Future<GetNotificationByUserIdModel?> getUserNotificationListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getUserNotificationListById(
        userId,
        isLoading,
      );
  Future<GetAccessLevelByIdModel?> getUserAccessListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getUserAccessListById(
        userId,
        isLoading,
      );
}
