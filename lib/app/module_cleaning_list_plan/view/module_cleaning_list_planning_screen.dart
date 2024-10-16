import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_controller.dart';
import 'package:cmms/app/module_cleaning_list_plan/view/module_cleaning_list_mobile.dart';
import 'package:cmms/app/module_cleaning_list_plan/view/module_cleaning_list_plan_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleCleaningListPlanScreen
    extends GetView<ModuleCleaningListPlanController> {
  ModuleCleaningListPlanScreen({super.key});
  final controller = Get.find<ModuleCleaningListPlanController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "Module Cleaning Plan",
                ),
              )
            : null,
        drawer: //
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? HomeDrawerMobile()
                : null,
        body: Responsive.isDesktop(context)
            ? Obx(
                () => Stack(
                  children: [
                    AnimatedContainer(
                        duration: Duration(milliseconds: 450),
                        margin: EdgeInsets.only(
                          left: homecontroller.menuButton.value ? 250.0 : 70.0,
                        ),
                        width: Get.width,
                        height: Get.height,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ModuleCleaningListPlan(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    AnimatedPositioned(
                      child: HomeDrawer(),
                      duration: Duration(milliseconds: 450),
                    )
                  ],
                ),
              )
            : Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 450),
                        margin: EdgeInsets.only(left: 0),
                        width: Get.width,
                        height: Get.height,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ModuleCleaningListMobile(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text("Data Coming Soon ..."),
                  ),
      ),
    );
  }
}
