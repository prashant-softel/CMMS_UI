import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../utils/responsive.dart';
import '../edit_job_controller.dart';
import 'mobile/edit_job_content_mobile.dart';
import 'web/edit_job_content_web.dart';

class EditJobScreen extends GetView<EditJobController> {
  EditJobScreen({super.key});
  final controller = Get.find<EditJobController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "Edit Job",
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
                          if (Responsive.isMobile(context) ||
                              Responsive.isTablet(context))
                            Expanded(
                              child: EditJobContentMobile(),
                            ),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: EditJobContentWeb(),
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
