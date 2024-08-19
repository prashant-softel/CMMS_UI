import 'package:cmms/app/list_of_occupationalhealth/occupational_list_controller.dart';
import 'package:cmms/domain/usecases/occupational_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'occupational_list_presenter.dart';

class OccupationalDataListBinding extends Bindings {
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
      () => OccupationalDataListController(
        Get.put(
          OccupationalListPresenter(
            Get.put(OccupationalListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      // permanent: true,
    );
  }
}
