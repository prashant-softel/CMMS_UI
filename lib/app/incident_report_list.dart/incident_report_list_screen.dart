import 'package:cmms/app/app.dart';
import 'package:cmms/app/incident_report_list.dart/view/web/incident_report_list_content_web.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../home/home_controller.dart';
// import '../../utils/responsive.dart';
// import 'mobile/inventory_list_content_mobile.dart';
// import 'web/inventory_list_content_web.dart';

class IncidentReportListScreen extends GetView<HomeController> {
  IncidentReportListScreen({Key? key});
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
                  child: IncidentReportListWeb(),
                ),
            ]),
      ),
    );

    ///
  }
}
