import 'package:cmms/app/app.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_controller.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/web/escalation_matrix_list_content_web.dart';


class EscalationMatrixListScreen extends GetView<EscalationMatrixListController> {
  EscalationMatrixListScreen({Key? key});
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
                  child: EscalationMatrixListWeb(),
                ),
            ]),
      ),
    );

    ///
  }
}
