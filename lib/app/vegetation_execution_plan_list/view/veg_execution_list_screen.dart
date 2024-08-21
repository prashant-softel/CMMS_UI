import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/vegetation_execution_plan_list/veg_execution_list_controller.dart';
import 'package:cmms/app/vegetation_execution_plan_list/view/veg_execution_list_mobile.dart';
import 'package:cmms/app/vegetation_execution_plan_list/view/veg_execution_list_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegExecutionListScreen extends GetView<VegExecutionListController> {
  VegExecutionListScreen();
  final VegExecutionListController controller = Get.find();

   final homecontroller = Get.find<HomeController>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "VEG Execution",
              ),
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile()
          : null,
      body: Stack(
        children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 450),
              margin: EdgeInsets.only(
                left: Responsive.isDesktop(context)
                    ? homecontroller.menuButton.value
                        ? 250.0
                        : 70.0
                    : 0,
              ),
              width: Get.width,
              height: Get.height,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        if (Responsive.isMobile(context))
                          Expanded(
                            child: VegExecutionListMobile(),
                          ),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: VegExecutionListWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              )),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
              : Dimens.box0
        ],
      ),
    );
  }
}
