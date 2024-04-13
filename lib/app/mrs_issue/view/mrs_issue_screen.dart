import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/mrs_issue/mrs_issue_controller.dart';
import 'package:cmms/app/mrs_issue/view/mrs_issue_content_web.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/responsive.dart';

class MrsIssueScreen extends GetView<MrsIssueController> {
  MrsIssueScreen({super.key});
  final controller = Get.find<MrsIssueController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer()
              : null,
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : Container(),
              Expanded(
                child: Column(
                  children: [
                    if (Responsive.isMobile(context))
                      Expanded(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Data Coming Soon......")),
                      ),
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
