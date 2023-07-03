import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/models/job_model.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../utils/app_constants.dart';
import '../../utils/responsive.dart';
import '../../widgets/custom_elevated_button.dart';
import 'JobDetailsMobileView.dart';
import 'JobDetailsWebView.dart';
import 'widgets/job_detail_field.dart';
import 'widgets/job_detail_multi_value_field.dart';
import 'widgets/ptw.dart';

class JobDetailsScreen extends GetView<JobDetailsController> {
  JobDetailsScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
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
        )
      ),
    );

    /// build ends
  }

  /// class ends
}



