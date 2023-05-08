import 'package:cmms/app/permit_type/permit_type_controller.dart';
import 'package:cmms/app/permit_type/permit_type_presenter.dart';
import 'package:cmms/app/preventive_check_point/preventive_check_point_controller.dart';
import 'package:cmms/app/preventive_check_point/preventive_check_point_presenter.dart';
import 'package:cmms/app/preventive_maintanance/preventive_maintenance_controller.dart';
import 'package:cmms/app/safety_questions_list/safety_questions_list_controller.dart';
import 'package:cmms/app/safety_questions_list/safety_questions_presenter.dart';
import 'package:cmms/domain/usecases/masters_usecase.dart';
import 'package:cmms/domain/usecases/permit_type_usecase.dart';
import 'package:cmms/domain/usecases/preventive_checkpoint_usecase.dart';
import 'package:cmms/domain/usecases/safety_questions_list_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class SafetyQuestionsListBinding extends Bindings {
  @override
  void dependencies() {
    

    Get.lazyPut(
      () => SafetyQuestionsListController(
        Get.put(
          SafetyQuestionsListPresenter(
            SafetyQuestionsListUsecase(
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
