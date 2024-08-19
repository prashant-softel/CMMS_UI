import 'package:cmms/app/list_of_Regulatary_Visits%20/regulataryvisits_list_controller.dart';
import 'package:cmms/domain/usecases/regulataryvisits_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';
import 'regulataryvisits_list_presenter.dart';

class RegulataryDataListBinding extends Bindings {
  @override
  void dependencies() {
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
      () => RegulataryDataListController(
        Get.put(
          RegulataryListPresenter(
            Get.put(RegulataryListUsecase(Get.find())),
          ),
          permanent: true,
        ),
      ),
      // permanent: true,
    );
  }
}
