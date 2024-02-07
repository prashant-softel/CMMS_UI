import 'package:cmms/app/stock_managment_add_goods_orders.dart/stock_management_add_goods_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'stock_management_add_goods_orders_web.dart';

class StockManagementAddGoodsOrdersScreen
    extends GetView<StockManagementAddGoodsOrdersController> {
  StockManagementAddGoodsOrdersScreen({super.key});
  final controller = Get.find<StockManagementAddGoodsOrdersController>();

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
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
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
                        child: AddGoodsOrdersWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
