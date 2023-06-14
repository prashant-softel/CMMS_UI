import 'package:cmms/app/calibration_view/calibration_view_controller.dart';
import 'package:cmms/app/calibration_view/view/calibration_view_content_web.dart';
import 'package:cmms/app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class CalibrationViewScreen extends GetView<CalibrationViewController> {
  CalibrationViewScreen({super.key});
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
              title: Text('Calibration History'),
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
                        child: CalibrationViewContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
