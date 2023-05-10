import 'package:cmms/app/add_user/add_user_presenter.dart';
import 'package:get/get.dart';

class AddUserController extends GetxController {
  AddUserController(
    this.addUserPresenter,
  );
  AddUserPresenter addUserPresenter;
}
