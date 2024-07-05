import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_controller.dart';
import 'package:cmms/app/add_vegetation_plan/view/add_vegetation_plan_mobile.dart';
import 'package:cmms/app/add_vegetation_plan/view/add_vegetation_plan_web.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVegetationPlanScreen extends GetView<AddVegetationPlanController> {
  AddVegetationPlanScreen({super.key});
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Vegetation Plan",
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
                                child: AddVegetationPlanWeb(),
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
                                  child: AddVegetationMobile(),
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
