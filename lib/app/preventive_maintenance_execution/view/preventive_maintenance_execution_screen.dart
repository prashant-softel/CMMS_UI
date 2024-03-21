import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/preventive_maintenance_execution/view/preventive_maintenance_execution_content_mobile.dart';
import 'package:cmms/app/preventive_maintenance_execution/view/preventive_maintenance_execution_content_web.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../utils/responsive.dart';
import '../preventive_maintenance_execution_controller.dart';

class PreventiveMaintenanceExecutionScreen
    extends GetView<PreventiveMaintenanceExecutionController> {
  PreventiveMaintenanceExecutionScreen({super.key});
  final controller = Get.find<PreventiveMaintenanceExecutionController>();
  final HomeController homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Pm Execution",
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
                    : 0),
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
                            child:
                                PreventiveMaintenanceExecutionContentMobile()),
                      if (Responsive.isDesktop(context))
                        Expanded(
                          child: PreventiveMaintenanceExecutionContentWeb(),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
              : Dimens.box0
        ],
      ),
    );
  }
}
