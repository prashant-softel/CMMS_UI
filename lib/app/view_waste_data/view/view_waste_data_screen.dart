import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/view_waste_data/view/view_waste_data_web.dart';
import 'package:cmms/app/view_waste_data/view_waste_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWasteDataScreen extends GetView<ViewWasteDataController> {
  ViewWasteDataScreen({super.key});
  final controller = Get.find<ViewWasteDataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawer()
          : null,
      body: Container(
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
                      child: ViewWasteDataWeb(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
