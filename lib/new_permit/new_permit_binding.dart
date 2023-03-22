import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';
import 'package:cmms/new_permit/new_permit_controller.dart';
import 'package:cmms/new_permit/new_permit_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/preventive_list_usecase.dart';

class NewPermitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NewPermitController(
        Get.put(
          NewPermitPresenter(
            NewPermitUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
