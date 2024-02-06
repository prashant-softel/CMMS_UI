import 'package:cmms/app/grievance_list/views/mobile/grievance_list_content_mobile.dart';
import 'package:cmms/app/grievance_list/views/web/grievance_list_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../grievance_list_controller.dart';

class GrievanceListScreen extends GetView<GrievanceController> {
  GrievanceListScreen({super.key});
  final controller = Get.find<GrievanceController>();

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
                      Expanded(child: GrievanceListContentMobile()),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: GrievanceListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
