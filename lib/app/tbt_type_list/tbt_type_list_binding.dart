import 'package:cmms/app/tbt_type_list/tbt_type_list_controller.dart';
import 'package:cmms/app/tbt_type_list/tbt_type_list_presenter.dart';
import 'package:cmms/domain/usecases/tbt_type_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class TBTTypeListBinding extends Bindings {
  @override
  void dependencies() {
    

    Get.lazyPut(
      () => TBTTypeListController(
        Get.put(
          TBTTypeListPresenter(
            TBTTypeListUsecase(
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
