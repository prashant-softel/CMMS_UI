import 'dart:async';

import 'package:cmms/app/user_list/user_list_presenter.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/user_list_model.dart';
import '../home/home_controller.dart';

class UserListController extends GetxController {
  ///
  UserListController(
    this.userListPresenter,
  );
  UserListPresenter userListPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<UserListModel?>? userList = <UserListModel?>[].obs;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  UserListModel? userListModel;
  RxList<String> userListTableColumns = <String>[].obs;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getUserList(facilityId, true);
      });
    });

    super.onInit();
  }

  Future<void> getUserList(int facilityId, bool isLoading) async {
    userList?.value = <UserListModel>[];
    final _preventiveCheckList = await userListPresenter.getUserList(
        facilityId: facilityId, isLoading: isLoading);

    if (_preventiveCheckList != null) {
      userList!.value = _preventiveCheckList;
      paginationController = PaginationController(
        rowCount: userList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (userList != null && userList!.isNotEmpty) {
        userListModel = userList![0];
        var userListJson = userListModel?.toJson();
        userListTableColumns.value = <String>[];
        for (var key in userListJson?.keys.toList() ?? []) {
          userListTableColumns.add(key);
        }
      }
    }
  }
}
