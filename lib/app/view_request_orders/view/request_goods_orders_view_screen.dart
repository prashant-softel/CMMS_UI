import 'package:cmms/app/view_request_orders/request_goods_orders_view_controller.dart';
import 'package:cmms/app/view_request_orders/view/request_goods_orders_view_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/home_controller.dart';
import '../../home/widgets/home_drawer.dart';
import '../../utils/responsive.dart';

class PurchaseGoodsorderViewScreen
    extends GetView<PurchaseGoodsorderViewController> {
  PurchaseGoodsorderViewScreen({super.key});
  final controller = Get.find<PurchaseGoodsorderViewController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer()
              : null,
      body: Obx(
        () => Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 450),
              margin: EdgeInsets.only(
                  left: homecontroller.menuButton.value ? 250.0 : 70.0),
              width: Get.width,
              height: Get.height,
              child: Row(
                children: [
                  // (Responsive.isMobile(context) || Responsive.isTablet(context))
                  //     ? Dimens.box0
                  //     : HomeDrawer(),
                  Expanded(
                    child: Column(
                      children: [
                        if (Responsive.isMobile(context))
                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("Data Coming Soon......")),
                          ),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: PurchaseGoodsorderViewWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 450),
              child: HomeDrawer(),
            ),
          ],
        ),
      ),
    );
  }
}
