import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/heading_profile_app_bar.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/new_permit_list/mobile/new_permit_list_mobile.dart';

import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/new_permit_list/web/new_permit_list_web.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPermitListScreen extends GetView<NewPermitListController> {
  NewPermitListScreen({super.key});
  // final NewPermitListController _controller = Get.find();
  final HomeController homecontroller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: HeadingProfileAppBar(
                  title: "Permit List",
                ),

                // centerTitle: true,
              )
            : null,
        drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? HomeDrawerMobile() //ResponsiveSideMenu()
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
                  Expanded(
                    child: Column(
                      children: [
                        if (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
                          Expanded(
                            child: NewPermitListMobile(),
                          ),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: NewPermitListWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Responsive.isDesktop(context)
                ? AnimatedPositioned(
                    duration: Duration(milliseconds: 450),
                    child: HomeDrawer(),
                  )
                : Dimens.box0
          ],
        ),
      ),
    );
  }
}
