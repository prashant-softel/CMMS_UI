import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/web/add_escalation_matrix_content_web.dart';
// import '../../home/home_controller.dart';
// import '../../utils/responsive.dart';
// import 'mobile/inventory_list_content_mobile.dart';
// import 'web/inventory_list_content_web.dart';

class AddEscalationMatrixScreen extends GetView<AddEscalationMatrixController> {
  AddEscalationMatrixScreen({Key? key});
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
            children: [
              // if (Responsive.isMobile(context))
              //   Expanded(
              //     child: IncidentReportMobile(),
              //   ),
              if (Responsive.isDesktop(context))
                Expanded(
                  child: AddEscalationMatrixContentWeb(),
                ),
            ]),
      ),
    );

    ///
  }
}
