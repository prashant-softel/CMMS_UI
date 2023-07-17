import 'package:cmms/app/app.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/view_incident_report/view/web/view_incident_report_content_web.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../home/home_controller.dart';
// import '../../utils/responsive.dart';
// import 'mobile/inventory_list_content_mobile.dart';
// import 'web/inventory_list_content_web.dart';

class ViewIncidentReportScreen extends GetView<ViewIncidentReportController> {
  ViewIncidentReportScreen({Key? key});
  // final HomeController controller = Get.find();
  

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      body:
           
          Container(
        child: Column(
            //
            children: [
              // if (Responsive.isMobile(context))
              //   Expanded(
              //     child: IncidentReportMobile(),
              //   ),
              if (Responsive.isDesktop(context))
                Expanded(
                  child: ViewIncidentReportContentWeb(),
                ),
            ]),
      ),
    );

    ///
  }
}
