import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'JobDetailsMobileView.dart';
import 'JobDetailsWebView.dart';

class JobDetailsScreen extends GetView<JobDetailsController> {
  JobDetailsScreen({super.key});
  final homecontroller = Get.find<HomeController>();

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? null
            : AppBar(
                title: Text('Job Details'),
                centerTitle: true,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
              ),
        drawer: //
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? HomeDrawer() //ResponsiveSideMenu()
                : null,
        body:
            //
            Obx(
          () => Stack(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                      left: homecontroller.menuButton.value ? 250.0 : 70.0),
                  height: Get.height,
                  width: Get.width,
                  child: Row(
                    children: [
                      // (Responsive.isMobile(context) ||
                      //         Responsive.isTablet(context))
                      //     ? Dimens.box0
                      //     : HomeDrawer(),
                      Expanded(
                        child: Column(
                          children: [
                            if (Responsive.isMobile(context) ||
                                Responsive.isTablet(context))
                              Expanded(
                                child: JobDetailsMobileView(),
                              ),
                            if (Responsive.isDesktop(context))
                              Expanded(
                                child: JobDetailsWebView(),
                              )
                          ],
                        ),
                      ),
                    ],
                  )),
              AnimatedPositioned(
                duration: Duration(milliseconds: 450),
                child: HomeDrawer(),
              ),
            ],
          ),
        ),
      ),
    );

    /// build ends
  }

  /// class ends
}
