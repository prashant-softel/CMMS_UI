import 'package:cmms/app/add_incident_report/view/add_ir_mobile.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/add_incident_report/view/web/add_incident_report_content_web.dart';

class AddIncidentReportScreen extends GetView<AddIncidentReportController> {
  AddIncidentReportScreen({super.key});
  final controller = Get.find<AddIncidentReportController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "INCIDENT REPORT",
              ),
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile()
          : null,
      body: Responsive.isDesktop(context)
          ? Obx(
              () => Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 450),
                    margin: EdgeInsets.only(
                      left: homecontroller.menuButton.value ? 250.0 : 70.0,
                    ),
                    width: Get.width,
                    height: Get.height,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: AddIncidentReportContentWeb(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    child: HomeDrawer(),
                    duration: Duration(milliseconds: 450),
                  )
                ],
              ),
            )
          : Responsive.isMobile(context) || Responsive.isTablet(context)
              ? Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 450),
                      margin: EdgeInsets.only(
                        left: 0,
                      ),
                      width: Get.width,
                      height: Get.height,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: IRMobile(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text("Data Coming Soon ..."),
                ),
    );
  }
}
