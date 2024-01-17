import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
// import 'package:cmms/app/training_courses/training_course_controller.dart';
import 'package:cmms/app/training_courses/views/mobile/training_course_mobile.dart';
import 'package:cmms/app/training_courses/views/web/training_course_web.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TrainingCourseScreen extends StatelessWidget {
  TrainingCourseScreen({Key? key}) : super(key: key);

  // var controller = Get.find<TrainingCourseController>();

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
              title: Text('Training Courses'),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
            ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Row(children: [
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? Dimens.box0
              : HomeDrawer(),
          Expanded(
            child: Column(children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: KeyedSubtree(
                    key: UniqueKey(),
                    child: TrainingCourseWeb(),
                  ),
                )
              else
                Expanded(child: TrainingCourseMobile())
            ]),
          ),
        ]),
      ),
    );
  }
}
