import 'package:get/get.dart';

import '../../domain/usecases/document_manager_usecase.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'doc_upload_list_controller.dart';
import 'doc_upload_list_presenter.dart';

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
