import 'package:cmms/app/job_card_details/views/mobile/job_card_details_content_mobile.dart';
import 'package:cmms/app/job_card_details/views/web/job_card_details_content_web.dart';
import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class JobCardDetailsScreen extends GetView<JobDetailsController> {
  JobCardDetailsScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Job Card Details'),
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
          Container(
              height: Get.height,
              width: Get.width,
              child: Row(
                children: [
                  (Responsive.isMobile(context) || Responsive.isTablet(context))
                      ? Dimens.box0
                      : HomeDrawer(),
                  Expanded(
                    child: Column(
                      children: [
                        if (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
                          Expanded(
                            child: JobCardDetailsContentMobile(),
                          ),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: JobCardDetailsContentWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              )),
    );

    /// build ends
  }

  /// class ends
}
