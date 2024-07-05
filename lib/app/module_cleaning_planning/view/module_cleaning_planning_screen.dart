import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';
import 'package:cmms/app/module_cleaning_planning/view/module_cleaning_plan_mobile.dart';
import 'package:cmms/app/module_cleaning_planning/view/module_cleaning_planning_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleCleaningPlanningScreen
    extends GetView<ModuleCleaningPlanningController> {
  ModuleCleaningPlanningScreen({super.key});
  final controller = Get.find<ModuleCleaningPlanningController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Module Cleaning",
              ),
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
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
                                child: ModuleCleaningPlanningWeb(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      margin: EdgeInsets.only(
                        left: 0,
                      ),
                      width: Get.width,
                      height: Get.height,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: ModuleCleaningPlanMobile(),
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
    );
  }
}
