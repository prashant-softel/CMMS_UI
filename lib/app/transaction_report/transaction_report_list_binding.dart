import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/transaction_report_list_usecase.dart';

import 'package:get/get.dart';

import 'transaction_report_list_controller.dart';
import 'transaction_report_list_presenter.dart';

class TransactionReportListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TransactionReportListController(
        Get.put(
          TransactionReportListPresenter(
            TransactionReportListUsecase(
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
