import 'package:cmms/app/list_of_fueldata/fueldata_list_controller.dart';
import 'package:cmms/domain/usecases/fueldata_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'fueldata_list_presenter.dart';

class FuelDataListBinding extends Bindings {
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
      () => FuelDataListController(
        Get.put(
          FuelDataListPresenter(
            Get.put(FuelDataListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      // permanent: true,
    );
  }
}
