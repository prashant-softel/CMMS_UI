import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/view_incident_report/view/web/mobile/view_incident_report_content_mobile.dart';
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
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('View Incident Report'),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
            ),
      // drawer: //
      //     (Responsive.isMobile(context) || Responsive.isTablet(context))
      //         ? HomeDrawer() //ResponsiveSideMenu()
      //         : null,
      body: Container(
        child: Column(
            //
            children: [
              if (Responsive.isMobile(context))
                Expanded(
                  child: ViewIncidentReportMobile(),
                ),
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
