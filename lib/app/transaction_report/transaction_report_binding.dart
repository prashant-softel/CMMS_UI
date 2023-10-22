import 'package:cmms/app/transaction_report/transaction_report_controller.dart';
import 'package:cmms/app/transaction_report/transaction_report_presenter.dart';
import 'package:get/get.dart';

import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/transaction_report_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class TransactionStockReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TransactionStockReportController(
        Get.put(
          TransactionStockReportPresenter(
            TransactionStockReportUsecase(
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
