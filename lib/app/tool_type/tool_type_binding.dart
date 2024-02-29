import 'package:cmms/app/tool_type/tool_type_controller.dart';
import 'package:cmms/app/tool_type/tool_type_presenter.dart';
import 'package:cmms/domain/usecases/tool_type_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class ToolTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ToolTypeController(
        Get.put(
          ToolTypePresenter(
            ToolTypeUsecase(
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
