import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:cmms/app/job_list/views/mobile/job_list_content_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive.dart';
import 'web/job_list_content_web.dart';

class JobListScreen extends GetView<JobListController> {
  JobListScreen({Key? key});

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
                  child: JobListContentMobile(),
                ),

              if (Responsive.isDesktop(context))
                Expanded(
                  child: //
                      JobListContentWeb(),
                ),
            ]),
      ),
    );

    ///
  }
}
