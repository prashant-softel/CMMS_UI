import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomVegetationDialog extends GetView<VegExecutionController> {
  final int id;
  final String title;
  final int? ptw_id;
  final int? starttype;
  CustomVegetationDialog({
    required this.id,
    required this.title,
    this.starttype,
    this.ptw_id,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(starttype == 2 || starttype == 3 ? Icons.close : Icons.start,
              size: 35,
              color: starttype == 2 || starttype == 3
                  ? ColorValues.closeColor
                  : ColorValues.startColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: starttype == 1
                    ? 'Are you sure you want to start the schedule for '
                    : starttype == 2
                        ? 'Are you sure you want to close the Schedule for MCS'
                        : starttype == 3
                            ? 'Are you sure you want to close the Execution for '
                            : 'Are you sure you want to start the execution for ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      color: ColorValues.appDarkBlueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  starttype == 1
                      ? controller.startVegExecutionScheduleButton(
                          scheduleID: id)
                      : starttype == 2
                          ? controller.endVegScheduleExecutionButton(
                              scheduleID: id,
                              ptw_id: ptw_id,
                            )
                          : starttype == 3
                              ? controller.endVegExecutionButton()
                              : controller.startVegExecutionButton();
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      );
    }));
  }
}
