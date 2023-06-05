import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/frequency_list_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/preventive_list_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'frequency_list_controller.dart';
import 'frequency_list_presenter.dart';

class FrequencyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FrequencyListController(
        Get.put(
          FrequencyListPresenter(
            FrequencylistUsecase(
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
