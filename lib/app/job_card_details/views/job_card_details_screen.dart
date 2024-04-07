import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/job_card_details/views/web/job_card_details_content_web.dart';
import 'package:cmms/app/job_card_details/job_card_details_controller.dart';
import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class JobCardDetailsScreen extends GetView<JobCardDetailsController> {
  JobCardDetailsScreen({super.key});
  // final controller = Get.find<JobCardDetailsController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile() //ResponsiveSideMenu()
          : null,
      body: Obx(
        () => Stack(
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
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("Data Coming Soon......")),
                          ),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: JobCardDetailsContentWeb(),
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
                : Dimens.box0,
          ],
        ),
      ),
    );
  }
}
