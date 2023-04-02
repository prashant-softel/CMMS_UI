import 'package:cmms/app/job_list/views/mobile/job_list_content_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../utils/responsive.dart';
import 'web/job_list_content_web.dart';

class JobListScreen extends StatelessWidget {
  JobListScreen({Key? key});

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
            //
            children: [
              ///ListView
              if (Responsive.isMobile(context))
                Expanded(
                  child: JobListContentMobile(),
                ),

              if (Responsive.isDesktop(context))
                Container(
                  height: Get.height * 0.99,
                  width: Get.width * 0.99,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeDrawer(),
                        JobListContentWeb(),
                      ]),
                ),
            ]),
      ),
    );

    ///
  }
}
