import 'package:cmms/app/view_user_detail/view_user_detail_presenter.dart';
import 'package:get/get.dart';

import '../../domain/models/user_detail_model.dart';

class ViewUserDetailController extends GetxController {
  ViewUserDetailController(
    this.viewUserDetailPresenter,
  );
  ViewUserDetailPresenter viewUserDetailPresenter;
  int userId = 2;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;

  @override
  void onInit() async {
    getUserDetails(userId: userId, isloading: true);

    super.onInit();
  }

  Future<void> getUserDetails({int? userId, bool? isloading}) async {
    final _userDetailModel = await viewUserDetailPresenter.getUserDetails(
        userId: userId, isLoading: isloading);

    if (_userDetailModel != null) {
      userDetailModel.value = _userDetailModel;
    }
  }
}
