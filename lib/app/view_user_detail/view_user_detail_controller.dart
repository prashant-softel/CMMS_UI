import 'package:cmms/app/view_user_detail/view_user_detail_presenter.dart';
import 'package:get/get.dart';

class ViewUserDetailController extends GetxController {
  ViewUserDetailController(
    this.viewUserDetailPresenter,
  );
  ViewUserDetailPresenter viewUserDetailPresenter;
}
