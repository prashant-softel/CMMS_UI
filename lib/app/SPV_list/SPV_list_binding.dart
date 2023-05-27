import 'package:cmms/app/SPV_list/SPV_list_controller.dart';
import 'package:cmms/app/SPV_list/SPV_list_presenter.dart';
import 'package:cmms/domain/usecases/SPV_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class SPVListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SPVListController(
        Get.put(
          SPVListPresenter(
            SPVListUsecase(
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
