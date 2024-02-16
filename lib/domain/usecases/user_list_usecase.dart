import 'package:cmms/domain/domain.dart';

import '../models/user_list_model.dart';

class UserListUsecase {
  final Repository repository;

  UserListUsecase(this.repository);
  Future<List<UserListModel>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(
        facilityId,
        isLoading,
      );

      deleteUser(
      {required Object user_id, required bool isLoading}) async =>
      await repository.deleteUser(
        user_id,
        isLoading,
      );
  void clearValue() async => repository.clearData(LocalKeys.userDetailId);
}
