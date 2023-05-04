import 'package:cmms/app/app.dart';
import 'package:cmms/app/master_dashboard/master_controller.dart';
import 'package:cmms/app/master_dashboard/master_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/masters_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/breakdown_usecase.dart';


/// A list of bindings which will be used in the route of [HomeScreen].
class MastersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MastersController(
        Get.put(
          MastersPresenter(
            MastersUsecase(
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
