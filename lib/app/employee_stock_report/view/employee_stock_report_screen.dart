import 'package:cmms/app/employee_stock_report/employee_stock_report_controller.dart';
import 'package:cmms/app/employee_stock_report/view/employee_stock_report_content_mobile.dart';
import 'package:cmms/app/employee_stock_report/view/employee_stock_report_content_web.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';

class EmployeeStockReportScreen extends GetView<EmployeeStockReportController> {
  EmployeeStockReportScreen({super.key});
  final controller = Get.find<EmployeeStockReportController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Employee Report",
              ),

              // centerTitle: true,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawerMobile()
              : null,
      body:
          //  Obx(
          //   () =>
          Stack(
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
                  (Responsive.isMobile(context) || Responsive.isTablet(context))
                      ? Dimens.box0
                      : Container(),
                  Expanded(
                    child: Column(
                      children: [
                        if (Responsive.isMobile(context))
                          Expanded(child: EmployeeSockContentMobile()),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: EmployeeStockReportContentWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              )),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
              : Dimens.box0
        ],
      ),
      //),
    );
  }
}
