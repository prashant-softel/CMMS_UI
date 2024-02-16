import '../../domain/models/user_list_model.dart';
import '../../domain/usecases/user_list_usecase.dart';

class UserListPresenter {
  UserListPresenter(this.userListUsecase);
  UserListUsecase userListUsecase;
  Future<List<UserListModel>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await userListUsecase.getUserList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  deleteUser(String? user_id, {required bool isLoading}) async =>
      await userListUsecase.deleteUser(
        user_id: user_id ?? 0,
        isLoading: isLoading,
      );
  void clearValue() async => userListUsecase.clearValue();
}
