import 'package:cmms/app/view_user_detail/view_user_detail_presenter.dart';
import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:get/get.dart';

import '../../domain/models/user_detail_model.dart';

class ViewUserDetailController extends GetxController {
  ViewUserDetailController(
    this.viewUserDetailPresenter,
  );
  ViewUserDetailPresenter viewUserDetailPresenter;
  int userId = 0;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;
  RxList<PlantList?> plantListModel = <PlantList?>[].obs;
  Rx<GetAccessLevelByIdModel?> accessListModel = GetAccessLevelByIdModel().obs;
  RxList<GetAccessLevel?> accessList = <GetAccessLevel>[].obs;
  Rx<GetNotificationByUserIdModel?> notificationByUserIdModel =
      GetNotificationByUserIdModel().obs;
  RxList<NotificationListByUserId?> notificationListByUserId =
      <NotificationListByUserId>[].obs;

  //int selectedRoleId = 0;
  // Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  // RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;

  @override
  void onInit() async {
    userId = Get.arguments;
    print('userId:$userId');
    if (userId != 0) {
      await getUserDetails(userId: userId, isloading: true);
    }

    super.onInit();
  }

  Future<void> getUserDetails({int? userId, bool? isloading}) async {
    final _userDetailModel = await viewUserDetailPresenter.getUserDetails(
        userId: userId, isLoading: isloading);

    if (_userDetailModel != null) {
      userDetailModel.value = _userDetailModel;
      plantListModel.value = _userDetailModel.plant_list ?? [];
      // selectedRoleId = userDetailModel.value?.role_id ?? 0;
      await getUserAccessListById(userId: userId, isloading: true);
      await getUserNotificationListById(userId: userId, isloading: true);

      // await getRoleAccessList(roleId: selectedRoleId, isloading: true);
    }
  }

  Future<void> getUserNotificationListById(
      {int? userId, bool? isloading}) async {
    final _notificationListModel = await viewUserDetailPresenter
        .getUserNotificationListById(userId: userId, isLoading: isloading);
    if (_notificationListModel != null) {
      notificationByUserIdModel.value = _notificationListModel;
      notificationListByUserId.value =
          notificationByUserIdModel.value?.notification_list ?? [];
    }
  }

  Future<void> getUserAccessListById({int? userId, bool? isloading}) async {
    final _accessListModel = await viewUserDetailPresenter
        .getUserAccessListById(userId: userId, isLoading: isloading);
    print({"repsss", _accessListModel});
    if (_accessListModel != null) {
      accessListModel.value = _accessListModel;
      accessList.value = accessListModel.value?.access_list ?? [];
    }
  }
  // Future<void> getRoleAccessList({int? roleId, bool? isloading}) async {
  //   final _accessLevelModel = await viewUserDetailPresenter.getRoleAccessList(
  //       roleId: roleId, isLoading: isloading);

  //   if (_accessLevelModel != null) {
  //     accessLevelModel.value = _accessLevelModel;
  //     accesslevel.value = accessLevelModel.value?.access_list ?? [];
  //   }
  // }
}
