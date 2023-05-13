import 'package:cmms/domain/models/user_detail_model.dart';

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
}
