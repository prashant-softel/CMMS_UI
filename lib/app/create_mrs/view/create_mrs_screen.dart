import 'package:cmms/app/create_mrs/create_mrs_controller.dart';
import 'package:cmms/app/create_mrs/view/create_mrs_content_mobile.dart';
import 'package:cmms/app/create_mrs/view/create_mrs_content_web.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/heading_profile_app_bar.dart';
import '../../utils/responsive.dart';

class CreateMrsScreen extends GetView<CreateMrsController> {
  CreateMrsScreen({super.key});
  final controller = Get.find<CreateMrsController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "Add MRS",
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
                        Expanded(child: AddMrsContentMobile()),
                      if (Responsive.isDesktop(context))
                        Expanded(
                          child: CreateMrsContentWeb(),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
              : Dimens.box0
        ],
      ),
    );
  }
}
