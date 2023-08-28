import 'package:cmms/app/employee_stock_report/employee_stock_report_controller.dart';
import 'package:cmms/app/employee_stock_report/employee_stock_report_presenter.dart';
import 'package:cmms/domain/usecases/employee_stock_report_usecase.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class EmployeeStockReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EmployeeStockReportController(
        Get.put(
          EmployeeStockReportPresenter(
            EmployeeStockReportUsecase(
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
