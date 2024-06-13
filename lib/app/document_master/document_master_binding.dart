
import 'package:cmms/app/document_master/document_master_controller.dart';
import 'package:cmms/app/document_master/document_master_presenter.dart';
import 'package:cmms/domain/usecases/document_master_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class DocumentMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DocumentMasterController(
        Get.put(
          DocumentMasterPresenter(
            DocumentMasterUsecase(
              Get.find(),
            )
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
