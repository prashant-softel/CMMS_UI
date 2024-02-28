import 'package:cmms/app/edit_vegetation_plan/edit_vegetation_plan_controller.dart';
import 'package:cmms/app/edit_vegetation_plan/view/edit_vegetation_plan_web.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditVegetationPlanScreen extends GetView<EditVegetationPlanController> {
  EditVegetationPlanScreen({super.key});
  final EditVegetationPlanController controller = Get.find();
  final HomeController homecontroller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                centerTitle: true,
                elevation: 0,
              )
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
                            // if (Responsive.isMobile(context) ||
                            //     Responsive.isTablet(context))
                            //   Expanded(
                            //     child: ModuleCleaningPlanningWebMobile(),
                            //   ),

                            if (Responsive.isDesktop(context))
                              Expanded(
                                child: EditVegetationPlanWeb(),
                              )
                          ],
                        ),
                      ),
                    ],
                  )),
              AnimatedPositioned(
                child: HomeDrawer(),
                duration: Duration(milliseconds: 450),
              ),
            ],
          ),
        ));
  }
}
