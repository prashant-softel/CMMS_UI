import 'package:cmms/app/stock_managment_update_goods_orders_details.dart/stock_management_update_goods_orders_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'stock_management_update_goods_orders_details_web.dart';

class StockManagementUpdateGoodsOrdersDetailsScreen
    extends GetView<StockManagementUpdateGoodsOrdersDetailsController> {
  StockManagementUpdateGoodsOrdersDetailsScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Mrs'),
              centerTitle: true,
              elevation: 0,
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
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
                    // if (Responsive.isMobile(context) ||
                    //     Responsive.isTablet(context))
                    //   Expanded(
                    //     child: PreventiveChecklistListContentMobile(),
                    //   ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: UpdateGoodsOrdersDetailsWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
