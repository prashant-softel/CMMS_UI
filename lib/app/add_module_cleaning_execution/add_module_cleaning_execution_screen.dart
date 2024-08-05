import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/add_module_cleaning_execution/view/web/module_cleaning_execution_mobile.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/web/add_module_cleaning_execution_content_web.dart';

class AddModuleCleaningExecutionScreen
    extends GetView<AddModuleCleaningExecutionController> {
  AddModuleCleaningExecutionScreen({super.key});
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                child: AddModuleCleaningExecutionContentWeb(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 450),
                    child: HomeDrawer(),
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
                                  child: McExecutionMobile(),
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
