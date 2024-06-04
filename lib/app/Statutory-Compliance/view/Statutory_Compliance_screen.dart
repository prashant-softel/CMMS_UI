
import 'package:cmms/app/Statutory-Compliance/Statutory_Compliance_controller.dart';
import 'package:cmms/app/Statutory-Compliance/view/Statutory_Compliance_content_mobile.dart';
import 'package:cmms/app/Statutory-Compliance/view/Statutory_Compliance_content_web.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class StatutoryComplianceScreen extends GetView<StatutoryComplianceController> {
  StatutoryComplianceScreen({super.key});
  final controller = Get.find<StatutoryComplianceController>();
  final homecontroller = Get.find<HomeController>();

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
                              child: StatutoryComplianceContentMobile(),
                            ),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: StatutoryComplianceContentWeb(),
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
    );
  }
}
