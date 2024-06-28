import 'package:cmms/app/app.dart';
import 'package:cmms/app/role_notification/role_notification_presenter.dart';

import 'package:get/get.dart';

import '../../domain/models/get_notification_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/models/save_role_notification_model.dart';

class RoleNotificationController extends GetxController {
  RoleNotificationController(
    this.roleNotificationPresenter,
  );

  RoleNotificationPresenter roleNotificationPresenter;
  final HomeController homecontroller = Get.find();
  RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = ''.obs;
  Rx<bool> isSelectedRole = true.obs;
  int selectedRoleId = 0;
  Rx<GetNotificationModel?> notificationModel = GetNotificationModel().obs;
  RxList<NotificationList?> notificationList = <NotificationList>[].obs;

  final RxBool isChecked = false.obs;
  final RxBool isCheckedmodule = false.obs;

  void onInit() async {
    await getRoleList();

    super.onInit();
  }

  var isExistingusers = false.obs;
  var isSetRole = true.obs;

  void existingusertoggle() {
    isExistingusers.value = !isExistingusers.value;
  }

  void setRoletoggle() {
    isSetRole.value = !isSetRole.value;
  }

  Future<void> getRoleList() async {
    final list = await roleNotificationPresenter.getRoleList();

    if (list != null) {
      for (var _roleList in list) {
        roleList.add(_roleList);
      }
      selectedRole.value = roleList[0]?.name ?? '';
      selectedRoleId = roleList[0]?.id ?? 0;
      Future.delayed(Duration(seconds: 1), () {
        getRoleNotificationList(roleId: selectedRoleId, isloading: true);
      });
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<RoleModel>):
        {
        if (value != "Please Select") {
            int roleIndex = roleList.indexWhere((x) => x?.name == value);
          selectedRoleId = roleList[roleIndex]?.id ?? 0;
          selectedRole.value = roleList[0]?.name ?? '';

          getRoleNotificationList(roleId: selectedRoleId, isloading: true);
        }else{
          selectedRoleId=0;
        }
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> getRoleNotificationList({int? roleId, bool? isloading}) async {
    final _notificationModel = await roleNotificationPresenter
        .getRoleNotificationList(roleId: roleId, isLoading: isloading);
    if (_notificationModel != null) {
      notificationModel.value = _notificationModel;
      notificationList.value = notificationModel.value?.notification_list ?? [];
    }
  }

  Future<bool> saveRoleNotification() async {
    List<SaveRoleNotificationList> notification_list =
        <SaveRoleNotificationList>[];
    notificationList.forEach((e) {
      notification_list.add(SaveRoleNotificationList(
        notification_id: e?.notification_id.value ?? 0,
        flag: e?.default_flag.value ?? 0,
        can_change: e?.can_change.value ?? 0,
      ));
    });
    SaveRoleNotificationModel saveRoleNotificationModel =
        SaveRoleNotificationModel(
            role_id: selectedRoleId,
            set_existing_users: isExistingusers.value,
            set_role: isSetRole.value,
            notification_list: notification_list);
    var saveRoleNotificationJsonString = saveRoleNotificationModel.toJson();

    print({"saveRoleNotificationJsonString", saveRoleNotificationJsonString});
    await roleNotificationPresenter.saveRoleNotification(
      saveRoleNotificationJsonString: saveRoleNotificationJsonString,
      isLoading: true,
    );
    return true;
  }
}
