import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/preventive_maintenance_task/view/preventive_maintenance_task_content_mobile.dart';
import 'package:cmms/app/preventive_maintenance_task/view/preventive_maintenance_task_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/heading_profile_app_bar.dart';
import '../preventive_maintenance_task_controller.dart';

class PreventiveMaintenanceTaskScreen
    extends GetView<PreventiveMaintenanceTaskController> {
  PreventiveMaintenanceTaskScreen({super.key});
  final controller = Get.find<PreventiveMaintenanceTaskController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Pm Task",
              ),
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawerMobile()
              : null,
      body:
          // Obx(
          //   () =>
          Stack(
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
                          Expanded(child: PreventiveTaskContentMobile()),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: PreventiveMaintenanceTaskContentWeb(),
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
      //),
    );
  }
}
