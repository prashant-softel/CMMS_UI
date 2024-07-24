import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_controller_details.dart';
import 'package:cmms/app/plant_stock_report_details/view/plant_stock_report_content_web_details.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../utils/responsive.dart';

class PlantStockReportDetailsScreen extends GetView<PlantStockReportDetailsController> {
  PlantStockReportDetailsScreen({super.key});
  final controller = Get.find<PlantStockReportDetailsController>();
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
      body: Stack(
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
                          child: PlantStockReportDetailsWeb(),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  duration: Duration(milliseconds: 450),
                  child: HomeDrawer(),
                )
              : Dimens.box0
        ],
      ),
    );
  }
}
