import 'package:cmms/domain/domain.dart';

import '../models/user_list_model.dart';

class UserListUsecase {
  final Repository repository;

  UserListUsecase(this.repository);
  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(
        facilityId,
        isLoading,
      );
}
