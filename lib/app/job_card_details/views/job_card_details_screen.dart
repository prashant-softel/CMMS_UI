import 'package:cmms/app/job_list/job_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'mobile/job_card_details_content_mobile.dart';
import 'web/job_card_details_content_web.dart';

class JobCardDetailsScreen extends GetView<JobListController> {
  JobCardDetailsScreen({Key? key});

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      body:

          ///
          Row(children: [
        (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? Dimens.box0
            :
            //
            HomeDrawer(),
        //   Obx(
        // () => //
        Expanded(
          child: Container(
            child: Column(
                //
                children: [
                  ///ListView
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? //
                      Expanded(
                          child: JobCardDetailsContentMobile(),
                        )
                      : //
                      Expanded(
                          child: //
                              JobCardDetailsContentWeb(),
                        ),
                ]),
          ),
        ),
      ]),
    );

    ///
  }
}
