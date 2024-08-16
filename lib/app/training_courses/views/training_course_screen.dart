import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/training_courses/training_course_controller.dart';
import 'package:cmms/app/training_courses/views/mobile/training_course_mobile.dart';
import 'package:cmms/app/training_courses/views/web/training_course_web.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:get/get.dart';

class TrainingCourseScreen extends GetView<TrainingController> {
  TrainingCourseScreen({super.key});
  final controller = Get.find<TrainingController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Training Course",
              ),
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile()
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
                          child: TrainingCourseMobile(),
                        ),
                      if (Responsive.isDesktop(context))
                        Expanded(
                          child: TrainingCourseWeb(),
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
