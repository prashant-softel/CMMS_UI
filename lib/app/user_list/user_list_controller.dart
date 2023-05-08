import 'package:cmms/app/user_list/user_list_presenter.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  ///
  UserListController(
    this.userListPresenter,
  );
  UserListPresenter userListPresenter;

  @override
  void onInit() async {
    super.onInit();
  }
}
