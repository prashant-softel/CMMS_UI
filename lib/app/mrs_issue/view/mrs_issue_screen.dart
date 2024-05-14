import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/mrs_issue/mrs_issue_controller.dart';
import 'package:cmms/app/mrs_issue/view/mrs_issue_content_mobile.dart';
import 'package:cmms/app/mrs_issue/view/mrs_issue_content_web.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/heading_profile_app_bar.dart';
import '../../utils/responsive.dart';

class MrsIssueScreen extends GetView<MrsIssueController> {
  MrsIssueScreen({super.key});
  final controller = Get.find<MrsIssueController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Issue MRS",
              ),

              // centerTitle: true,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawerMobile()
              : null,
      body: Container(
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : Container(),
              Expanded(
                child: Column(
                  children: [
                    if (Responsive.isMobile(context))
                      Expanded(child: MrsIssueContentMobile()),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: MrsIssueContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
