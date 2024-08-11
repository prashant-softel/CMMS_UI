import 'package:cmms/app/app.dart';
import 'package:cmms/app/doc_upload_list/doc_upload_list_controller.dart';
import 'package:cmms/app/doc_upload_list/doc_upload_list_presenter.dart';
import 'package:cmms/app/view_doc_upload.dart/view_doc_upload_controller.dart';
import 'package:cmms/app/view_doc_upload.dart/view_doc_upload_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/document_manager_usecase.dart';
import 'package:cmms/domain/usecases/view_doc_upload_usecase.dart';
import 'package:get/get.dart';

class ViewDocUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewDocUploadController(
        Get.put(
          ViewDocUploadPresenter(
            ViewDocUploadUsecase(
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
    Get.lazyPut(
      () => DocumentManagerController(
        Get.put(
          DocumentManagerPresenter(
            DocumentManagerUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
