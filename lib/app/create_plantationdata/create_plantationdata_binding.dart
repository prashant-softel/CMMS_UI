
import 'package:cmms/app/create_plantationdata/create_plantationdata_controller.dart';
import 'package:cmms/app/create_plantationdata/create_plantationdata_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/create_plantationdata_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class PlantationDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePlantationDataController>(
      () => CreatePlantationDataController(
        CreatePlantationDataPresenter(
          CreatePlantationDataUsecase(
            Get.find(),
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
