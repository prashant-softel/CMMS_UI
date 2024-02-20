import 'package:cmms/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

import 'package:cmms/app/add_job/views/mobile/add_job_content_mobile.dart';
import 'package:cmms/app/add_job/views/web/add_job_content_web.dart';
import '../add_job_controller.dart';

class AddJobScreen extends GetView<AddJobController> {
  AddJobScreen({super.key});
  final controller = Get.find<AddJobController>();
  final homecontroller = Get.find<HomeController>();

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
                                child: AddJobContentMobile(),
                              ),
                            if (Responsive.isDesktop(context))
                              Expanded(
                                child: AddJobContentWeb(),
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
