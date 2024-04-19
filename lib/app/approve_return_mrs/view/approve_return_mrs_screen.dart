import 'package:cmms/app/approve_return_mrs/approve_return_mrs_controller.dart';
import 'package:cmms/app/approve_return_mrs/view/approve_return_mrs_content_mobile.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/mobile_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'approve_return_mrs_content_web.dart';

class ApproveReturnMrsScreen extends GetView<ApproveReturnMrsController> {
  ApproveReturnMrsScreen({super.key});
  final controller = Get.find<ApproveReturnMrsController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Details",
              ),

              // centerTitle: true,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawerMobile()
              : null,
      body: Stack(
        children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 450),
              margin: EdgeInsets.only(
                left: Responsive.isDesktop(context)
                    ? homecontroller.menuButton.value
                        ? 250.0
                        : 70.0
                    : 0,
              ),
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
                            child: ApproveReturnMrsViewContentMobile(),
                          ),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: ApproveReturnMrsContentWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              )),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
              : Dimens.box0,
        ],
      ),
    );
  }
}
