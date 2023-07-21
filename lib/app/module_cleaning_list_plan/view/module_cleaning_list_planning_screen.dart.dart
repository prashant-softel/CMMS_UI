import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_controller.dart';
import 'package:cmms/app/module_cleaning_list_plan/view/module_cleaning_list_plan_web.dart';
import 'package:cmms/app/stock_managment_goods_list_orders.dart/stock_management_goods_list_orders_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class ModuleCleaningListPlanScreen
    extends GetView<ModuleCleaningListPlanController> {
  ModuleCleaningListPlanScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Calibration History'),
              centerTitle: true,
              elevation: 0,
            ),
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
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: ModuleCleaningListPlan(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
