import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:cmms/app/veg_execution_screen/view/veg_execution_mobile.dart';
import 'package:cmms/app/veg_execution_screen/view/veg_execution_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegExecutionScreen extends GetView<VegExecutionController> {
  VegExecutionScreen({super.key});
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "VEF Execution",
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
                                child: VegExecutionWeb(),
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
                                  child: VegExecutionMobile(),
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
