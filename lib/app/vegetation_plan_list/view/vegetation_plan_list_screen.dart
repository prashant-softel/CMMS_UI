import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_controller.dart';
import 'package:cmms/app/vegetation_plan_list/view/vegetation_plan_list_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegetationListPlanScreen extends GetView<VegetationPlanListController> {
  VegetationListPlanScreen({super.key});

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
                  : Dimens.box0,
              Expanded(
                child: Column(
                  children: [
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: VegetationPlanListWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
