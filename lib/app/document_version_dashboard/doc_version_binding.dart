import 'package:cmms/app/app.dart';
import 'package:cmms/app/document_version_dashboard/doc_version_controller.dart';
import 'package:cmms/app/document_version_dashboard/doc_version_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/docVersion_dashboard_usecase.dart';

import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class DocVersionDashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DocVersionDashbordController(
        Get.put(
          DocVersionPresenter(
            DocVersionUsecase(
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
