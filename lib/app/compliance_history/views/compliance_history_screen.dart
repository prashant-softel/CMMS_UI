import 'package:cmms/app/compliance_history/compliance_history_controller.dart';
import 'package:cmms/app/compliance_history/views/mobile/compliance_history_mobile.dart';
import 'package:cmms/app/compliance_history/views/web/compliance_history_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class ComplianceHistoryScreen extends GetView<ComplianceHistoryController> {
  ComplianceHistoryScreen({super.key});
  final controller = Get.find<ComplianceHistoryController>();

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
                        child: ComplianceHistoryMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: ComplianceHistoryWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
