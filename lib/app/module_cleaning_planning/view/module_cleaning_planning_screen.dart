import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';
import 'package:cmms/app/module_cleaning_planning/view/module_cleaning_planning_web.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../utils/responsive.dart';

class ModuleCleaningPlanningScreen
    extends GetView<ModuleCleaningPlanningController> {
  ModuleCleaningPlanningScreen({super.key});
  final ModuleCleaningPlanningController controller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Preventive Check Point'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
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
                        child: ModuleCleaningPlanningWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
