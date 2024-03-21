import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/pm_task_view/view/pm_task_view_content_mobile.dart';
import 'package:cmms/app/pm_task_view/view/pm_task_view_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../pm_task_view_controller.dart';

class PreventiveMaintenanceTaskViewScreen
    extends GetView<PreventiveMaintenanceTaskViewController> {
  PreventiveMaintenanceTaskViewScreen({super.key});
  final controller = Get.find<PreventiveMaintenanceTaskViewController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "Pm Task View",
                ),
              )
            : null,
        drawer: //
            (Responsive.isMobile(context) || Responsive.isTablet(context))
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
                            Expanded(child: PreventiveTaskViewContentMobile()),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: PreventiveMaintenanceTaskViewContentWeb(),
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

        //  Container(
        //     width: Get.width,
        //     height: Get.height,
        //     child: Row(
        //       children: [
        //         // (Responsive.isMobile(context) || Responsive.isTablet(context))
        //         //     ? Dimens.box0
        //         //     : HomeDrawer(),
        //         Expanded(
        //           child: Column(
        //             children: [
        //               if (Responsive.isMobile(context))
        //                 Expanded(child: PreventiveTaskViewContentMobile()),
        //               if (Responsive.isDesktop(context))
        //                 Expanded(
        //                   child: PreventiveMaintenanceTaskViewContentWeb(),
        //                 )
        //             ],
        //           ),
        //         ),
        //       ],
        //     )),
      ),
    );
  }
}
