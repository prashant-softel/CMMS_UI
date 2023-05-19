import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../job_card_details_controller.dart';
import 'mobile/job_card_details_content_mobile.dart';
import 'web/job_card_details_content_web.dart';

class JobCardDetailsScreen extends GetView<JobCardDetailsController> {
  JobCardDetailsScreen({Key? key});

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      resizeToAvoidBottomInset: false,
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
