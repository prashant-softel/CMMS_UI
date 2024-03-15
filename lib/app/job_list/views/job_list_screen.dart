import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/job_list/views/mobile/job_list_content_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import '../job_list_controller.dart';
import 'web/job_list_content_web.dart';

class JobListScreen extends GetView<JobListController> {
  JobListScreen({super.key});
  final controller = Get.find<JobListController>();
  final HomeController homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: (Responsive.isMobile(context) || Responsive.isDesktop(context))
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "Job List",
                ),

                // centerTitle: true,
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
                    (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
                        ? Dimens.box0
                        : Container(),
                    Expanded(
                      child: Column(
                        children: [
                          if (Responsive.isMobile(context))
                            Expanded(
                              child: JobListContentMobile(),
                            ),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: JobListContentWeb(),
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
      ),
    );
  }
}
