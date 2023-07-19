import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/add_incident_report/view/web/add_incident_report_content_web.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddIncidentReportScreen extends GetView<AddIncidentReportController> {
  AddIncidentReportScreen({Key? key});
  

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
                  child: AddIncidentReportContentWeb(),
                ),
            ]),
      ),
    );

    ///
  }
}
