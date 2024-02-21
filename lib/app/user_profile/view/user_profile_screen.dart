import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/user_profile/user_profile_controller.dart';
import 'package:cmms/app/user_profile/view/user_profile_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/responsive.dart';

class UserProfileScreen extends GetView<UserProfileController> {
  UserProfileScreen({super.key});
  final controller = Get.find<UserProfileController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
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
        body: Obx(
          () => Stack(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                      left: homecontroller.menuButton.value ? 250.0 : 70.0),
                  width: Get.width,
                  height: Get.height,
                  child: Row(
                    children: [
                      (Responsive.isMobile(context) ||
                              Responsive.isTablet(context))
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
                                child: UserProfileContentWeb(),
                              )
                          ],
                        ),
                      ),
                    ],
                  )),
              AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
            ],
          ),
        ),
      ),
    );
  }
}
