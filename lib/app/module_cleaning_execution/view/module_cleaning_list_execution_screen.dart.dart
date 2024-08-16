import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_controller.dart';
import 'package:cmms/app/module_cleaning_execution/view/mc_execution_mobile_screen.dart';
import 'package:cmms/app/module_cleaning_execution/view/module_cleaning_list_execution_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleCleaningListExecutionScreen
    extends GetView<ModuleCleaningListExecutionController> {
  ModuleCleaningListExecutionScreen({super.key});
  final controller = Get.find<ModuleCleaningListExecutionController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "MC Execution",
                ),
              )
            : null,
        drawer: //
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? HomeDrawerMobile()
                : null,
        body:
            //  Obx(
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
                    (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
                        ? Dimens.box0
                        : Container(),
                    Expanded(
                      child: Column(
                        children: [
                          if (Responsive.isMobile(context))
                            Expanded(
                                child: ModuleCleaningListExecutionMobile()),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: ModuleCleaningListExecution(),
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
      // ),
    );
  }
}
