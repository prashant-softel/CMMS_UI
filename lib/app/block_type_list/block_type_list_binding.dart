import 'package:cmms/app/block_type_list/block_type_list_controller.dart';
import 'package:cmms/app/block_type_list/block_type_list_presenter.dart';
import 'package:cmms/domain/usecases/block_type_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class BlockTypeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BlockTypeListController(
        Get.put(
          BlockTypeListPresenter(
            BlockTypeListUsecase(
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
