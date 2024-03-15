import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/add_job/views/mobile/add_job_content_mobile.dart';
import 'package:cmms/app/add_job/views/web/add_job_content_web.dart';
import '../add_job_controller.dart';

class AddJobScreen extends GetView<AddJobController> {
  AddJobScreen({super.key});
  final controller = Get.find<AddJobController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "Add Job",
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
                              child: AddJobContentMobile(),
                            ),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: AddJobContentWeb(),
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
