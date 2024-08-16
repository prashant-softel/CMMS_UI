import 'package:cmms/app/add_training_course/add_course_controller.dart';
import 'package:cmms/app/add_training_course/view/add_course_mobile.dart';
import 'package:cmms/app/add_training_course/view/add_course_web.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseScreen extends GetView<AddCourseController> {
  AddCourseScreen({super.key});
  final controller = Get.find<AddCourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Add Course",
              ),
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile()
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
                      child: AddCourseMobile(),
                    ),
                  if (Responsive.isDesktop(context))
                    Expanded(
                      child: AddCourseWeb(),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
