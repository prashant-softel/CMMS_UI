import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive.dart';
import 'mobile/job_card_content_mobile.dart';
import 'web/job_card_content_web.dart';

class JobCardScreen extends GetView<JobListController> {
  JobCardScreen({Key? key});

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      body:
          //   Obx(
          // () => //
          Container(
        child: Column(
            //
            children: [
              ///ListView
              if (Responsive.isMobile(context))
                Expanded(
                  child: JobCardContentMobile(),
                ),

              if (Responsive.isDesktop(context))
                Expanded(
                  child: //
                      JobCardContentWeb(),
                ),
            ]),
      ),
    );

    ///
  }
}
