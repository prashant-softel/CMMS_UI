import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/competency_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'competency_list_controller.dart';
import 'competency_list_presenter.dart';


class CompetencyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CompetencyListController(
        Get.put(
          CompetencyListPresenter(
            CompetencylistUsecase(
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
