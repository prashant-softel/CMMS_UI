import 'package:cmms/app/app.dart';
import 'package:cmms/app/role_access/role_access_presenter.dart';
import 'package:cmms/domain/models/access_level_model.dart';
import 'package:cmms/domain/models/save_role_access_model.dart';
import 'package:get/get.dart';

import '../../domain/models/role_model.dart';

class RoleAccessController extends GetxController {
  RoleAccessController(
    this.roleAccessPresenter,
  );

  RoleAccessPresenter roleAccessPresenter;
  final HomeController homecontroller = Get.find();
  RxList<RoleModel?> roleList = <RoleModel>[].obs;
  Rx<String> selectedRole = ''.obs;
  Rx<bool> isSelectedRole = true.obs;
  int selectedRoleId = 0;
  Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;
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
    final list = await roleAccessPresenter.getRoleList();

    if (list != null) {
      for (var _roleList in list) {
        roleList.add(_roleList);
      }
      selectedRole.value = roleList[0]?.name ?? '';
      selectedRoleId = roleList[0]?.id ?? 0;
      Future.delayed(Duration(seconds: 1), () {
        getRoleAccessList(roleId: selectedRoleId, isloading: true);
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

          getRoleAccessList(roleId: selectedRoleId, isloading: true);
            
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

  Future<void> getRoleAccessList({int? roleId, bool? isloading}) async {
    final _accessLevelModel = await roleAccessPresenter.getRoleAccessList(
        roleId: roleId, isLoading: isloading);

    if (_accessLevelModel != null) {
      accessLevelModel.value = _accessLevelModel;
      accesslevel.value = accessLevelModel.value?.access_list ?? [];
      // for (var _accesslevel in accesslevel) {
      //   if (_accesslevel?.feature_name != null) {
      //     moduleNameSet.add(_accesslevel?.feature_name.value ?? "");
      //   }
      // }
      // moduleNameList.addAll(moduleNameSet.toList());
    }
  }

  Future<bool> saveRoleAccess() async {
    List<SaveRoleAccessList> accesslist = <SaveRoleAccessList>[];
    accesslevel.forEach((e) {
      accesslist.add(SaveRoleAccessList(
          feature_id: e?.feature_id.value ?? 0,
          feature_name: e?.feature_name.value ?? "",
          add: e?.add.value ?? 0,
          delete: e?.delete.value ?? 0,
          edit: e?.edit.value ?? 0,
          selfView: e?.selfView.value ?? 0,
          approve: e?.approve.value ?? 0,
          issue: e?.issue.value ?? 0,
          view: e?.view.value ?? 0));
    });
    SaveRoleAccessLevelModel saveRoleAccessLevelModel =
        SaveRoleAccessLevelModel(
            role_id: selectedRoleId,
            set_existing_users: isExistingusers.value,
            set_role: isSetRole.value,
            access_list: accesslist);
    var saveRolelistJsonString = saveRoleAccessLevelModel.toJson();

    print({"saveRolelistJsonString", saveRolelistJsonString});
    await roleAccessPresenter.saveRoleAccess(
      saveRolelistJsonString: saveRolelistJsonString,
      isLoading: true,
    );
    return true;
  }
}
