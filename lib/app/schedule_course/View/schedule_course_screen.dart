// ignore_for_file: must_be_immutable

import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/schedule_course/View/schedule_course_mobile.dart';
import 'package:cmms/app/schedule_course/View/schedule_course_web.dart';
import 'package:cmms/app/schedule_course/schedule_course_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  var controller = Get.find<ScheduleController>();
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
              title: Text(
                "Schedule Course",
                style: TextStyle(
                  color: Color.fromARGB(255, 159, 156, 156),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
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
                    child: ScheduleWeb(),
                  ),
                )
              else
                Expanded(child: ScheduleMobile())
            ]),
          ),
        ]),
      ),
    );
  }
}
