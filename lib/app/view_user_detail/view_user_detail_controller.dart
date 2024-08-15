import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_user_detail/view_user_detail_presenter.dart';
import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/get_notification_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:get/get.dart';

import '../../domain/models/user_detail_model.dart';

class ViewUserDetailController extends GetxController {
  ViewUserDetailController(
    this.viewUserDetailPresenter,
  );
  ViewUserDetailPresenter viewUserDetailPresenter;
  Rx<int> userId = 0.obs;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;
  RxList<PlantAccess?> plantListModel = <PlantAccess?>[].obs;
  Rx<GetAccessLevelByIdModel?> accessListModel = GetAccessLevelByIdModel().obs;
  RxList<GetAccessLevel?> accessList = <GetAccessLevel>[].obs;
  Rx<GetNotificationModel?> notificationByUserIdModel =
      GetNotificationModel().obs;
  RxList<NotificationList?> notificationListByUserId = <NotificationList>[].obs;

  @override
  void onInit() async {
    try {
      await setUserId();

      if (userId.value != 0) {
        await getUserDetails(userId: userId.value, isloading: true);
      }

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setUserId() async {
    try {
      final _userId = await viewUserDetailPresenter.getValue();
      if (_userId == null || _userId == '' || _userId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        userId.value = dataFromPreviousScreen['userId'];
        viewUserDetailPresenter.saveValue(userId: userId.value.toString());
      } else {
        userId.value = int.tryParse(_userId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'userId');
    }
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
}
