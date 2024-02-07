import 'package:cmms/app/compliance/compliance_controller.dart';
import 'package:cmms/app/compliance/views/mobile/compliance_mobile.dart';
import 'package:cmms/app/compliance/views/web/compliance_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class ComplianceScreen extends GetView<ComplianceController> {
  ComplianceScreen({super.key});
  final controller = Get.find<ComplianceController>();

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
                  : HomeDrawer(),
              Expanded(
                child: Column(
                  children: [
                    if (Responsive.isMobile(context))
                      Expanded(
                        child: ComplianceMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: ComplianceWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
