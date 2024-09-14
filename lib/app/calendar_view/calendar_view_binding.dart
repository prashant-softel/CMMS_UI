import 'package:cmms/app/app.dart';
import 'package:cmms/app/calendar_view/calendar_view_controller.dart';
import 'package:cmms/app/calendar_view/calendar_view_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/calendar_view_usecase.dart';
import 'package:get/get.dart';

class CalendarViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CalendarViewController(
        Get.put(
          CalendarViewPresenter(
            CalendarViewUsecase(
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
