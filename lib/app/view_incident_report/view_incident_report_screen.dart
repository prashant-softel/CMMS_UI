import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_incident_report/view/web/mobile/view_incident_report_content_mobile.dart';
import 'package:cmms/app/view_incident_report/view/web/view_incident_report_content_web.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewIncidentReportScreen extends GetView<ViewIncidentReportController> {
  ViewIncidentReportScreen({super.key});
  final controller = Get.find<ViewIncidentReportController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
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
        body: Obx(
          () => Stack(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                      left: homecontroller.menuButton.value ? 250.0 : 70.0),
                  width: Get.width,
                  height: Get.height,
                  child: Row(
                    children: [
                      // (Responsive.isMobile(context) || Responsive.isTablet(context))
                      //     ? Dimens.box0
                      //     : HomeDrawer(),
                      Expanded(
                        child: Column(
                          children: [
                            if (Responsive.isMobile(context))
                              Expanded(
                                child: ViewIncidentReportMobile(),
                              ),
                            if (Responsive.isDesktop(context))
                              Expanded(
                                child: ViewIncidentReportContentWeb(),
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
  }
}
