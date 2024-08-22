import 'package:cmms/app/app.dart';
import 'package:cmms/app/calender_view_dashboard/calendar_view_dashboard_controller.dart';
import 'package:cmms/app/calender_view_dashboard/calendar_view_dashboard_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/calender_view_dashboard_usecase.dart';

import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [HomeScreen].
class CalendarViewDashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CalendarViewDashbordController(
        Get.put(
          CalendarViewDashbordPresenter(
            CalendarViewDashbordUsecase(
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
