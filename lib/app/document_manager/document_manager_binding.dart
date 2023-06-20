import 'package:get/get.dart';

import '../../domain/usecases/document_manager_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'document_manager_controller.dart';
import 'document_manager_presenter.dart';

class DocumentManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentManagerController>(
      () => DocumentManagerController(
        DocumentManagerPresenter(
          DocumentManagerUsecase(
            Get.find(),
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
