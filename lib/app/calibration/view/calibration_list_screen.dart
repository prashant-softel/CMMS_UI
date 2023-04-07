import 'package:cmms/app/calibration/view/calibration_list_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive.dart';
import '../calibration_list_controller.dart';

class CalibrationListScreen extends GetView<CalibrationListController> {
  CalibrationListScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: CalibrationListContentWeb(),
              )
          ],
        ),
      ),
    );
  }
}
