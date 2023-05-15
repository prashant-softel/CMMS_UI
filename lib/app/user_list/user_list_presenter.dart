import '../../domain/models/user_list_model.dart';
import '../../domain/usecases/user_list_usecase.dart';

class UserListPresenter {
  UserListPresenter(this.userListUsecase);
  UserListUsecase userListUsecase;
  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await userListUsecase.getUserList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
