import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/stock_managment_goods_order_req_details_usecase.dart';
import 'package:get/get.dart';

import 'request_order_details_controller.dart';
import 'request_order_details_presenter.dart';

class GoodsOrdersReqDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GoodsOrdersReqDetailController(
        Get.put(
          GoodsOrdersReqDetailPresenter(
            GoodsOrdersReqDetailUsecase(
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
