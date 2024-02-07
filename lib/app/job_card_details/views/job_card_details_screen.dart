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
  final controller = Get.find<JobDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer()
              : null,
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
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
          )),
    );
  }
}
