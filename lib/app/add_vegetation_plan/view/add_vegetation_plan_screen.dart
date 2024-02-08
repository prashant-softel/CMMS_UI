import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_controller.dart';
import 'package:cmms/app/add_vegetation_plan/view/add_vegetation_plan_web.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVegetationPlanScreen
    extends GetView<AddVegetationPlanController> {
  AddVegetationPlanScreen({super.key});
  final AddVegetationPlanController controller = Get.find();

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
              title: Text('Add Vegetation Plan'),
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
                        child: AddVegetationPlanWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
