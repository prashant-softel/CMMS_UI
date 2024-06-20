import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/pm_plan_list/view/pm_plan_list_content_mobile.dart';
import 'package:cmms/app/pm_plan_list/view/pm_plan_list_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../pm_plan_list_controller.dart';

class PmPlanListScreen extends GetView<PmPlanListController> {
  PmPlanListScreen({super.key});
  final controller = Get.find<PmPlanListController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "Pm Plan",
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
                            Expanded(child: PmPlanContentMobile()),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: PmPlanListContentWeb(),
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
      ),
    );
  }
}
