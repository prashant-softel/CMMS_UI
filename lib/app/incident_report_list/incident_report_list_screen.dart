import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/incident_report_list/view/web/incident_report_list_content_web.dart';
import 'package:cmms/app/incident_report_list/view/web/mobile/incident_report_list_content_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentReportListScreen extends GetView<IncidentReportListController> {
  IncidentReportListScreen({super.key});
  final controller = Get.find<IncidentReportListController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Incident Report",
              ),
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawerMobile()
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
                          Expanded(child: IncidentReportListMobile()),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: IncidentReportListWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              )),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
              : Dimens.box0
        ],
        //  ),
      ),
    );
  }
}
