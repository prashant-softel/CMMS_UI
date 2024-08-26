import 'package:cmms/app/list_of_kaizensdata/kaizensdata_list_controller.dart';
import 'package:cmms/domain/usecases/kaizensdata_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'kaizensdata_list_presenter.dart';

class KaizensListBinding extends Bindings {
  @override
  void dependencies() {
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
    Get.lazyPut(
      () => KaizensDataListController(
        Get.put(
          KaizensDataListPresenter(
            Get.put(KaizensDataListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      // permanent: true,
    );
  }
}
