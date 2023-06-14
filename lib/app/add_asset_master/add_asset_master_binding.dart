import 'package:cmms/app/add_user/add_user_presenter.dart';

import 'package:get/get.dart';

import '../../domain/usecases/add_asset_master_usecase.dart';
import '../../domain/usecases/add_user_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'add_asset_master_controller.dart';
import 'add_asset_master_presenter.dart';
// import 'add_user_controller.dart';
// import '../add_asset_master_controller.dart';

class AddAssetMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddAssetMasterController(
        Get.put(
          AddAssetMasterPresenter(
            AddAssetMasterUsecase(
              Get.find(),
            ),
          ) ,
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
