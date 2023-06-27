import 'package:cmms/app/calibration_detail/calibration_detail_controller.dart';
import 'package:cmms/app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'calibration_detail_content_web.dart';

class CalibrationDetailScreen extends GetView<CalibrationDetailController> {
  CalibrationDetailScreen({super.key});
  var homeController = Get.find<HomeController>();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Calibration Detail'),
              centerTitle: true,
              elevation: 0,
            ),
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
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: CalibrationDetailContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
