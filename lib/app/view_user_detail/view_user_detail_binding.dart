import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/view_user_detail/view_user_detail_controller.dart';
import 'package:cmms/app/view_user_detail/view_user_detail_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/view_user_detail_usecase.dart';

class ViewUserDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewUserDetailController(
        Get.put(
          ViewUserDetailPresenter(
            ViewUserDetailUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
    Get.lazyPut(
      () => HomeController(
        Get.put(
          HomePresenter(
            HomeUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
