
import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:get/get.dart';
import '../../domain/usecases/asset_master_usecase.dart';
import '../../domain/usecases/module_list_usecase.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'asset_master_Controller.dart';
import 'asset_master_Presenter.dart';
// import 'mrs_Details_Controller.dart';
// import 'mrs_Details_Presenter.dart';
// import 'module_list_controller.dart';
// import 'module_list_presenter.dart';

class AssetMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AssetMasterController(
        Get.put(
          AssetMasterPresenter(
            AssetMasterUsecase(
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
