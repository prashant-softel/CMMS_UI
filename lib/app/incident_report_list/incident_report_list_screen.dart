import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/incident_report_list/view/web/incident_report_list_content_web.dart';
import 'package:cmms/app/incident_report_list/view/web/mobile/incident_report_list_content_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentReportListScreen extends GetView<IncidentReportListController> {
  IncidentReportListScreen({super.key});
  final controller = Get.find<IncidentReportListController>();

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
                        child: IncidentReportListWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
