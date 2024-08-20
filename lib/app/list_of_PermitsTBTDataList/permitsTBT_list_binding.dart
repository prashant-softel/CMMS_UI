import 'package:cmms/app/list_of_PermitsTBTDataList/permitsTBT_list_controller.dart';
import 'package:cmms/app/list_of_PermitsTBTDataList/permitsTBT_list_presenter.dart';
import 'package:cmms/domain/usecases/permitsTBT_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class PermitsTBTDataListBinding extends Bindings {
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
      () => PermitsTBTListController(
        Get.put(
          PermitsTBTListPresenter(
            Get.put(PermitsTBTListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      // permanent: true,
    );
  }
}
