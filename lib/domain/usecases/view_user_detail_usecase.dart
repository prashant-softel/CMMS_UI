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
}
