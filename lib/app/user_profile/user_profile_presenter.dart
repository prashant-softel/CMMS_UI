import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:cmms/domain/models/user_detail_model.dart';

import '../../domain/models/access_level_model.dart';
import '../../domain/usecases/user_profile_usecase.dart';

class UserProfilePresenter {
  UserProfilePresenter(this.userProfileUsecase);
  UserProfileUsecase userProfileUsecase;
  Future<UserDetailsModel?> getUserDetails({
    int? userId,
    bool? isLoading,
  }) async =>
      await userProfileUsecase.getUserDetails(
        userId: userId,
        isLoading: isLoading,
      );
  Future<AccessLevelModel?> getRoleAccessList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await userProfileUsecase.getRoleAccessList(
        roleId: roleId,
        isLoading: isLoading,
      );
  Future<GetNotificationModel?> getUserNotificationListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await userProfileUsecase.getUserNotificationListById(
        userId: userId,
        isLoading: isLoading,
      );
  Future<GetAccessLevelByIdModel?> getUserAccessListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await userProfileUsecase.getUserAccessListById(
        userId: userId,
        isLoading: isLoading,
      );
  void saveValue({String? userId}) async {
    return userProfileUsecase.saveValue(userId: userId);
  }

  Future<String?> getValue() async => await userProfileUsecase.getValue();
  void clearValue() async => userProfileUsecase.clearValue();
}
