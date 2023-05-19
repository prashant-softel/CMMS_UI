import 'package:cmms/app/view_user_detail/view_user_detail_presenter.dart';
import 'package:get/get.dart';

import '../../domain/models/access_level_model.dart';
import '../../domain/models/user_detail_model.dart';

class ViewUserDetailController extends GetxController {
  ViewUserDetailController(
    this.viewUserDetailPresenter,
  );
  ViewUserDetailPresenter viewUserDetailPresenter;
  int userId = 2;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;
  int selectedRoleId = 2;
  Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;

  @override
  void onInit() async {
    await getUserDetails(userId: userId, isloading: true);
    await getRoleAccessList(roleId: selectedRoleId, isloading: true);
    super.onInit();
  }

  Future<void> getUserDetails({int? userId, bool? isloading}) async {
    final _userDetailModel = await viewUserDetailPresenter.getUserDetails(
        userId: userId, isLoading: isloading);

    if (_userDetailModel != null) {
      userDetailModel.value = _userDetailModel;
    }
  }

  Future<void> getRoleAccessList({int? roleId, bool? isloading}) async {
    final _accessLevelModel = await viewUserDetailPresenter.getRoleAccessList(
        roleId: roleId, isLoading: isloading);

    if (_accessLevelModel != null) {
      accessLevelModel.value = _accessLevelModel;
      accesslevel.value = accessLevelModel.value?.access_list ?? [];
    }
  }
}
