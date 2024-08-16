import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:cmms/domain/models/user_detail_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/access_level_model.dart';

class UserProfileUsecase {
  UserProfileUsecase(this.repository);
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
  Future<GetNotificationModel?> getUserNotificationListById({
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
  void saveValue({String? userId}) async =>
      repository.saveValue(LocalKeys.userDetailId, userId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.userDetailId);
  void clearValue() async => repository.clearData(LocalKeys.userDetailId);
}
