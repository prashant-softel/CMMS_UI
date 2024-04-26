import 'package:cmms/app/view_water_data/view/view_water_data_web.dart';
import 'package:cmms/app/view_water_data/view_water_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../utils/responsive.dart';

class ViewWaterDataScreen extends GetView<ViewWaterDataController> {
  ViewWaterDataScreen({super.key});
  final controller = Get.find<ViewWaterDataController>();

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
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              // (Responsive.isMobile(context) || Responsive.isTablet(context))
              //     ? Dimens.box0
              //     : HomeDrawer(),
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
                        child: ViewWaterDataWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
