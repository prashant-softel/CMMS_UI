import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_controlller.dart';
import 'package:cmms/app/attendance_list_monthwise/view/attendance_monthwise_list_mobile.dart';
import 'package:cmms/app/attendance_list_monthwise/view/attendance_monthwise_web.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceListMonthScreen extends GetView<AttendanceListMonthController> {
  AttendanceListMonthScreen({super.key});
  final controller = Get.find<AttendanceListMonthController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Attendance List",
              ),
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile() //ResponsiveSideMenu()
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
                            child: AttendanceMonthwiseListMobile(),
                          ),
                        if (Responsive.isDesktop(context))
                        Expanded(
                          child: AttendanceMonthWiseWeb(),
                        )
                      ],
                    ),
                  ),
                ],
              )),
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
