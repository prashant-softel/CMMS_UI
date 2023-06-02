import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:cmms/domain/models/user_detail_model.dart';

import '../../domain/models/access_level_model.dart';
import '../../domain/usecases/view_user_detail_usecase.dart';

class ViewUserDetailPresenter {
  ViewUserDetailPresenter(this.viewUserDetailUsecase);
  ViewUserDetailUsecase viewUserDetailUsecase;
  Future<UserDetailsModel?> getUserDetails({
    int? userId,
    bool? isLoading,
  }) async =>
      await viewUserDetailUsecase.getUserDetails(
        userId: userId,
        isLoading: isLoading,
      );
  Future<AccessLevelModel?> getRoleAccessList({
    int? roleId,
    bool? isLoading,
  }) async =>
      await viewUserDetailUsecase.getRoleAccessList(
        roleId: roleId,
        isLoading: isLoading,
      );
  Future<GetNotificationByUserIdModel?> getUserNotificationListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await viewUserDetailUsecase.getUserNotificationListById(
        userId: userId,
        isLoading: isLoading,
      );
  Future<GetAccessLevelByIdModel?> getUserAccessListById({
    int? userId,
    bool? isLoading,
  }) async =>
      await viewUserDetailUsecase.getUserAccessListById(
        userId: userId,
        isLoading: isLoading,
      );
}
