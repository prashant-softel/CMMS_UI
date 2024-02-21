import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_controller.dart';
import 'package:cmms/app/vegetation_plan_list/view/vegetation_plan_list_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegetationListPlanScreen extends GetView<VegetationPlanListController> {
  VegetationListPlanScreen({super.key});
  final controller = Get.find<VegetationPlanListController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                centerTitle: true,
                elevation: 0,
              )
            : null,
        drawer: //
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? HomeDrawer()
                : null,
        body: Obx(
          () => Stack(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                      left: homecontroller.menuButton.value ? 250.0 : 70.0),
                  width: Get.width,
                  height: Get.height,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            if (Responsive.isMobile(context))
                              Expanded(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Data Coming Soon......")),
                              ),
                            if (Responsive.isDesktop(context))
                              Expanded(
                                child: VegetationPlanListWeb(),
                              )
                          ],
                        ),
                      ),
                    ],
                  )),
              AnimatedPositioned(
                duration: Duration(milliseconds: 450),
                child: HomeDrawer(),
              ),
            ],
          ),
        ));
  }
}
