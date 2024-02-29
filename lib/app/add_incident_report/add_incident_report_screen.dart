import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/add_incident_report/view/web/add_incident_report_content_web.dart';
import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddIncidentReportScreen extends GetView<AddIncidentReportController> {
  AddIncidentReportScreen({Key? key});
  final homecontroller = Get.find<HomeController>();

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      body: Obx(
        () => Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 450),
              margin: EdgeInsets.only(
                  left: homecontroller.menuButton.value ? 250.0 : 70.0),
              child: Column(
                  //
                  children: [
                    // if (Responsive.isMobile(context))
                    //   Expanded(
                    //     child: IncidentReportMobile(),
                    //   ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: AddIncidentReportContentWeb(),
                      ),
                  ]),
            ),
            AnimatedPositioned(
                child: HomeDrawer(), duration: Duration(milliseconds: 450))
          ],
        ),
      ),
    );

    ///
  }
}
