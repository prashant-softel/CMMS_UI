import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/incident_report_list/view/web/incident_report_list_content_web.dart';
import 'package:cmms/app/incident_report_list/view/web/mobile/incident_report_list_content_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// // import '../../home/home_controller.dart';
// // import '../../utils/responsive.dart';
// // import 'mobile/inventory_list_content_mobile.dart';
// // import 'web/inventory_list_content_web.dart';

// class IncidentReportListScreen extends GetView<IncidentReportListController> {
//   IncidentReportListScreen({Key? key});
//   // final HomeController controller = Get.find();

//   ///
//   @override
//   Widget build(BuildContext context) //
//   {
//     return //
//         Scaffold(
//       body:

//           Container(
//         child: Column(
//             //
//             children: [
//               // if (Responsive.isMobile(context))
//               //   Expanded(
//               //     child: IncidentReportMobile(),
//               //   ),
//               if (Responsive.isDesktop(context))
//                 Expanded(
//                   child: IncidentReportListWeb(),
//                 ),
//             ]),
//       ),
//     );

//     ///
//   }
// }

class IncidentReportListScreen extends GetView<IncidentReportListController> {
  IncidentReportListScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Incident Report List'),
              centerTitle: true,
              elevation: 0,

              // leading: IconButton(
              //   icon: Icon(Icons.arrow_back),
              //   onPressed: () => Get.back(),
              // ),
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
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
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: IncidentReportListWeb(),
                      )
                    else
                      Expanded(child: IncidentReportListMobile())
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
