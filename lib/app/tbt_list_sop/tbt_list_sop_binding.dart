import 'package:cmms/app/tbt_list_sop/tbt_list_sop_controller.dart';
import 'package:cmms/app/tbt_list_sop/tbt_list_sop_presenter.dart';
import 'package:cmms/domain/usecases/tbt_list_sop_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class TBTSOPListBinding extends Bindings {
  @override
  void dependencies() {
    

    Get.lazyPut(
      () => TBTSOPListController(
        Get.put(
          TBTSOPListPresenter(
            TBTSOPListUsecase(
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
