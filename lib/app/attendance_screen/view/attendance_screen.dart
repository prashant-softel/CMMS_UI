import 'package:cmms/app/app.dart';
import 'package:cmms/app/attendance_screen/attendance_controller.dart';
import 'package:cmms/app/attendance_screen/view/attendance_mobile.dart';
import 'package:cmms/app/attendance_screen/view/attendance_web.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceScreen extends GetView<AttendanceController> {
  AttendanceScreen({super.key});
  final HomeController homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "Mark Attendance",
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
                            child: AttendanceMobile(),
                          ),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: AttendanceWeb(),
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
      ),
    );
  }
}
