import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_mobile.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/heading_profile_app_bar.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../preventive_list_controller.dart';

class PreventiveListScreen extends GetView<PreventiveListController> {
  PreventiveListScreen({super.key});
  final controller = Get.find<PreventiveListController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: HeadingProfileAppBar(
                title: "CheckList",
              ),

              // centerTitle: true,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawerMobile()
              : null,
      body:
          //  Obx(
          //   () =>
          Stack(
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
                        if (Responsive.isMobile(context))
                          Expanded(
                              child: PreventiveChecklistListContentMobile()),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: PreventiveChecklistListContentWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              )),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
              : Dimens.box0
        ],
      ),
      // ),
    );
  }
}
