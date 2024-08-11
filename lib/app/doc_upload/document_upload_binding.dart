import 'package:cmms/app/doc_upload/doc_upload_controller.dart';
import 'package:cmms/app/doc_upload/doc_upload_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/document_upload_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:get/get.dart';

class DocumentUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DocumentUploadController(Get.put(
        DocumentUploadPresenter(
          DocumentUploadUsecase(
            Get.find(),
          ),
        ),
      )),
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
